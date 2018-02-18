package in.sj.futureshopping.dto;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private int userID;
	
	@Column(name="first_name",nullable=false)
	private String firstName;
	
	@Column(name="last_name",nullable=false)
	private String lastName;
	
	@Column(name="email",nullable=false,unique=true)
	private String email;
	
	@JsonIgnore
	@Column(name="password",nullable=false)
	private String Password;
	
	@Column(name="mobile_number",nullable=false,unique=true)
	private long moblieNumber;
	
	@JsonIgnore
	private String role;
	
	@JsonIgnore
	@Column(name="is_active",nullable=false)
	private boolean isActive;
	
	@JsonIgnore
	@OneToMany(mappedBy="user",fetch=FetchType.LAZY)
	private List<Product> products;
	
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public long getMoblieNumber() {
		return moblieNumber;
	}
	public void setMoblieNumber(long moblieNumber) {
		this.moblieNumber = moblieNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public boolean isIsActive() {
		return isActive;
	}
	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}
	public User(int userID, String firstName, String lastName, String email, String password, long moblieNumber,
			String role) {
		this.userID = userID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		Password = password;
		this.moblieNumber = moblieNumber;
		this.role = role;
		isActive=true;
	}
	public User() {
		isActive=true;
	}
	@Override
	public String toString() {
		return "User [userID=" + userID + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", Password=" + Password + ", moblieNumber=" + moblieNumber + ", role=" + role + ", isActive="
				+ isActive + "]";
	}
	
	
}
