package com.lst.Dao;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lst.error.SystemException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class JSONUtil {
    public static String format(Object object) {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
           //TODO待处理异常
            throw new SystemException("JSON解析错误"+object);
        }
    }
    public static Object get(HttpServletRequest request, Class<?> clazz){
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        try{
            return objectMapper.readValue(request.getInputStream(),clazz);
        }catch (IOException e){
            e.printStackTrace();
            throw new SystemException("JSON反序列化错误");
        }
    }
}
