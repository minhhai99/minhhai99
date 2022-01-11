package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Order;
import util.DBConnectionUtil;

public class OrderDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	public ArrayList<Order> getItems() {
		ArrayList<Order> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `order` ORDER BY id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id =  rs.getInt("id");
				int idUser = rs.getInt("iduser");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String display_name = rs.getString("display_name");
				String note = rs.getString("note");
				int quanty = rs.getInt("quanty");
				double total = rs.getDouble("total");
				Order item = new Order(id, idUser, phone, address, email, display_name, note, quanty, total);
				items.add(item);
			}
		} catch (SQLException e) {
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
	public int delItem(int id) {
		
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="DELETE FROM `order` WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
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
	public Order getItem(int id) {
		Order item = null;
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT * FROM `order` WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				int idUser = rs.getInt("iduser");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String display_name = rs.getString("display_name");
				String note = rs.getString("note");
				int quanty = rs.getInt("quanty");
				double total = rs.getDouble("total");
				item = new Order(id, idUser, phone, address, email, display_name, note, quanty, total);
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
	public int editItem(Order item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `order` SET `iduser`= ?  WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, item.getIdUser());
//			pst.setString(2, item.getAddress());
//			pst.setString(3, item.getEmail());
//			pst.setString(4, item.getDisplay_name());
//			pst.setInt(5, item.getQuanty());
//			pst.setDouble(6, item.getTotal());
//			pst.setString(7, item.getNote());
			pst.setInt(2 , item.getId());
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
	public int addItem(Order item) {
		//int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `order`(`iduser`, `phone`, `address`, `email`, `display_name`, `quanty`, `total`, `note`) VALUES ( ? , ? , ? , ?, ? , ? , ? , ?)";
		try {
			pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pst.setInt(1, item.getIdUser());
			pst.setString(2, item.getPhone());
			pst.setString(3, item.getAddress());
			pst.setString(4, item.getEmail());
			pst.setString(5, item.getDisplay_name());
			pst.setInt(6, item.getQuanty());
			pst.setDouble(7, item.getTotal());
			pst.setString(8, item.getNote());
			pst.executeUpdate();
			rs = pst.getGeneratedKeys();
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
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
		
		return 0;
	}
	public int numberOfItem() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `order`";
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
	public ArrayList<Order> getItemsPagination(int offset) {
		ArrayList<Order> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql="SELECT * FROM `order` ORDER BY id DESC LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, 10);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id =  rs.getInt("id");
				int idUser = rs.getInt("iduser");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String display_name = rs.getString("display_name");
				String note = rs.getString("note");
				int quanty = rs.getInt("quanty");
				double total = rs.getDouble("total");
				Order item = new Order(id, idUser, phone, address, email, display_name, note, quanty, total);
				items.add(item);
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
		
		return items;
	}
	
}
