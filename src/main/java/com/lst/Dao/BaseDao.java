package com.lst.Dao;

import com.lst.error.SystemException;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
    private static volatile DataSource dataSource;

    //采用基本实现
    public DataSource getDataSource() {
        if (dataSource == null) {
            synchronized (DataSource.class) {
                if (dataSource == null) {
                    dataSource = new MysqlDataSource();//MySql数据源
                    String host = "127.0.0.1";
                    String port = "3306";
                    ((MysqlDataSource) dataSource).setUrl("jdbc:mysql://" + (host + ":" + port) + "/blogdemo");
                    ((MysqlDataSource) dataSource).setUser("root");
                    ((MysqlDataSource) dataSource).setPassword("13087544330");
                }
            }
        }
        return dataSource;
    }

    public Connection getConnection(boolean autoCommit) throws SQLException {
        //获取连接
        Connection connection = this.getDataSource().getConnection();
        //如果true  每写一条语句 自动进行提交
        connection.setAutoCommit(autoCommit);
        return connection;
    }

    public void closeResource(ResultSet resultSet, PreparedStatement statement, Connection connection) {
        //结果 -> 命令 -> 连接
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }catch (SQLException e) {
                //TODO处理数据库异常
                e.printStackTrace();
                throw new SystemException("数据库异常");
            }
    }
}
