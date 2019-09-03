package com.lst.entity;

import lombok.Data;

@Data
public class JSON {
    private boolean success;
    private String code;//错误码
    private String message;
    private Object data;
}
