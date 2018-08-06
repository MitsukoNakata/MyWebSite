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
	 * @throws SQLException 呼び出し元にスローさせるため
	 */
	public static int insertBuy(BuyDataBeans bdb) throws SQLException {
		Connection con = null;
		PreparedStatement st = null;
		int autoIncKey = -1;
		try {
			con = DBManager.getConnection();
			st = con.prepareStatement(
					"INSERT INTO t_buy(user_id,total_price,delivery_method_id,create_date,base,cpu,ram,graphics,storage,os,office,assemble) "
					+"VALUES (?,?,?,?,?,?,?,?,?,?,?,?)"
					,Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, bdb.getUserId());
			st.setInt(2, bdb.getTotalPrice());
			st.setInt(3, bdb.getDeliveryMethodId());
			st.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			st.setInt(5, bdb.getBase());
			st.setInt(6, bdb.getCpu());
			st.setInt(7, bdb.getRam());
			st.setInt(8, bdb.getGraphics());
			st.setInt(9, bdb.getStorage());
			st.setInt(10, bdb.getOs());
			st.setInt(11, bdb.getOffice());
			st.setInt(12, bdb.getAssemble());
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
	 * 購入IDによる購入情報検索
	 * @param buyId
	 * @return BuyDataBeans
	 * 				購入情報のデータを持つJavaBeansのリスト
	 * @throws SQLException
	 * 				呼び出し元にスローさせるため
	 */
	public static BuyDataBeans getBuyDataBeansByBuyId(int buyId,int userId) throws SQLException {
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
					" t_buy.* ," +
					" m_delivery_method.name AS delivery_name," +
					" m_delivery_method.price" +
					" FROM t_buy" +
					" JOIN m_item AS base_item" +
					" ON base_item.id = t_buy.base" +
					" JOIN m_item AS cpu_item" +
					" ON cpu_item.id = t_buy.cpu" +
					" JOIN m_item AS ram_item" +
					" ON ram_item.id = t_buy.ram" +
					" JOIN m_item AS graphics_item" +
					" ON graphics_item.id = t_buy.graphics" +
					" JOIN m_item AS storage_item\n" +
					" ON storage_item.id = t_buy.storage" +
					" JOIN m_item AS os_item" +
					" ON os_item.id = t_buy.os" +
					" JOIN m_item AS office_item" +
					" ON office_item.id = t_buy.office" +
					" JOIN m_item AS assemble_item\n" +
					" ON assemble_item.id = t_buy.assemble" +
					" JOIN m_delivery_method\n" +
					" ON t_buy.delivery_method_id = m_delivery_method.id" +
					" WHERE t_buy.id = ?" +
					" AND user_id = ?");
			st.setInt(1, buyId);
			st.setInt(2, userId);

			ResultSet rs = st.executeQuery();

			BuyDataBeans bdb = new BuyDataBeans();
			if (rs.next()) {
				bdb.setId(rs.getInt("id"));
				bdb.setUserId(rs.getInt("user_id"));
				bdb.setTotalPrice(rs.getInt("total_price"));
				bdb.setBuyDate(rs.getTimestamp("create_date"));
				bdb.setDeliveryMethodId(rs.getInt("delivery_method_id"));
				bdb.setBaseName(rs.getString("base_name"));
				bdb.setCpuName(rs.getString("cpu_name"));
				bdb.setRamName(rs.getString("ram_name"));
				bdb.setGraphicsName(rs.getString("graphics_name"));
				bdb.setStorageName(rs.getString("storage_name"));
				bdb.setOsName(rs.getString("os_name"));
				bdb.setOfficeName(rs.getString("office_name"));
				bdb.setAssembleName(rs.getString("assemble_name"));
				bdb.setDeliveryMethodPrice(rs.getInt("price"));
				bdb.setDeliveryMethodName(rs.getString("delivery_name"));
			}

			System.out.println("searching BuyDataBeans by buyID,userID has been completed");

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
