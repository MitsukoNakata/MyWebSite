package beans;

import java.io.Serializable;

/**
 * ユーザー
 * @author t-takeuchi
 *
 */
public class UserDataBeans implements Serializable {
	private String name;
	private String email;
	private String password;
	private String zipcode;
	private String address;
	private int id;
	private String phonenumber;


	// コンストラクタ
	public UserDataBeans() {
		this.name = "";
		this.email = "";
		this.password = "";
		this.zipcode = "";
		this.address = "";
		this.phonenumber = "";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public void setUpdateUserDataBeansInfo(String name, String email,String phonenumber,String zipcode,String address, int id) {
		this.name = name;
		this.email = email;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.id = id;
	}

}
