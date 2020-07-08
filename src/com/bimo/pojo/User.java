package com.bimo.pojo;

import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.UUID;

public class User {
    private String id;
    private String username;
    private String password;
    private Integer sex;
    private Boolean superuser;

    public User(String  id, String username, String password, Integer sex, Boolean superuser) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.superuser = superuser;
    }

    public Boolean getSuperuser() {
        return superuser;
    }

    public void setSuperuser(Boolean superuser) {
        this.superuser = superuser;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
        this.sex = 0;
        this.id = UUID.randomUUID().toString();
        this.superuser = false;
    }

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }
}
