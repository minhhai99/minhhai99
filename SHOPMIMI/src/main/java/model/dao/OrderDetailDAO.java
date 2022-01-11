package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Flower;
import model.bean.Order;
import model.bean.OrderDetail;
import util.DBConnectionUtil;

public class OrderDetailDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<OrderDetail> getItems() {
		ArrayList<OrderDetail> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT o.id, `id_flower`, f.name, `id_order`, d.display_name, d.email, o.quanty, o.total FROM `orderdetail`  AS o \r\n"
				+ "INNER JOIN `order` AS d ON o.id_order = d.id\r\n"
				+ "INNER JOIN `flowers` AS f ON o.id_flower = f.id ORDER BY o.id DESC";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("o.id");
//				int id_flower =  rs.getInt("id_flower");
//				int id_order =  rs.getInt("id_order");
				Order order = new Order(rs.getInt("id_order"), 0, null, null, rs.getString("d.email"), rs.getString("d.display_name"), null, 0, 0);
				Flower flower = new Flower(rs.getInt("id_flower"),rs.getString("f.name"), 0, 0, null, null, null, null, null, null);
				int quanty = rs.getInt("quanty");
				double total = rs.getDouble("total");
				
				OrderDetail item = new OrderDetail(id, flower, order, quanty, total);
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
		String sql ="DELETE FROM `orderdetail` WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
			
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
		
		return result;
	}
//	public int addItem(Flower item) {
//		int result = 0;
//		conn = DBConnectionUtil.getConnection();
//		String sql ="INSERT INTO `orderdetail`(`id_flower`, `total`) VALUES (? , ?)";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, item.getId());
//			pst.setInt(2, item.getPrice());
//			
//			result = pst.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			if(rs != null && pst != null && conn != null) {
//				try {
//					rs.close();
//					pst.close();
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		
//		return result;
//	}
	public int addItemq(OrderDetail item) {
		
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `orderdetail`( `id_flower`, `id_order`, `quanty`, `total`) VALUES  (? , ?, ? , ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, item.getFlower().getId());
			pst.setInt(2, item.getOrder().getId());
			pst.setInt(3, item.getQuanty());
			pst.setDouble(4, item.getTotal());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if( pst != null && conn != null) {
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
	public ArrayList<OrderDetail> getItem(String email) {
		ArrayList<OrderDetail> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id_flower`, f.name,f.picture,f.price, `id_order`, d.display_name, o.quanty, o.total, d.email, d.phone, d.address, d.note, d.quanty, d.total FROM `orderdetail`  AS o \r\n"
				+ "INNER JOIN `order` AS d ON o.id_order = d.id\r\n"
				+ "INNER JOIN `flowers` AS f ON o.id_flower = f.id WHERE d.email LIKE ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%"+ email +"%");
			rs = pst.executeQuery();
			while(rs.next()) {
//				int id_flower =  rs.getInt("id_flower");
//				int id_order =  rs.getInt("id_order");
				Order order = new Order(rs.getInt("id_order"), 0, rs.getString("d.phone"), rs.getString("d.address"), rs.getString("d.email"), rs.getString("d.display_name"), rs.getString("d.note"), rs.getInt("d.quanty"), rs.getInt("d.total"));
				Flower flower = new Flower(rs.getInt("id_flower"),rs.getString("f.name"), 0, rs.getInt("f.price"), rs.getString("f.picture"), null, null, null, null, null);
				int quanty = rs.getInt("o.quanty");
				double total = rs.getDouble("o.total");
				
				 OrderDetail item = new OrderDetail(0, flower, order, quanty, total);
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
	public int numberOfItem() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `orderdetail`";
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
	public ArrayList<OrderDetail> getItemsPagination(int offset) {
ArrayList<OrderDetail> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT o.id, `id_flower`, f.name,f.picture, `id_order`, d.display_name, d.email, o.quanty, o.total FROM `orderdetail`  AS o \r\n"
				+ "INNER JOIN `order` AS d ON o.id_order = d.id\r\n"
				+ "INNER JOIN `flowers` AS f ON o.id_flower = f.id ORDER BY o.id DESC LIMIT ?, ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, 10);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("o.id");
				Order order = new Order(rs.getInt("id_order"), 0, null, null, rs.getString("d.email"), rs.getString("d.display_name"), null, 0, 0);
				Flower flower = new Flower(rs.getInt("id_flower"),rs.getString("f.name"), 0, 0, rs.getString("f.picture"), null, null, null, null, null);
				int quanty = rs.getInt("quanty");
				double total = rs.getDouble("total");
				
				OrderDetail item = new OrderDetail(id, flower, order, quanty, total);
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
	public ArrayList<OrderDetail> getItemDetail(int nId) {
ArrayList<OrderDetail> items = new ArrayList<>();
		
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT`id_order`, f.name,   o.quanty, f.price, f.picture, o.total FROM `orderdetail` AS o"
				+ " INNER JOIN `order` AS d ON o.id_order = d.id\r\n"
				+ "INNER JOIN `flowers` AS f ON o.id_flower = f.id"
				+ " WHERE d.id = ? ORDER BY o.id DESC";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, nId);
			rs = pst.executeQuery();
			while(rs.next()) {
//				int id_flower =  rs.getInt("id_flower");
//				int id_order =  rs.getInt("id_order");
				Order order = new Order(rs.getInt("id_order"), 0, null, null, null, null, null, 0, 0);
				Flower flower = new Flower(0,rs.getString("f.name"), 0, rs.getInt("f.price"), rs.getString("f.picture"), null, null, null, null, null);
				int quanty = rs.getInt("o.quanty");
				double total = rs.getDouble("o.total");
				
				 OrderDetail item = new OrderDetail(0, flower, order, quanty, total);
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
