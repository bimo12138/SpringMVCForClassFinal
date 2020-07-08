package com.bimo.pojo;

import com.bimo.utils.GetUUID;

/*
 * @fileName: Order
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 20: 48
 */
public class Order {
    private String id;
    private String movieId;
//    private String roomId;
    private String userId;

    public Order() {
    }

    public Order(String movieId, String userId) {
        this.id = GetUUID.getUUID();
        this.movieId = movieId;
        this.userId = userId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
