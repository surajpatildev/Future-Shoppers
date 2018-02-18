package in.sj.futureshopping.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.sj.futureshopping.dao.CategoryDao;
import in.sj.futureshopping.dto.Category;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean add(Category category) {

		if (category != null) {

			sessionFactory.getCurrentSession().persist(category);
			return true;

		} else
			return false;
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> categories = (List<Category>) sessionFactory.getCurrentSession().createQuery("FROM Category")
				.getResultList();
		return categories;
	}

	@Override
	public boolean update(Category category) {
		if (category != null) {

			sessionFactory.getCurrentSession().update(category);
			return true;

		} else
			return false;
	}

	@Override
	public Category getCategoryByID(int categoryId) {

		return sessionFactory.getCurrentSession().get(Category.class, categoryId);
	}

	@Override
	public boolean delete(int categoryId) {
		if (categoryId != 0) {
			Category category = sessionFactory.getCurrentSession().get(Category.class, categoryId);

			sessionFactory.getCurrentSession().delete(category);
			return true;

		} else
			return false;
	}

	// Methods other the crud operations

	public Category getCategoryByName(String name) {
		
		return (Category) sessionFactory.getCurrentSession()
				.createQuery("from Category where name=:name")
					.setParameter("name",name).getSingleResult();
	}

}
