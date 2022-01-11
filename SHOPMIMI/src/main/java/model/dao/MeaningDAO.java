package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Meaning;
import util.DBConnectionUtil;
import util.DefineUtil;

public class MeaningDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public ArrayList<Meaning> getItems() {
		ArrayList<Meaning> items =  new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `meaning` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				String preview = rs.getString("preview");
				String picture = rs.getString("picture");
				Meaning item = new Meaning(id, name, detail, preview, picture);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && st != null & conn != null) {
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
	public int addItem(Meaning item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `meaning`(`name`, `detail`, `preview`, `picture`) VALUES ( ? , ? , ? , ?)";
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, item.getName());
			pst.setString(2, item.getDetail());
			pst.setString(3, item.getPreview());
			pst.setString(4, item.getPicture());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null & conn != null) {
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
	public Meaning getItem(int id) {
		Meaning item = null;
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `meaning` WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				String preview = rs.getString("preview");
				String picture = rs.getString("picture");
				item = new Meaning(id, name, detail, preview, picture);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null & conn != null) {
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
	public int editItem(Meaning item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `meaning` SET `name`= ? ,`detail`= ? ,`preview`= ? ,`picture`= ? WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, item.getName());
			pst.setString(2, item.getDetail());
			pst.setString(3, item.getPreview());
			pst.setString(4, item.getPicture());
			pst.setInt(5, item.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null & conn != null) {
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
		String sql ="DELETE FROM `meaning` WHERE id = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pst != null & conn != null) {
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
	public int numberOfItems() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `meaning`";
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
	public ArrayList<Meaning> getItemsPagination(int offset) {
		ArrayList<Meaning> items =  new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `meaning` ORDER BY id DESC LIMIT ? , ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				String preview = rs.getString("preview");
				String picture = rs.getString("picture");
				Meaning item = new Meaning(id, name, detail, preview, picture);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null & conn != null) {
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
	public ArrayList<Meaning> getItemNumber(int nId, int number) {
		ArrayList<Meaning> items =  new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `meaning` WHERE id != ? ORDER BY id DESC  LIMIT ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nId);
			pst.setInt(2, number);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				String preview = rs.getString("preview");
				String picture = rs.getString("picture");
				Meaning item = new Meaning(id, name, detail, preview, picture);
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null && pst != null & conn != null) {
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


}
