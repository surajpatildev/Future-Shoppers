package in.sj.futureshopping.dao;

import java.util.List;

import in.sj.futureshopping.dto.User;

public interface UserDao {

	User getUserById(int id);
	List<User> getAllUsers();
}
