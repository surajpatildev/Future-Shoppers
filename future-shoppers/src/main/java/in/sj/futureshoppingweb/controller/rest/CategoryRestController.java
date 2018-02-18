package in.sj.futureshoppingweb.controller.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dto.Category;

@RestController
@RequestMapping("/data/categories")
public class CategoryRestController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping("")
	public List<Category> all(){
		
		return categoryDao.getAllCategories();
	}
	
	/*@RequestMapping("/names")
	public List<String> allCategoryNames(){
		List<String> categoryNames=new ArrayList<String>();
		List<Category> list= categoryDao.getAllCategories();
		for(Category category : list) {
			categoryNames.add(category.getName())
		}
	}*/
	
}
