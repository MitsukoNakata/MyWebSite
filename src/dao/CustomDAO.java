package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import base.DBManager;
import beans.CustomDataBeans;


public class CustomDAO {

	/**
	 * @author t-takeuchi
	 *
	 */

		/**
		 * パーツのカテゴリリストを取得
		 * @return <ItemDataBeans>
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

}
