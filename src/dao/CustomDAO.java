package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import base.DBManager;
import beans.CustomDataBeans;


public class CustomDAO {

	/**
	 * @author t-takeuchi
	 *
	 */

		/**
		 * パーツのカテゴリリストを取得
		 * @return <CustomDataBeans>
		 * @throws SQLException
		 */
			public static CustomDataBeans getCustomItemList(int id) throws SQLException {
				Connection con = null;
				PreparedStatement st = null;
				try {
					con = DBManager.getConnection();

					st = con.prepareStatement("SELECT * FROM m_custom_menu WHERE id = ?");
					st.setInt(1, id);

					ResultSet rs = st.executeQuery();

					CustomDataBeans item = new CustomDataBeans();

					if (rs.next()) {

						item.setId(rs.getInt("id"));
						item.setCustomName(rs.getString("custom_name"));
						item.setPrice(rs.getInt("basic_price"));
						item.setBase(rs.getInt("base"));
						item.setCpu(rs.getInt("cpu"));
						item.setRam(rs.getInt("ram"));
						item.setGraphics(rs.getInt("graphics"));
						item.setStorage(rs.getInt("storage"));
						item.setOs(rs.getInt("os"));
						item.setOffice(rs.getInt("office"));
						item.setAssemble(rs.getInt("assemble"));


					}
					System.out.println("getItemList completed");
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
			 * カスタムのカテゴリリストを取得
			 * @return <CustomDataBeans>
			 * @throws SQLException
			 */
				public static ArrayList<CustomDataBeans> getCustomTypeList() throws SQLException {
					Connection con = null;
					PreparedStatement st = null;
					try {
						con = DBManager.getConnection();

						st = con.prepareStatement("SELECT * FROM m_custom_type ORDER BY id");

						ResultSet rs = st.executeQuery();

						ArrayList<CustomDataBeans> itemList = new ArrayList<CustomDataBeans>();

						while (rs.next()) {
							CustomDataBeans item = new CustomDataBeans();
							item.setCustomTypeNum(rs.getInt("id"));
							item.setCustomType(rs.getString("type"));
							itemList.add(item);
						}
						System.out.println("getCustomList completed");
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
				 * カスタムメニューリストを取得
				 * @return <CustomDataBeans>
				 * @throws SQLException
				 */

				public static ArrayList<CustomDataBeans> getByCustomType(String customType) throws SQLException {
					Connection con = null;
					PreparedStatement st = null;
					try {
						con = DBManager.getConnection();

						if(customType.equals("all")) {
						st = con.prepareStatement("SELECT * " +
								"FROM m_custom_menu " +
								"JOIN m_custom_type " +
								"ON m_custom_menu.custom_type = m_custom_type.id "+
								"ORDER BY m_custom_menu.id");
						}else {
							st = con.prepareStatement("SELECT * " +
								"FROM m_custom_menu " +
								"JOIN m_custom_type " +
								"ON m_custom_menu.custom_type = m_custom_type.id "+
								"WHERE m_custom_type.type = ? "+
								"ORDER BY m_custom_menu.basic_price");
							st.setString(1, customType);
						}


						ResultSet rs = st.executeQuery();

						ArrayList<CustomDataBeans> itemList = new ArrayList<CustomDataBeans>();

						while (rs.next()) {
							CustomDataBeans item = new CustomDataBeans();
							item.setId(rs.getInt("id"));
							item.setCustomName(rs.getString("custom_name"));
							item.setCustomType(rs.getString("type"));
							item.setPrice(rs.getInt("basic_price"));
							item.setBase(rs.getInt("base"));
							item.setCpu(rs.getInt("cpu"));
							item.setRam(rs.getInt("ram"));
							item.setGraphics(rs.getInt("graphics"));
							item.setStorage(rs.getInt("storage"));
							item.setOs(rs.getInt("os"));
							item.setOffice(rs.getInt("office"));
							item.setAssemble(rs.getInt("assemble"));
							itemList.add(item);
						}
						System.out.println("getAllCustomItem completed");
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
				 * 新商品追加
				 *
				 * @param insertItem
				 * @return
				 * @throws SQLException
				 */
				public static int insertItem(CustomDataBeans idb) throws SQLException {
					Connection con = null;
					PreparedStatement st = null;
					int autoIncKey = -1;

					try {
						con = DBManager.getConnection();

						int totalPrice = ItemDAO.getTotalPrice(idb);

						st = con.prepareStatement("INSERT INTO m_custom_menu(custom_type,custom_name, basic_price, base, cpu, ram, graphics, storage, os, office, assemble) "
								+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)",
								Statement.RETURN_GENERATED_KEYS);

						st.setInt(1, idb.getCustomTypeNum());
						st.setString(2, idb.getCustomName());
						st.setInt(3, totalPrice);
						st.setInt(4, idb.getBase());
						st.setInt(5, idb.getCpu());
						st.setInt(6, idb.getRam());
						st.setInt(7, idb.getGraphics());
						st.setInt(8, idb.getStorage());
						st.setInt(9, idb.getOs());
						st.setInt(10, idb.getOffice());
						st.setInt(11, idb.getAssemble());
						st.executeUpdate();

						ResultSet rs = st.getGeneratedKeys();
						if (rs.next()) {
							autoIncKey = rs.getInt(1);
						}

						System.out.println("inserting newCustomMenu has been completed");
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
				public static void updateItem(CustomDataBeans idb) throws SQLException {
					Connection con = null;
					PreparedStatement st = null;

					try {
						con = DBManager.getConnection();

						int totalPrice = ItemDAO.getTotalPrice(idb);

						st = con.prepareStatement("Update m_custom_menu SET custom_type= ?,custom_name= ?, basic_price= ?, base= ?, cpu= ?, ram= ?, graphics= ?, storage= ?, "
								+ "os= ?, office= ?, assemble= ? WHERE id = ? ");

						st.setInt(1, idb.getCustomTypeNum());
						st.setString(2, idb.getCustomName());
						st.setInt(3, totalPrice);
						st.setInt(4, idb.getBase());
						st.setInt(5, idb.getCpu());
						st.setInt(6, idb.getRam());
						st.setInt(7, idb.getGraphics());
						st.setInt(8, idb.getStorage());
						st.setInt(9, idb.getOs());
						st.setInt(10, idb.getOffice());
						st.setInt(11, idb.getAssemble());
						st.setInt(12, idb.getId());
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
						st = con.prepareStatement("DELETE from m_custom_menu WHERE id = ?");

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


}
