package in.sj.futureshoppingweb.controller;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dao.ProductDao;
import in.sj.futureshopping.dao.UserDao;
import in.sj.futureshopping.dto.Category;
import in.sj.futureshopping.dto.Product;
import in.sj.futureshoppingweb.util.FileUtil;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired
	ProductDao productDao;
	@Autowired
	ServletContext context;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/products")
	public String manageProducts(Model model) {
		model.addAttribute("category",new Category());
		model.addAttribute("title", "Manage Products");
		model.addAttribute("userClicksManageProducts", true);
		return "master";
	}
	
	
	@RequestMapping("/products/add")
	public String addProductForm(@SessionAttribute(required=false) String messege,Model model) {
		model.addAttribute("product",new Product());
		model.addAttribute("title", "Manage Products");
		model.addAttribute("userClicksAddProduct", true);
		System.out.println(messege);
		if(messege!=null)
		model.addAttribute("messege",messege);
		return "master";
	}
	
	@RequestMapping(value="/products/add",method=RequestMethod.POST)
	public ModelAndView addProduct(@Valid @ModelAttribute Product product,Errors errors,HttpServletRequest req,Model model,RedirectAttributes redirectAttribute) {
		if(errors.hasErrors()) {
			model.addAttribute("title", "Manage Product");
			model.addAttribute("userClicksAddProduct", true);
			System.out.println(errors);
			return new ModelAndView("master", (Map<String, ?>) model);
		}
		product.setUser(userDao.getUserById(1)); //change this when login feature is implimented
		product.setCategory(categoryDao.getCategoryByID(Integer.parseInt(req.getParameter("categoryId"))));
		product.setQuantitiesAvailable(product.getTotalQuantity());
		System.out.println(product);
		productDao.add(product);
		
		//upload the file
		 if(!product.getProductImage().getOriginalFilename().equals("") ){
			FileUtil.uploadFile(product.getProductImage(), product.getProductCode()); 
		 }
		
		redirectAttribute.addFlashAttribute("messege","Product Added Succesfully");
		ModelAndView mv=new ModelAndView("redirect:/manage/products/add",(Map<String, ?>) redirectAttribute);
		return mv;
	}

	
	@RequestMapping(value="/category",method=RequestMethod.POST)
	public ModelAndView addCategoty(@ModelAttribute Category category,Model model) {
		
		categoryDao.add(category);
		context.setAttribute("allcategories", categoryDao.getAllCategories());
		return new ModelAndView("redirect:/manage/products?op=1");
	}
	
	
	
	@RequestMapping("/product/{productId}/activation")
	@ResponseBody
	public String productActivation(@PathVariable int productId) {
			
		Product product=productDao.getProductById(productId);
		boolean active=product.isActive();
		product.setActive(!product.isActive());;
		if(productDao.update(product))
		return (active)? "Product Dectivated Successfully!": "Product Activated Successfully";
		else
			return "Server error! Please try again later.";
	}



	
}


