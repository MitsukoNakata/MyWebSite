package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import base.DBManager;
import beans.CustomDataBeans;
import beans.ItemDataBeans;

/**
 *
 * @author t-takeuchi
 *
 */
public class ItemDAO {



	/**
	 * パーツのカテゴリリストを取得
	 * @return <ItemDataBeans>
	 * @throws SQLException
	 */
		public static ArrayList<ItemDataBeans> getTypeList() throws SQLException {
			Connection con = null;
			PreparedStatement st = null;
			try {
				con = DBManager.getConnection();

				st = con.prepareStatement("SELECT * FROM m_item_type ORDER BY id");

				ResultSet rs = st.executeQuery();

				ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

				while (rs.next()) {
					ItemDataBeans item = new ItemDataBeans();
					item.setId(rs.getInt("id"));
					item.setItemType(rs.getString("type_category"));
					item.setName(rs.getString("type_name"));
					item.setFileName(rs.getString("type_img"));
					itemList.add(item);
				}
				System.out.println("getTypeList completed");
				return itemList;
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				throw new SQLException(e);
			} finally {
				if (con != null) {
					con.close();
				}
			}
		}

		/**
		 * パーツ別のリストアップする
		 * @param パーツのカテゴリー
		 * @return <ItemDataBeans>
		 * @throws SQLException
		 */

		public static ArrayList<ItemDataBeans> getByItemType(String itemType) throws SQLException {
			Connection con = null;
			PreparedStatement st = null;
			try {
				con = DBManager.getConnection();

				if(itemType.equals("all")) {
				st = con.prepareStatement("SELECT * " +
						"FROM m_item " +
						"JOIN m_item_type " +
						"ON m_item.type_num = m_item_type.id "+
						"ORDER BY type_num,price");
				}else {
					st = con.prepareStatement("SELECT * " +
					"FROM m_item " +
					"JOIN m_item_type " +
					"ON m_item.type_num = m_item_type.id "+
					"WHERE m_item_type.type_category = ? "+
					"ORDER BY price");
					st.setString(1, itemType);
				}


				ResultSet rs = st.executeQuery();

				ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

				while (rs.next()) {
					ItemDataBeans item = new ItemDataBeans();
					item.setId(rs.getInt("id"));
					item.setTypeNum(rs.getInt("type_num"));
					item.setName(rs.getString("name"));
					item.setItemType(rs.getString("type_name"));
					item.setPrice(rs.getInt("price"));
					item.setLink(rs.getString("link"));
					item.setSoket(rs.getString("soket"));
					item.setRamType(rs.getString("ram_type"));
					itemList.add(item);
				}
				System.out.println("getAllItem completed");
				return itemList;
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				throw new SQLException(e);
			} finally {
				if (con != null) {
					con.close();
				}
			}
		}



	/**
	 * 商品IDによる商品検索
	 * @param itemId
	 * @return ItemDataBeans
	 * @throws SQLException
	 */
	public static ItemDataBeans getItemByCustomItemID(int itemId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_custom_menu WHERE id = ?");
			st.setInt(1, itemId);

			ResultSet rs = st.executeQuery();

			ItemDataBeans item = new ItemDataBeans();
			if (rs.next()) {
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setFileName(rs.getString("file_name"));
			}

			System.out.println("searching item by itemID has been completed");

			return item;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	/**
	 * 商品IDによる商品検索
	 * @param itemId
	 * @return ItemDataBeans
	 * @throws SQLException
	 */
	public static ItemDataBeans getItemByItemID(int itemId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement("SELECT * FROM m_item WHERE id = ?");
			st.setInt(1, itemId);

			ResultSet rs = st.executeQuery();

			ItemDataBeans item = new ItemDataBeans();
			if (rs.next()) {
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setFileName(rs.getString("file_name"));
			}

			System.out.println("searching item by itemID has been completed");

			return item;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品検索
	 * @param searchWord
	 * @param pageNum
	 * @param pageMaxItemCount
	 * @return
	 * @throws SQLException
	 */
	public static ArrayList<ItemDataBeans> getItemsByItemName(String searchWord, int pageNum, int pageMaxItemCount) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			int startiItemNum = (pageNum - 1) * pageMaxItemCount;
			con = DBManager.getConnection();

			if (searchWord.length() == 0) {
				// 全検索
				st = con.prepareStatement("SELECT * FROM m_item ORDER BY id ASC LIMIT ?,? ");
				st.setInt(1, startiItemNum);
				st.setInt(2, pageMaxItemCount);
			} else {
				// 商品名検索
				st = con.prepareStatement("SELECT * FROM m_item WHERE name LIKE ?  ORDER BY id ASC LIMIT ?,? ");
				st.setString(1,"%"+searchWord+"%");
				st.setInt(2, startiItemNum);
				st.setInt(3, pageMaxItemCount);
			}

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans item = new ItemDataBeans();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setFileName(rs.getString("file_name"));
				itemList.add(item);
			}
			System.out.println("get Items by itemName has been completed");
			return itemList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	/**
	 * 商品総数を取得
	 *
	 * @param searchWord
	 * @return
	 * @throws SQLException
	 */
	public static double getItemCount(String searchWord) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("select count(*) as cnt from m_item where name like ?");
			st.setString(1, "%" + searchWord + "%");
			ResultSet rs = st.executeQuery();
			double coung = 0.0;
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 新商品追加
	 *
	 * @param insertItem
	 * @return
	 * @throws SQLException
	 */
	public static int insertItem(ItemDataBeans idb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		int autoIncKey = -1;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("INSERT INTO m_item(type_num,name,price,file_name,soket,ram_type,link) VALUES(?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, idb.getTypeNum());
			st.setString(2, idb.getName());
			st.setInt(3, idb.getPrice());
			st.setString(4, idb.getFileName());
			st.setString(5, idb.getSoket());
			st.setString(6, idb.getRamType());
			st.setString(7, idb.getLink());
			st.executeUpdate();

			ResultSet rs = st.getGeneratedKeys();
			if (rs.next()) {
				autoIncKey = rs.getInt(1);
			}

			System.out.println("inserting newItem has been completed");
			return autoIncKey;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	/**
	 * 商品情報更新
	 *
	 * @param updateItem
	 * @return
	 * @throws SQLException
	 */
	public static void updateItem(ItemDataBeans idb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement("Update m_item SET name= ?, price= ?, file_name= ?, soket= ?, ram_type= ?, link= ? WHERE id = ? ");
			st.setString(1, idb.getName());
			st.setInt(2, idb.getPrice());
			st.setString(3, idb.getFileName());
			st.setString(4, idb.getSoket());
			st.setString(5, idb.getRamType());
			st.setString(6, idb.getLink());
			st.setInt(7, idb.getId());
			st.executeUpdate();
			System.out.println("update has been completed");


		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

		/**
		 * 商品削除
		 *
		 * @param deleteItem
		 * @return
		 * @throws SQLException
		 */
		public static boolean deleteItem(int itemId) throws SQLException {
			Connection con = null;
			PreparedStatement st = null;

			try {
				con = DBManager.getConnection();
				st = con.prepareStatement("DELETE from m_item WHERE id = ?");

				st.setInt(1, itemId);
				st.executeUpdate();
				System.out.println("delete item has been completed");

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				throw new SQLException(e);

			} finally {
				if (con != null) {
					con.close();
				}
			}
			return true;
		}

		/**
		 * 選択構成の合計金額取得
		 *
		 * @param deleteItem
		 * @return
		 * @throws SQLException
		 */
		public static int getTotalPrice(CustomDataBeans idb) throws SQLException {
			Connection con = null;
			PreparedStatement st = null;

			try {
				con = DBManager.getConnection();

				//選択されたパーツたちの合計金額を算出
				st = con.prepareStatement("SELECT SUM(price) FROM m_item WHERE id= ? or id= ? or id= ? or id= ? or"
						+ " id= ? or id= ? or id= ? or id= ? ");

				st.setInt(1, idb.getBase());
				st.setInt(2, idb.getCpu());
				st.setInt(3, idb.getRam());
				st.setInt(4, idb.getGraphics());
				st.setInt(5, idb.getStorage());
				st.setInt(6, idb.getOs());
				st.setInt(7, idb.getOffice());
				st.setInt(8, idb.getAssemble());
				ResultSet rs = st.executeQuery();

				int totalPrice = 0;

				if (rs.next()) {
				totalPrice = rs.getInt("SUM(price)");
				}
				System.out.println("getTotalPrice has been completed");
				return totalPrice;

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				throw new SQLException(e);
			} finally {
				if (con != null) {
					con.close();
				}
			}
		}
	}
