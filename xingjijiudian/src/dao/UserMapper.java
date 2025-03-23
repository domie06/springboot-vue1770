package dao;

import java.util.List;

import model.User;


public interface UserMapper {
	    int deleteByPrimaryKey(String id);

	    int insert(User record);

	    int insertSelective(User record);

	    User selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(User record);

	    int updateByPrimaryKey(User record);
	    
	    List<User> getAll();
	    List<User> login(User record);
	    List<User> adminLogin(User record);
	    List<User> getAllUserForAdmin(User record);
}
