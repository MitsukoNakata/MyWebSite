package beans;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;

import dao.ItemDAO;

/**
 * アイテム
 * @author m-takeuchi
 *
 */
public class CustomDataBeans implements Serializable {
	private int id;
	private String customName;
	private int customTypeNum;
	private String customType;
	private int price;
	private int base;
	private int cpu;
	private int ram;
	private int graphics;
	private int storage;
	private int os;
	private int office;
	private int assemble;

	private HashMap <String,Integer> item;


	// カスタム別標準構成パーツの価格を取得
	private ItemDataBeans baseItem;
	private ItemDataBeans cpuItem;
	private ItemDataBeans ramItem;
	private ItemDataBeans graphicsItem;
	private ItemDataBeans storageItem;
	private ItemDataBeans osItem;
	private ItemDataBeans officeItem;
	private ItemDataBeans assembleItem;

	public ItemDataBeans getBaseItem() {

		try {
			return ItemDAO.getItemByItemID(this.base);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ItemDataBeans getCpuItem() {

		try {
			return ItemDAO.getItemByItemID(this.cpu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ItemDataBeans getRamItem() {

		try {
			return ItemDAO.getItemByItemID(this.ram);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ItemDataBeans getGraphicsItem() {

		try {
			return ItemDAO.getItemByItemID(this.graphics);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ItemDataBeans getStorageItem() {

		try {
			return ItemDAO.getItemByItemID(this.storage);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public ItemDataBeans getOsItem() {

		try {
			return ItemDAO.getItemByItemID(this.os);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ItemDataBeans getOfficeItem() {

		try {
			return ItemDAO.getItemByItemID(this.office);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ItemDataBeans getAssembleItem() {

		try {
			return ItemDAO.getItemByItemID(this.assemble);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}

	public int getCustomTypeNum() {
		return customTypeNum;
	}

	public void setCustomTypeNum(int customTypeNum) {
		this.customTypeNum = customTypeNum;
	}

	public String getCustomType() {
		return customType;
	}
	public void setCustomType(String customType) {
		this.customType = customType;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public HashMap<String, Integer> getItem() {
		return item;
	}

	public void setItem(HashMap<String, Integer> item) {
		this.item = item;
	}

	public int getAssemble() {
		return assemble;
	}

	public void setAssemble(int assemble) {
		this.assemble = assemble;
	}

	public static CustomDataBeans settingInfo(String[] inputList) {
		CustomDataBeans idb = new CustomDataBeans();

		idb.setCustomTypeNum(Integer.parseInt(inputList[0]));
		idb.setCustomName(inputList[1]);
		idb.setBase(Integer.parseInt(inputList[2]));
		idb.setCpu(Integer.parseInt(inputList[3]));
		idb.setRam(Integer.parseInt(inputList[4]));
		idb.setGraphics(Integer.parseInt(inputList[5]));
		idb.setStorage(Integer.parseInt(inputList[6]));
		idb.setOs(Integer.parseInt(inputList[7]));
		idb.setOffice(Integer.parseInt(inputList[8]));
		idb.setAssemble(Integer.parseInt(inputList[9]));

		return idb;
	}

}
