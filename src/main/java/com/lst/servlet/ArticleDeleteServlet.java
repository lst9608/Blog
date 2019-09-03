package com.lst.servlet;

import com.lst.Dao.BaseDao;
import com.lst.error.BusinessException;
import com.lst.error.ParameterException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/articleDelete")
public class ArticleDeleteServlet extends BaseServlet {

    @Override
    public Object process(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BaseDao baseDao = new BaseDao();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String ids = request.getParameter("ids");
        int[] intIds = null;
        try {
            String[] idArray = ids.split(",");
            intIds = new int[idArray.length];
            int i = 0;
            for (String id : idArray) {
                intIds[i] = Integer.parseInt(id);
                i++;
            }
        }catch (Exception e){
            throw new ParameterException("请求参数错误ids="+ids);
        }


            try{
                connection = baseDao.getConnection(true);
            StringBuilder sql = new StringBuilder("delete from article where id in(");
            for(int i=0;i<intIds.length;i++){
                if(i==0){
                    sql.append("?");
                }else{
                    sql.append(",?");
                }
            }
            sql.append(")");

                preparedStatement  = connection.prepareStatement(sql.toString());

            for(int i=0;i<intIds.length;i++) {
                preparedStatement.setInt(i+1,intIds[i]);
            }

            int r = preparedStatement.executeUpdate();
          if(r>0){
              return r;
          }else{
             throw new BusinessException("没有该文章");
          }
        }finally {
            //TODO关闭资源
            baseDao.closeResource(null,preparedStatement,connection);
        }

    }

}
