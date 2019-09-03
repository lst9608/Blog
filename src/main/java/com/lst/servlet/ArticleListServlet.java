package com.lst.servlet;

import com.lst.Dao.BaseDao;
import com.lst.entity.Article;
import com.lst.error.ParameterException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ArticleListServlet extends BaseServlet {
    @Override
    public Object process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BaseDao baseDao = new BaseDao();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        List<Article> list = new ArrayList<>();
        //处理前端请求数据
        String sid = request.getParameter("id");
        Integer id = null;
        try {
          id = Integer.parseInt(sid);
        }catch (NumberFormatException e){
            throw new ParameterException("id错误("+sid+")");
        }
        //处理业务及数据库操作

try {
   connection = baseDao.getConnection(true);
    String sql = "select * from article a " +
            "join user u on a.user_id=u.id where u.id=?";
   preparedStatement  = connection.prepareStatement(sql);
   preparedStatement.setInt(1,id);
    resultSet = preparedStatement.executeQuery();
    while (resultSet.next()) {
        Article article = new Article();
        article.setId(resultSet.getInt("id"));
        article.setContent(resultSet.getString("content"));
        article.setTitle(resultSet.getString("title"));
        article.setCreateTime(resultSet.getTime("create_time"));
        article.setUser_id(resultSet.getInt("user_id"));
        list.add(article);
    }
}finally {
    //TODO关闭资源
    baseDao.closeResource(resultSet,preparedStatement,connection);
}
        return list;
    }

}
