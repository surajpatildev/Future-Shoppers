package in.sj.futureshopping.dao;

import java.util.List;

import in.sj.futureshopping.dto.Category;
import in.sj.futureshopping.dto.Product;

public interface ProductDao {

	List<Product> all();
	List<Product> getProductByCategoryName(String name);
	List<Product> getProductByCategoryId(int categoryId);
	Product getProductById(int productId);
	List<Product> gelAllActiveProducts();
	boolean add(Product product);
	boolean update(Product product);
}
