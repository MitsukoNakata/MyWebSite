package beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


/**
 * 購入データ
 * @author m-takeuchi
 *
 */
public class BuyDataBeans  extends CustomDataBeans implements Serializable {
	private int userId;
	private int buyId;
	private int totalPrice;
	private int deliveryMethodId;
	private Date buyDate;
	private String baseName;
	private String cpuName;
	private String ramName;
	private String graphicsName;
	private String storageName;
	private String osName;
	private String officeName;
	private String assembleName;
	private String deliveryMethodName;
	private int deliveryMethodPrice;

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getBuyId() {
		return buyId;
	}
	public void setBuyId(int buyId) {
		this.buyId = buyId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDeliveryMethodId() {
		return deliveryMethodId;
	}
	public void setDeliveryMethodId(int deliveryMethodId) {
		this.deliveryMethodId = deliveryMethodId;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public String getDeliveryMethodName() {
		return deliveryMethodName;
	}
	public void setDeliveryMethodName(String deliveryMethodName) {
		this.deliveryMethodName = deliveryMethodName;
	}

	public String getFormatDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分");
		return sdf.format(buyDate);
	}
	public int getDeliveryMethodPrice() {
		return deliveryMethodPrice;
	}
	public void setDeliveryMethodPrice(int deliveryMethodPrice) {
		this.deliveryMethodPrice = deliveryMethodPrice;
	}

	public String getBaseName() {
		return baseName;
	}
	public void setBaseName(String baseName) {
		this.baseName = baseName;
	}
	public String getCpuName() {
		return cpuName;
	}
	public void setCpuName(String cpuName) {
		this.cpuName = cpuName;
	}
	public String getRamName() {
		return ramName;
	}
	public void setRamName(String ramName) {
		this.ramName = ramName;
	}
	public String getGraphicsName() {
		return graphicsName;
	}
	public void setGraphicsName(String graphicsName) {
		this.graphicsName = graphicsName;
	}
	public String getStorageName() {
		return storageName;
	}
	public void setStorageName(String storageName) {
		this.storageName = storageName;
	}
	public String getOsName() {
		return osName;
	}
	public void setOsName(String osName) {
		this.osName = osName;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public String getAssembleName() {
		return assembleName;
	}
	public void setAssembleName(String assembleName) {
		this.assembleName = assembleName;
	}
	public static BuyDataBeans settingInfo (ArrayList<String> list) {
		BuyDataBeans idb =  new BuyDataBeans();
		idb.setBase(Integer.parseInt(list.get(0)));
		idb.setBaseName(list.get(1));
		idb.setCpu(Integer.parseInt(list.get(2)));
		idb.setCpuName(list.get(3));
		idb.setRam(Integer.parseInt(list.get(4)));
		idb.setRamName(list.get(5));
		idb.setGraphics(Integer.parseInt(list.get(6)));
		idb.setGraphicsName(list.get(7));
		idb.setStorage(Integer.parseInt(list.get(8)));
		idb.setStorageName(list.get(9));
		idb.setOs(Integer.parseInt(list.get(10)));
		idb.setOsName(list.get(11));
		idb.setOffice(Integer.parseInt(list.get(12)));
		idb.setOfficeName(list.get(13));
		idb.setAssemble(Integer.parseInt(list.get(14)));
		idb.setAssembleName(list.get(15));

		return idb;
	}
}
