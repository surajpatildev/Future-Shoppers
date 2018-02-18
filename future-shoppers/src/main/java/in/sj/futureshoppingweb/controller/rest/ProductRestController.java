package in.sj.futureshoppingweb.controller.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dao.ProductDao;
import in.sj.futureshopping.dto.Product;

@RestController
@RequestMapping(value = { "/data/products" })
public class ProductRestController {

	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	@RequestMapping("")
	List<Product> getAllActiveProducts() {

		List<Product> products= productDao.gelAllActiveProducts();
		for(Product product: products) {
			product.setCategoryId(product.getCategory().getCategoryId());
		}
		return products;
	}
	
	@RequestMapping("/all")
	List<Product> getAllProducts() {

		List<Product> products= productDao.all();
		for(Product product: products) {
			product.setCategoryId(product.getCategory().getCategoryId());
		}
		return products;
	}

	@RequestMapping("/categories/{name}")
	List<Product> getProductsByCategoryName(@PathVariable String name) {

		List<Product> products= productDao.getProductByCategoryName(name);
		for(Product product: products) {
			product.setCategoryId(product.getCategory().getCategoryId());
		}
		return products;
	}

	@RequestMapping("/category/{categoryId}")
	List<Product> getProductsByCategoryId(@PathVariable int categoryId) {
		List<Product> products= productDao.getProductByCategoryId(categoryId);
		for(Product product: products) {
			product.setCategoryId(product.getCategory().getCategoryId());
		}
		return products;
	}

	@RequestMapping("/{productId}")
	Product getProductsByProductId(@PathVariable int productId) {

		return productDao.getProductById(productId);
	}
	
	@RequestMapping(value="",method=RequestMethod.PUT)
	String updateProduct(@RequestBody Product product) {
		boolean result=false;
	try {
		Product uProduct=productDao.getProductById(product.getProductId());
		uProduct.setCategory(categoryDao.getCategoryByID(product.getCategoryId()));
		uProduct.setDescription(product.getDescription());
		uProduct.setName(product.getName());
		uProduct.setTotalQuantity(uProduct.getTotalQuantity()+product.getQuantitiesAvailable()-uProduct.getQuantitiesAvailable());
		uProduct.setQuantitiesAvailable(product.getQuantitiesAvailable());
		uProduct.setUnitPrice(product.getUnitPrice());
		result=productDao.update(uProduct);
	}catch(Exception ex) {
		ex.printStackTrace();
	}
		return result?"Updated Successfully ! Refresh Page to see the Effects":"Server Error.Please try again later!";
	}
}
