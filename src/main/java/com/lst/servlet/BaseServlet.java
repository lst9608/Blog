package com.lst.servlet;


import com.lst.Dao.JSONUtil;
import com.lst.entity.JSON;
import com.lst.error.BusinessException;
import com.lst.error.ParameterException;
import com.lst.error.SystemException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public abstract class BaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json;charset=utf-8");
        JSON result = new JSON();
        try {
            Object data = process(request, response);
            result.setSuccess(true);
            result.setCode("200");
            result.setMessage("操作成功 ");
            result.setData(data);

        } catch (Exception e) {
            e.printStackTrace();
         /*   if(ParameterException.class.isAssignableFrom(e.getClass())){ }*/
         if(e instanceof ParameterException){
             result.setCode(((ParameterException)e).getCode());
             result.setMessage(((ParameterException)e).getMessage());
         } else if(e instanceof SystemException){
             result.setCode(((SystemException)e).getCode());
             result.setMessage(((SystemException)e).getMessage());
         } else if(e instanceof BusinessException){
             result.setCode(((BusinessException)e).getCode());
             result.setMessage(((BusinessException)e).getMessage());
         }  else{
             result.setCode("500");
             result.setMessage("服务器错误 ");
         }
        }

        response.getWriter().write(JSONUtil.format(result));
    }

    public abstract Object process(HttpServletRequest request, HttpServletResponse response)
            throws Exception;
}
