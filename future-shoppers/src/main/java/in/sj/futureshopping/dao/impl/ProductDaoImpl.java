package in.sj.futureshopping.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.sj.futureshopping.dao.ProductDao;
import in.sj.futureshopping.dto.Category;
import in.sj.futureshopping.dto.Product;

@Repository(value="productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> all() {
		
		return (List<Product>)sessionFactory.getCurrentSession().createQuery("from product").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductByCategoryName(String name) {
	
		List<Product> products= (List<Product>)sessionFactory.getCurrentSession()
				.createQuery("FROM product where category.name=:name and isActive=true")
				.setParameter("name",name)
				.getResultList();
		return products;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductByCategoryId(int categoryId) {
		List<Product> products=(List<Product>)sessionFactory.getCurrentSession()
				.createQuery("FROM product where category.categoryId=:categoryId and isActive=true")
				.setParameter("categoryId",categoryId)
				.getResultList();
		return products;
	}

	@Override
	public Product getProductById(int productId) {
		
		return sessionFactory.getCurrentSession().get(Product.class,productId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> gelAllActiveProducts() {
		List<Product> products=(List<Product>)sessionFactory.getCurrentSession()
				.createQuery("FROM product where isActive=:isActive")
				.setParameter("isActive",true)
				.getResultList();
		return products;
	}

	@Override
	public boolean add(Product product) {
		try {
			
			sessionFactory.getCurrentSession().persist(product);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean update(Product product) {
try {
			
			sessionFactory.getCurrentSession().update(product);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

}
