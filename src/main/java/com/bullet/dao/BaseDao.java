package com.bullet.dao;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.sql.*;
import java.util.Properties;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.dao
 * @version: 1.0
 */
// Control the DB connection
public class BaseDao {
    static { init();}

    private static String driver;
    private static String url;
    private static String username;
    private static String password;

    // static initialize
    public static void init(){
        Properties properties = new Properties();
        String configFile = "db.properties";
        InputStream inputStream = BaseDao.class.getClassLoader().getResourceAsStream(configFile);

        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

        driver=properties.getProperty("driver");
        url=properties.getProperty("url");
        username=properties.getProperty("username");
        password=properties.getProperty("password");
    }

    // connect to the database
    public static Connection getConnection() {
        Connection connection =null;
        try {
            Class.forName(driver);
            connection=DriverManager.getConnection(url,username,password);
        }catch (Exception e){
            e.printStackTrace();
        }
        return connection;
    }



    public static ResultSet execute(Connection connection, PreparedStatement pstm,
                                    ResultSet rs,String sql,Object[] params)throws Exception{
        pstm = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            pstm.setObject(i+1,params[i]);
        }
        rs = pstm.executeQuery();
        return rs;
    }

    public static int execute(Connection connection,PreparedStatement pstm,
                              String sql,Object[] params) throws Exception{
        int updateRows = 0;
        pstm = connection.prepareStatement(sql);
        for(int i = 0; i < params.length; i++){
            pstm.setObject(i+1, params[i]);
        }
        updateRows = pstm.executeUpdate();
        return updateRows;
    }

    public static boolean closeResource(Connection connection,
                                        PreparedStatement pstm, ResultSet rs){
        boolean flag = true;
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (pstm != null) {
                pstm.close();
                pstm = null;
            }
            if (connection != null) {
                connection.close();
                connection = null;
            }
        }
        catch (SQLException e) {
                e.printStackTrace();
                flag = false;
        }

        return flag;
    }
}
