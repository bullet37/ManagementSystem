package com.bullet.dao.Role;

import com.bullet.pojo.Role;
import java.sql.Connection;
import java.util.List;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.dao.Role
 * @version: 1.0
 */
public interface RoleDao {
    public List<Role> getRoleList(Connection connection)throws Exception;
}
