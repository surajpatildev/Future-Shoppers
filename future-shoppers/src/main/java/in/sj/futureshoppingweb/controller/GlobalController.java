package in.sj.futureshoppingweb.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dto.Category;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	ServletContext context;
	@Autowired
	CategoryDao categoryDao;
	@ModelAttribute("categories")
	public List<Category> allCategories() {
		if(context.getAttribute("allcategories")==null) {
			context.setAttribute("allcategories", categoryDao.getAllCategories());
			return (List<Category>) context.getAttribute("allcategories");
		}
		return (List<Category>) context.getAttribute("allcategories");
	}

}
