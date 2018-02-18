package in.sj.futureshoppingweb.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dao.ProductDao;
import in.sj.futureshopping.dto.Product;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductDao productDao;

	@RequestMapping(value = { "home", "" })
	public String home(Model model) {

		model.addAttribute("title", "Home");
		model.addAttribute("userClicksHome", true);
		return "master";
	}

	@RequestMapping(value = { "/all/products","products/all" })
	public String showallproducts(Model model) {

		model.addAttribute("title", "All Products");
		model.addAttribute("userClicksAllProducts", true);
		return "master";
	}
	
	@RequestMapping(value = { "products/{categoryName}/{productCode}/{productId}" })
	public String showAProduct(@PathVariable String categoryName,@PathVariable String productCode,
			@PathVariable int productId,Model model) {
		Product product=productDao.getProductById(productId);
		model.addAttribute("product",product);
		model.addAttribute("title",product.getName());
		model.addAttribute("userClicksViewProduct", true);
		List<Product> products=productDao.getProductByCategoryName(categoryName);
		Collections.shuffle(products);
		model.addAttribute("products",products);
		return "master";
	}
	
	
	@RequestMapping(value = { "products/{name}" })
	public String showProductsByCategory(Model model,@PathVariable("name") String name) {

		model.addAttribute("title", name);
		model.addAttribute("userClicksProductsByCategory", true);
		model.addAttribute(categoryDao.getCategoryByName(name));
		return "master";
	}
}
