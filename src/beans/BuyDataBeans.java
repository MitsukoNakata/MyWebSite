package beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 購入データ
 * @author m-takeuchi
 *
 */
public class BuyDataBeans  implements Serializable {
	private int id;
	private int userId;
	private int totalPrice;
	private int deliveryMethodId;
	private Date buyDate;
	private String customName;
	private int base;
	private int cpu;
	private int ram;
	private int graphics;
	private int storage;
	private int os;
	private int office;
	private int assemble;
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


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}

	public int getBase() {
		return base;
	}
	public void setBase(int base) {
		this.base = base;
	}
	public int getCpu() {
		return cpu;
	}
	public void setCpu(int cpu) {
		this.cpu = cpu;
	}
	public int getRam() {
		return ram;
	}
	public void setRam(int ram) {
		this.ram = ram;
	}
	public int getGraphics() {
		return graphics;
	}
	public void setGraphics(int graphics) {
		this.graphics = graphics;
	}
	public int getStorage() {
		return storage;
	}
	public void setStorage(int storage) {
		this.storage = storage;
	}
	public int getOs() {
		return os;
	}
	public void setOs(int os) {
		this.os = os;
	}
	public int getOffice() {
		return office;
	}
	public void setOffice(int office) {
		this.office = office;
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
	public int getAssemble() {
		return assemble;
	}
	public void setAssemble(int assemble) {
		this.assemble = assemble;
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



}
