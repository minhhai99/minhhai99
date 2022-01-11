package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.ApiUser;
import model.bean.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class UserDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<User> getItems() {
		ArrayList<User> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM `user` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String Email = rs.getString("Email");
				String address = rs.getString("address");
				User item = new User(id, username, password, fullname, Email, address);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && st != null && conn != null) {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return items;
	}

	public int addItem(User item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO `user`(`username`, `password`, `fullname`, `Email`, `address`, `idapi`) VALUES (? , ? , ? , ? , ?, ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,item.getName());
			pst.setString(2,item.getPassword());
			pst.setString(3,item.getFullname());
			pst.setString(4,item.getEmail());
			pst.setString(5,item.getAddress());
			pst.setInt(6,item.getApiUser().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(pst != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}

	public boolean hasUser(String username, String Email) {
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM `user` WHERE username = ? || `Email` = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, Email);
			rs = pst.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null && st != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}

	public User getItem(int id) {
		User item = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, `username`, `password`, `fullname`, `Email`, `address`, `idapi`, a.name FROM `user` AS  u\r\n"
				+ "INNER JOIN apiuser AS a ON u.idapi= a.id \r\n"
				+ "WHERE u.id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String Email = rs.getString("Email");
				String address = rs.getString("address");
				ApiUser apiUser = new ApiUser(rs.getInt("idapi"), rs.getString("a.name"));
				 item = new User(id, username, password, fullname, Email, address, apiUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null && conn != null) {
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	public int editItem(User item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE `user` SET `password`= ? ,`fullname`= ? ,`Email`= ? ,`address`= ?, `idapi` = ? WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,item.getPassword());
			pst.setString(2,item.getFullname());
			pst.setString(3,item.getEmail());
			pst.setString(4,item.getAddress());
			pst.setInt(5, item.getApiUser().getId());
			pst.setInt(6, item.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}

	public int delItem(int id) {

		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM `user` WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}

	public User existUser(String username, String password) {
		User item = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, `username`, `password`, `fullname`, `Email`, `address`, `idapi`, a.name FROM `user` AS  u\r\n"
				+ "INNER JOIN apiuser AS a ON u.idapi= a.id"
				+ " WHERE username = ? && password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("u.id");
				String fullname = rs.getString("fullname");
				String Email = rs.getString("Email");
				String address = rs.getString("address");
				ApiUser apiUser = new ApiUser(rs.getInt("idapi"), rs.getString("a.name"));
				 item = new User(id, username, password, fullname, Email, address, apiUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null && conn != null) {
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	public int numberOfItems() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `user`";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && st != null && conn != null) {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	public ArrayList<User> getItemsPagination(int offset) {
ArrayList<User> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, `username`, `password`, `fullname`, `Email`, `address`, `idapi`, a.name FROM `user` AS u\r\n"
				+ "INNER JOIN apiuser AS a ON u.idapi = a.id ORDER BY u.id DESC LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("u.id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String Email = rs.getString("Email");
				String address = rs.getString("address");
				ApiUser apiUser = new ApiUser(rs.getInt("idapi"), rs.getString("a.name"));
				User item = new User(id, username, password, fullname, Email, address, apiUser);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null && conn != null) {
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return items;
	}

	public User existAcc(String email, String password) {
		User item = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT u.id, `username`, `password`, `fullname`, `Email`, `address`, `idapi`, a.name FROM `user` AS  u\r\n"
				+ "INNER JOIN apiuser AS a ON u.idapi= a.id"
				+ " WHERE Email = ? && password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String fullname = rs.getString("fullname");
				//String Email = rs.getString("Email");
				String address = rs.getString("address");
				ApiUser apiUser = new ApiUser(rs.getInt("idapi"), rs.getString("a.name"));
				 item = new User(id, username, password, fullname, email, address, apiUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null && conn != null) {
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	public int editUser(User itemm) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE `user` SET `password`= ? ,`fullname`= ? ,`address`= ?, `idapi` = ? WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,itemm.getPassword());
			pst.setString(2,itemm.getFullname());
			pst.setString(3,itemm.getAddress());
			pst.setInt(4, itemm.getApiUser().getId());
			pst.setInt(5, itemm.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}

	public int editUserMod(User itemm) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE `user` SET `password`= ? ,`fullname`= ? ,`address`= ? WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,itemm.getPassword());
			pst.setString(2,itemm.getFullname());
			pst.setString(3,itemm.getAddress());
//			pst.setInt(4, itemm.getApiUser().getId());
			pst.setInt(4, itemm.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null && conn != null) {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return result;
	}
	

}
