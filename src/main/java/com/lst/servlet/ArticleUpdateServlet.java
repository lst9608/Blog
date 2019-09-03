package com.lst.servlet;

import com.lst.Dao.BaseDao;
import com.lst.Dao.JSONUtil;
import com.lst.entity.Article;
import com.lst.error.BusinessException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/articleUpdate")
public class ArticleUpdateServlet extends BaseServlet {

    @Override
    public Object process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BaseDao baseDao = new BaseDao();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Article article = (Article) JSONUtil.get(request,Article.class);
        try {
            connection = baseDao.getConnection(true);
            String sql = "update article set title=?,content=?where id=?;";
            preparedStatement  = connection.prepareStatement(sql);
            preparedStatement.setString(1,article.getTitle());
            preparedStatement.setString(2,article.getContent());
            preparedStatement.setInt(3,article.getId());
            int r = preparedStatement.executeUpdate();
          if(r>0){
              return r;
          }else{
             throw new BusinessException("没有该文章"+article.getUserAccout());
          }
        }finally {
            //TODO关闭资源
            baseDao.closeResource(null,preparedStatement,connection);
        }

    }

}
