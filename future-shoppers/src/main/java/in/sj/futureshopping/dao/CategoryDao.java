package in.sj.futureshopping.dao;

import java.util.List;

import in.sj.futureshopping.dto.Category;

public interface CategoryDao {

	boolean add(Category category);
	List<Category> getAllCategories();
	boolean update(Category category);
	Category getCategoryByID(int categoryId);
	boolean delete(int categoryId);
	Category getCategoryByName(String name);
}
