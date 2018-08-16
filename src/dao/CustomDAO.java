package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
