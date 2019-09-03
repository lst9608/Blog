package com.lst.entity;

import lombok.Data;

import java.sql.Time;

@Data
public class Article {
    private Integer id;
    private String title;
    private String content;
    private Time createTime;
    private Integer user_id;
    private String userAccout;
}
