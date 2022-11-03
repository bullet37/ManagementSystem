package com.bullet.service.Role;

import com.bullet.dao.BaseDao;
import com.bullet.dao.Role.RoleDao;
import com.bullet.dao.Role.RoleDaoImpl;
import com.bullet.pojo.Role;
import org.junit.Test;

import java.sql.Connection;
import java.util.Arrays;
import java.util.List;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.service.Role
 * @version: 1.0
 */
public class RoleServiceImpl implements RoleService {

    private RoleDao roleDao;

    public RoleServiceImpl(){
        roleDao = new RoleDaoImpl();
    }

    @Override
    public List<Role> getRoleList() {
        Connection connection = null;
        List<Role> roleList = null;
        try {
            connection = BaseDao.getConnection();
            roleList = roleDao.getRoleList(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            BaseDao.closeResource(connection, null, null);
        }
        return roleList;
    }
    
    @Test
    public void test(){
        RoleService roleService = new RoleServiceImpl();
        List<Role> roleList = roleService.getRoleList();
        System.out.println(Arrays.toString(roleList.toArray()));
    }
}