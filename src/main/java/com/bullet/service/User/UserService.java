package com.bullet.service.User;

import com.bullet.pojo.User;

import java.sql.SQLException;
import java.util.List;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.service.User
 * @version: 1.0
 */
public interface UserService {

    public User login(String userCode, String userPassword);

    public boolean updatePwd(int id, String pwd);

    public int getUserCount(String queryUserName, int queryUserRole);

    public List<User> getUserList(String queryUserName, int queryUserRole, int currentPageNo, int pageSize);

    public boolean addUser(User user);

    public boolean deleteUserById(Integer delId);

    public boolean modifyUser(User user);

    public User selectUserCodeExist(String userCode);

    public User getUserById(String id);

}
