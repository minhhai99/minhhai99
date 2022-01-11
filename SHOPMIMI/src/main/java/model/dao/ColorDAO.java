package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Color;
import model.bean.Meaning;
import util.DBConnectionUtil;
import util.DefineUtil;

public class ColorDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public ArrayList<Color> getItems() {
		ArrayList<Color> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT c.id, c.name, c.picture, id_m ,m.name, m.picture FROM `color` AS c INNER JOIN meaning AS m "
				+ " ON c.id_m = m.id ORDER BY c.id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("c.id");
				String name = rs.getString("c.name");
				String picture = rs.getString("c.picture");
				Meaning meaning = new Meaning(rs.getInt("id_m"), rs.getString("m.name"), null ,  null , rs.getString("m.picture"));
				Color item = new Color(id, name, picture, meaning);
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
	public int addItem(Color item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `color`(`name`, `picture`, `id_m`) VALUES ( ? , ? , ? )";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPicture());
			pst.setInt(3, item.getMeaning().getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
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
	public Color getItem(int id) {
		Color item = null;
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT  c.name, c.picture, id_m , s.name, s.preview, s.detail, s.picture FROM `color` AS c INNER JOIN meaning AS s ON c.id_m= s.id WHERE c.id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				String name = rs.getString("c.name");
				String picture = rs.getString("c.picture");
				Meaning meaning = new Meaning(rs.getInt("id_m"),rs.getString("s.name") , rs.getString("s.detail") ,  rs.getString("s.preview") , rs.getString("s.picture"));
				item = new Color(id, name, picture, meaning);
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
	public int editItem(Color item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `color` SET `name`= ? ,`picture`= ? ,`id_m`= ? WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getPicture());
			pst.setInt(3, item.getMeaning().getId());
			pst.setInt(4, item.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
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
		String sql ="DELETE FROM `color` WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
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
	public ArrayList<Color> getItemsByMean(int catId) {
ArrayList<Color> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT c.id, c.name, c.picture, id_m , s.name, s.picture FROM `color` AS c INNER JOIN meaning AS s ON c.id_m= s.id WHERE id_m = ?"
				+ " ORDER BY c.id DESC";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, catId);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("c.id");
				String name = rs.getString("c.name");
				String picture = rs.getString("c.picture");
				Meaning meaning = new Meaning(rs.getInt("id_m"), rs.getString("s.name"), null ,  null , rs.getString("s.picture"));
				Color item = new Color(id, name, picture, meaning);
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
	public int numberOfItems() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `color`";
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
	public ArrayList<Color> getItemsPagination(int offset) {
		ArrayList<Color> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT c.id, c.name, c.picture, id_m ,m.name, m.picture FROM `color` AS c"
				+ " INNER JOIN meaning AS m ON c.id_m = m.id"
				+ " ORDER BY c.id DESC LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("c.id");
				String name = rs.getString("c.name");
				String picture = rs.getString("c.picture");
				Meaning meaning = new Meaning(rs.getInt("id_m"), rs.getString("m.name"), null ,  null , rs.getString("m.picture"));
				Color item = new Color(id, name, picture, meaning);
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
