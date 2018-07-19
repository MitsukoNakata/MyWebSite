package beans;

import java.io.Serializable;

/**
 * アイテム
 * @author m-takeuchi
 *
 */
public class ItemDataBeans implements Serializable {
	private int id;
	private String itemType;
	private String name;
	private int price;
	private String fileName;
	private int itemNum;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}



}
