package com.bimo.pojo;

/*
 * @fileName: BaseOrder
 * @author  : 13716
 * @Date    : 2020-07-09 11:23
 */
public class BaseOrder {
    private String id;
    private String username;
    private String movieName;

    public BaseOrder() {
    }

    public BaseOrder(String id, String username, String movieName) {
        this.id = id;
        this.username = username;
        this.movieName = movieName;
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

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
}
