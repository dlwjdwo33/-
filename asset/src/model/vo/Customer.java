package model.vo;


public class Customer {
	String id;
	String pwd;
	String name;
	int gender;
	int age;
	String location;

	
	public Customer(){
	}
	public Customer(String id, String pwd, String name, int gender, int age, String location) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.location = location;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", gender=" + gender + ", age=" + age + ", location="
				+ location + ", pwd=" + pwd + "]";
	}

	
}
