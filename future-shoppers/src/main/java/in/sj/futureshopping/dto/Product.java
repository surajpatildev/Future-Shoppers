package in.sj.futureshopping.dto;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity(name="product")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int productId;
		
	@Column(name = "product_code")
	private String productCode;
	
	@NotEmpty(message="Name Cannot be blank!")
	@Column(name = "name")
	private String name;
	
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="category_id")
	private Category category;
	
	@Transient
	private int categoryId;
	
	@JsonIgnore
	@Transient
	private MultipartFile productImage;
	
	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	//consult sir to solve the problem of lazy intilize.
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "supplier_id")
	private User user;
	
	@Min(value=1,message="Price can be less than 1!")
	@Column(name = "Unit_price")
	private double unitPrice;
	
	@Min(value=1,message="Quantity should be greater than 0!")
	@Column(name = "Total_Quantity")
	private int totalQuantity;

	@JsonIgnore
	@Column(name = "Quantity_Sold")
	private int quantitiesSold=0;

	private long views=0;

	@Column(name = "quantity_available")
	private int quantitiesAvailable;
	
	@JsonIgnore
	@Column(name = "Is_Active")
	private boolean isActive=true;
	
	@NotEmpty(message="Description can-not be empty!")
	@Column(name = "Product_Description")
	private String description;

	private float rating=0;

	public Product() {
		productCode= "PRD"+UUID.randomUUID().toString().substring(1, 12);
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
		categoryId=category.getCategoryId();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public int getQuantitiesSold() {
		return quantitiesSold;
	}

	public void setQuantitiesSold(int quantitiesSold) {
		this.quantitiesSold = quantitiesSold;
	}

	public long getViews() {
		return views;
	}

	public void setViews(long views) {
		this.views = views;
	}

	public int getQuantitiesAvailable() {
		return quantitiesAvailable;
	}

	public void setQuantitiesAvailable(int quantitiesAvailable) {
		this.quantitiesAvailable = quantitiesAvailable;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productCode=" + productCode + ", name=" + name + ", category="
				+ category.getName() + ", user=" + user.getFirstName() + ", unitPrice=" + unitPrice + ", totalQuantity=" + totalQuantity
				+ ", quantitiesSold=" + quantitiesSold + ", views=" + views + ", quantitiesAvailable="
				+ quantitiesAvailable + ", isActive=" + isActive + ", description=" + description + ", rating=" + rating
				+ "]";
	}

	
	
}
