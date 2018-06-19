package beans;

import java.io.Serializable;

/**
 * ユーザー
 * @author d-yamaguchi
 *
 */
public class UserDataBeans implements Serializable {
	private String name;
	private String address;
	private String password;
	private String email;
	private int id;
	private int phonenumber;


	// コンストラクタ
	public UserDataBeans() {
		this.name = "";
		this.address = "";
		this.password = "";
		this.email = "";

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(int phonenumber) {
		this.phonenumber = phonenumber;
	}

	/**
	 * ユーザー情報更新時の必要情報をまとめてセットするための処理
	 *
	 * @param name
	 * @param address
	 * @param id
	 */
	public void setUpdateUserDataBeansInfo(String name, String email, String adress, int id) {
		this.name = name;
		this.address = address;
		this.id = id;
	}

}
