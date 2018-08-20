
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import base.DBManager;
import beans.BuyDataBeans;
import beans.ItemDataBeans;

/**
 *
 * @author m-takeuchi *
 */
public class BuyDAO {


	/**
	 * 購入情報登録処理
	 * @param bdb 購入情報
	 * @throws SQLExcseption 呼び出し元にスローさせるため
	 */
	public static int insertBuy(BuyDataBeans bdb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		int autoIncKey = -1;

		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
					"INSERT INTO t_buy(user_id,total_price,delivery_method_id,create_date) VALUES(?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, bdb.getUserId());
			st.setInt(2, bdb.getTotalPrice());
			st.setInt(3, bdb.getDeliveryMethodId());
			st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			st.executeUpdate();

			ResultSet rs = st.getGeneratedKeys();
			if (rs.next()) {
				autoIncKey = rs.getInt(1);
			}
			System.out.println("inserting buy-datas has been completed");

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
	 * 購入詳細登録処理
	 * @param bddb BuyDetailDataBeans
	 * @throws SQLException
	 * 			呼び出し元にスローさせるため
	 */
	public static void insertBuyDetail(BuyDataBeans bddb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
				    "INSERT INTO t_buy_detail(buy_id,item_total_price,custom_name,base,cpu,ram,graphics,storage,os,office,assemble) "
				    +"VALUES (?,?,?,?,?,?,?,?,?,?,?)"
				    ,Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, bddb.getBuyId());
				st.setInt(2, bddb.getTotalPrice());
				st.setString(3, bddb.getCustomName());
				st.setInt(4, bddb.getBase());
				st.setInt(5, bddb.getCpu());
				st.setInt(6, bddb.getRam());
				st.setInt(7, bddb.getGraphics());
				st.setInt(8, bddb.getStorage());
				st.setInt(9, bddb.getOs());
				st.setInt(10, bddb.getOffice());
				st.setInt(11, bddb.getAssemble());
				st.executeUpdate();
			System.out.println("inserting BuyDetail has been completed");

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
	 * 購入IDによる購入情報検索
	 * @param buyId
	 * @return BuyDataBeans
	 * 				購入情報のデータを持つJavaBeansのリスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */
	public static BuyDataBeans getBuyInfoBuyId(int buyId,int userId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_buy"
							+ " JOIN m_delivery_method"
							+ " ON t_buy.delivery_method_id = m_delivery_method.id"
							+ " WHERE t_buy.id = ? AND t_buy.user_id = ? ");
			st.setInt(1, buyId);
			st.setInt(2, userId);

			ResultSet rs = st.executeQuery();

			BuyDataBeans bdb = new BuyDataBeans();
			if (rs.next()) {
				bdb.setId(rs.getInt("id"));
				bdb.setTotalPrice(rs.getInt("total_price"));
				bdb.setBuyDate(rs.getTimestamp("create_date"));
				bdb.setDeliveryMethodId(rs.getInt("delivery_method_id"));
				bdb.setUserId(rs.getInt("user_id"));
				bdb.setDeliveryMethodPrice(rs.getInt("price"));
				bdb.setDeliveryMethodName(rs.getString("name"));
			}

			System.out.println("searching BuyInfoList by buyID has been completed");

			return bdb;
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
	 * 購入IDによる購入情報詳細検索
	 * @param buyId
	 * @return {BuyDataBeans}
	 * 				購入情報のデータを持つJavaBeansのリスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */
	public static ArrayList<BuyDataBeans> getBuyDetailListByBuyId(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT" +
					" base_item.name AS base_name," +
					" cpu_item.name AS cpu_name," +
					" ram_item.name AS ram_name," +
					" graphics_item.name AS graphics_name," +
					" storage_item.name AS storage_name," +
					" os_item.name AS os_name," +
					" office_item.name AS office_name," +
					" assemble_item.name AS assemble_name," +
					" t_buy_detail.*" +
					" FROM t_buy_detail" +
					" JOIN m_item AS base_item" +
					" ON base_item.id = t_buy_detail.base" +
					" JOIN m_item AS cpu_item" +
					" ON cpu_item.id = t_buy_detail.cpu" +
					" JOIN m_item AS ram_item" +
					" ON ram_item.id = t_buy_detail.ram" +
					" JOIN m_item AS graphics_item" +
					" ON graphics_item.id = t_buy_detail.graphics" +
					" JOIN m_item AS storage_item" +
					" ON storage_item.id = t_buy_detail.storage" +
					" JOIN m_item AS os_item" +
					" ON os_item.id = t_buy_detail.os" +
					" JOIN m_item AS office_item" +
					" ON office_item.id = t_buy_detail.office" +
					" JOIN m_item AS assemble_item" +
					" ON assemble_item.id = t_buy_detail.assemble" +
					" WHERE t_buy_detail.buy_id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();
			ArrayList<BuyDataBeans> buyDetailList = new ArrayList<BuyDataBeans>();

			while (rs.next()) {
				BuyDataBeans bddb = new BuyDataBeans();
				bddb.setId(rs.getInt("id"));
				bddb.setUserId(rs.getInt("buy_id"));
				bddb.setCustomName(rs.getString("custom_name"));
				bddb.setTotalPrice(rs.getInt("item_total_price"));
				bddb.setBaseName(rs.getString("base_name"));
				bddb.setCpuName(rs.getString("cpu_name"));
				bddb.setRamName(rs.getString("ram_name"));
				bddb.setGraphicsName(rs.getString("graphics_name"));
				bddb.setStorageName(rs.getString("storage_name"));
				bddb.setOsName(rs.getString("os_name"));
				bddb.setOfficeName(rs.getString("office_name"));
				bddb.setAssembleName(rs.getString("assemble_name"));
				buyDetailList.add(bddb);
			}

			System.out.println("searching BuyDetailList by buyID has been completed");
			return buyDetailList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	public  static ArrayList<BuyDataBeans> getBuyDataBeansByUserId(int userId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT * FROM t_buy"
							+ " JOIN m_delivery_method"
							+ " ON t_buy.delivery_method_id = m_delivery_method.id"
							+ " WHERE t_buy.user_id = ?");
			st.setInt(1, userId);

			ResultSet rs = st.executeQuery();
			ArrayList<BuyDataBeans> buyDataList = new ArrayList<BuyDataBeans>();

			while (rs.next()) {
				BuyDataBeans bdb = new BuyDataBeans();
				bdb.setId(rs.getInt("id"));
				bdb.setTotalPrice(rs.getInt("total_price"));
				bdb.setBuyDate(rs.getTimestamp("create_date"));
				bdb.setDeliveryMethodId(rs.getInt("delivery_method_id"));
				bdb.setUserId(rs.getInt("user_id"));
				bdb.setDeliveryMethodPrice(rs.getInt("price"));
				bdb.setDeliveryMethodName(rs.getString("name"));
				buyDataList.add(bdb);
			}
			System.out.println("searching BuyDataBeans by userID has been completed");
			return buyDataList;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new SQLException(e);
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	public static ArrayList<ItemDataBeans> getItemDataBeansListByBuyId(int buyId) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		try {
			con = DBManager.getConnection();

			st = con.prepareStatement(
					"SELECT m_item.id,"
					+ " m_item.name,"
					+ " m_item.price"
					+ " FROM t_buy_detail"
					+ " JOIN m_item"
					+ " ON t_buy_detail.item_id = m_item.id"
					+ " WHERE t_buy_detail.buy_id = ?");
			st.setInt(1, buyId);

			ResultSet rs = st.executeQuery();
			ArrayList<ItemDataBeans> buyDetailItemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans idb = new ItemDataBeans();
				idb.setId(rs.getInt("id"));
				idb.setName(rs.getString("name"));
				idb.setPrice(rs.getInt("price"));


				buyDetailItemList.add(idb);
			}

			System.out.println("searching ItemDataBeansList by BuyID has been completed");
			return buyDetailItemList;
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
