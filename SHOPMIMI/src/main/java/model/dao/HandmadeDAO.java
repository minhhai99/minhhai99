package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.bean.Handmade;
import util.DBConnectionUtil;

public class HandmadeDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public ArrayList<Handmade> getItems() {
		ArrayList<Handmade> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat` FROM `handmade`"
				+ " ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				int id_cat = rs.getInt("id_cat");
				Handmade item = new Handmade(id, name, counter, price, picture, date_create, preview_text, detail_text, id_cat);
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
	public int addItem(Handmade item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `handmade`(`name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`)"
				+ " VALUES ( ? , ? , ? , ? , ? , ?, ? , ? )";
		try {
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, item.getName());
			pst.setInt(2, item.getPrice());
			pst.setString(3, item.getPreview_text());
			pst.setString(4, item.getDetail_text());
			pst.setString(5, item.getPicture());
			pst.setTimestamp(6, item.getDate_create());
			pst.setInt(7, item.getCounter());
			pst.setInt(8, item.getId_cat());
			
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
	public Handmade getItem(int id) {
		Handmade item = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat` FROM `handmade` WHERE id = ? ";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); 
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				int id_cat = rs.getInt("id_cat");
				item = new Handmade(id, name, counter, price, picture, date_create, preview_text, detail_text, id_cat);
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
		return item;
	}
	public int editItem(Handmade item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `handmade` SET `name`=  ? ,`price`= ? ,`preview_text`= ? ,`detail_text`= ? ,`picture`= ? ,`id_cat`= ?  WHERE  id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getPrice());
			pst.setString(3, item.getPreview_text());
			pst.setString(4, item.getDetail_text());
			pst.setString(5, item.getPicture());
			pst.setInt(6, item.getId_cat());
			pst.setInt(7, item.getId());
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
		String sql ="DELETE FROM `handmade` WHERE id = ?";
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
	public void increaseView(int id) {
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `handmade` SET `counter`= counter + 1 WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			pst.executeUpdate();
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
		
	}
	public ArrayList<Handmade> getRelateItem(Handmade item, int number) {
		ArrayList<Handmade> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat` FROM `handmade`"
				+ " WHERE id_cat= ? && id != ? ORDER BY id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, item.getId_cat());
			pst.setInt(2, item.getId());
			pst.setInt(3, number);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				int id_cat = rs.getInt("id_cat");
				Handmade ite = new Handmade(id, name, counter, price, picture, date_create, preview_text, detail_text, id_cat);
				items.add(ite);
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
	
}
