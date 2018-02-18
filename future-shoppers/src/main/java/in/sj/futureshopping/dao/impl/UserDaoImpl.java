package in.sj.futureshopping.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.sj.futureshopping.dao.UserDao;
import in.sj.futureshopping.dto.User;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	@Override
	public User getUserById(int id) {

		return sessionFactory.getCurrentSession().get(User.class,id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		return sessionFactory.getCurrentSession()
				.createQuery("From User").getResultList();
	}

}
