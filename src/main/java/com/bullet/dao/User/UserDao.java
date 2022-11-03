package com.bullet.dao.User;

import com.bullet.pojo.User;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.dao.User
 * @version: 1.0
 */
public interface UserDao {

    public User getLoginUser(Connection connection, String userCode)throws Exception;

    public int updatePwd(Connection connection, int id, String pwd)throws Exception;

    public int getUserCount(Connection connection, String userName, int userRole)throws Exception;

    public List<User> getUserList(Connection connection, String userName, int userRole, int currentPageNo, int pageSize)throws Exception;

    public int addUser(Connection connection, User user)throws Exception;

    public int deleteUserById(Connection connection, Integer delId)throws Exception;

    public int modifyUser(Connection connection, User user)throws Exception;

    public User getUserById(Connection connection, String id)throws Exception;
}
