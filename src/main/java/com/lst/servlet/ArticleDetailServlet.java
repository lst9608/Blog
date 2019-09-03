package com.lst.servlet;

import com.lst.Dao.BaseDao;
import com.lst.entity.Article;
import com.lst.error.ParameterException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/articleDetail")
public class ArticleDetailServlet extends BaseServlet {

    @Override
    public Object process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        BaseDao baseDao = new BaseDao();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Article article = new Article();
        // 处理前端请求数据
        String sid = req.getParameter("id");
        Integer id = null;
        try {
            id = Integer.parseInt(sid);
        }catch (Exception e){
            throw new ParameterException("id错误（"+sid+")");
        }


        // 处理业务及数据库操作
        try {
            connection= baseDao.getConnection(true);
            String sql = "select id,title,content,create_time " +
                    "from article where id=?";
          preparedStatement= connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                article.setId(resultSet.getInt("id"));
                article.setTitle(resultSet.getString("title"));
                article.setContent(resultSet.getString("content"));
                article.setCreateTime(resultSet.getTime("create_time"));
            }
            System.out.println(article);
        }finally {
            baseDao.closeResource(resultSet,preparedStatement,connection);
        }
        return article;
    }
}
