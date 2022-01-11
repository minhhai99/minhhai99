package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.bean.Flower;
import model.bean.TypeFlower;
import util.DBConnectionUtil;
import util.DefineUtil;

public class FlowerDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ArrayList<Flower> getItems() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id \r\n"
				+ " ORDER BY f.id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				//Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public int addItem(Flower item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="INSERT INTO `flowers`(`name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`) VALUES (? , ? , ? , ? , ? , ? , ? , ? , ?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getPrice());
			pst.setString(3, item.getPreview_text());
			pst.setString(4, item.getDetail_text());
			pst.setString(5, item.getPicture());
			pst.setTimestamp(6, item.getDate_create());
			pst.setInt(7, item.getCounter());
			pst.setInt(8, 0);
			pst.setInt(9, item.getTypeFlower().getId());
			
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


	public Flower getItem(int id) {
		Flower item = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type` FROM `flowers` WHERE id = ? ";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public int editItem(Flower item) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `flowers` SET `name`= ? ,`price`= ? ,`preview_text`= ? ,`detail_text`= ? ,`picture`= ? ,`id_cat`= ? ,`id_type`= ?  WHERE id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setInt(2, item.getPrice());
			pst.setString(3, item.getPreview_text());
			pst.setString(4, item.getDetail_text());
			pst.setString(5, item.getPicture());
			pst.setInt(6, 0);
			pst.setInt(7, item.getTypeFlower().getId());
			pst.setInt(8, item.getId());
			
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
		String sql ="DELETE FROM `flowers` WHERE id = ?";
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


	public ArrayList<Flower> getItemsNB(int number1) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`"
				+ " FROM `flowers` ORDER BY counter DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number1);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				//Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsSell(int number2) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
//		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`, c.name, t.name FROM `flowers` AS f \r\n"
//				+ "INNER JOIN categories AS c ON f.id_cat=c.id\r\n"
//				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id WHERE id_cat= 7 ORDER BY f.id DESC LIMIT ?";
		String sql ="SELECT `id_flower`,f.name, f.price,f.picture, COUNT(*) AS count FROM `orderdetail` AS o INNER JOIN flowers AS f ON o.id_flower = f.id\r\n"
				+ "GROUP BY id_flower ORDER BY count DESC LIMIT  ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number2);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id =rs.getInt("id_flower");
				String name = rs.getString("f.name");
				int price= rs.getInt("f.price");
				String picture = rs.getString("f.picture");
				Flower item = new Flower(id, name, 0, price, picture, null, null, null, null, null);
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


	public ArrayList<Flower> getItemsPB(int number3) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type` FROM `flowers`"
				+ " WHERE price < 200000 ORDER BY id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number3);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsNew(int number4) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id\r\n"
				+ "ORDER BY f.id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number4);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
//				Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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
	
	public ArrayList<Flower> getItemsN(int number5) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id\r\n"
				+ "ORDER BY f.id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number5);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				//Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsBYType(int typeID) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id"
				+ " WHERE id_type= ? ORDER BY f.id DESC";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, typeID);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
//				Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsBYCat() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT `id_flower`,f.name, f.price,f.picture, COUNT(*) AS count FROM `orderdetail` AS o INNER JOIN flowers AS f ON o.id_flower = f.id\r\n"
				+ "GROUP BY id_flower ORDER BY count DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id =rs.getInt("id_flower");
				String name = rs.getString("f.name");
				int price= rs.getInt("f.price");
				String picture = rs.getString("f.picture");
				Flower item = new Flower(id, name, 0, price, picture, null, null, null, null, null);
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


	public ArrayList<Flower> getRelateItem(Flower flowerD, int number) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`,`id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id\r\n"
				+ "WHERE id_type= ? && f.id != ? ORDER BY f.id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, flowerD.getTypeFlower().getId());
			pst.setInt(2, flowerD.getId());
			pst.setInt(3, number);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
//				Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public void increaseView(int id) {
		conn = DBConnectionUtil.getConnection();
		String sql ="UPDATE `flowers` SET `counter`= counter + 1 WHERE id = ?";
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


	public ArrayList<Flower> getItemsN1(int number5) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id\r\n"
				+ "ORDER BY RAND() LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number5);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
//				Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsN2(int number6) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id\r\n"
				+ "ORDER BY RAND() LIMIT  ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number6);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
//				Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsT() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type` FROM `flowers`"
				+ " WHERE price < 200000 ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsH() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`"
				+ " FROM `flowers` WHERE price > 200000 AND price < 500000 ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsB() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`"
				+ " FROM `flowers` WHERE price > 500000 AND price < 1000000 ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsTW() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`"
				+ " FROM `flowers` WHERE price > 1000000 AND price < 2000000 ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsF() {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_cat`, `id_type`"
				+ " FROM `flowers` WHERE price > 2000000 ORDER BY id DESC";
		try {
			st= conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsMostView(int number6) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`"
				+ " FROM `flowers` ORDER BY counter DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number6);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				//Category category = new Category(rs.getInt("id_cat"), rs.getString("c.name"));
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public ArrayList<Flower> getItemsPopular(int number7) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT `id`, `name`, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type` FROM `flowers`"
				+ " WHERE price < 200000 ORDER BY id DESC LIMIT ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, number7);
			rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int price= rs.getInt("price");
				String preview_text = rs.getString("preview_text");
				String detail_text = rs.getString("detail_text");
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				int counter = rs.getInt("counter");
				//Category category = new Category(rs.getInt("id_cat"), null);
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), null);
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


	public int numberOfItems() {
		conn = DBConnectionUtil.getConnection();
		String sql ="SELECT COUNT(*) AS count FROM `flowers`";
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


	public ArrayList<Flower> getItemsPagination(int offset) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`, `id_type`, t.name FROM `flowers` AS f \r\n"
				+ " INNER JOIN typeflowers AS t ON f.id_type=t.id "
				+ " ORDER BY f.id DESC LIMIT ?, ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
					
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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

	public ArrayList<Flower> getItemsSearch(String search) {
		ArrayList<Flower> items = new ArrayList<>();
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT f.id, f.name, `price`, `preview_text`, `detail_text`, `picture`, `date_create`, `counter`,`id_type`, t.name FROM `flowers` AS f \r\n"
				+ "INNER JOIN typeflowers AS t ON f.id_type=t.id"
				+ " WHERE f.name LIKE  ? \r\n"
				+ " ORDER BY f.id DESC";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%"+ search +"%");
			rs = pst.executeQuery();
					
			while(rs.next()) {
				int id = rs.getInt("f.id");
				String name = rs.getString("f.name");
				int counter = rs.getInt("counter");
				int price= rs.getInt("price"); ;
				String picture = rs.getString("picture");
				Timestamp date_create = rs.getTimestamp("date_create");
				String preview_text = rs.getString("preview_text");;
				String detail_text = rs.getString("detail_text");;
				TypeFlower typeFlower = new TypeFlower(rs.getInt("id_type"), rs.getString("t.name"));
				Flower item = new Flower(id, name, counter, price, picture, date_create, preview_text, detail_text, null, typeFlower);
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


}
