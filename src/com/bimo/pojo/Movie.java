package com.bimo.pojo;

import com.bimo.utils.GetUUID;

import java.util.Date;
import java.util.List;

public class Movie {
    private String id;
    private String name;
    private String type;
    private Double score;
    private String logoPath;
    private Date upload_time;
    private Date deploy_time;
    private List<String> rooms;
    private Double price;

    public Movie() {
    }

    public Movie(String name, String type, Double score, Date deploy_time, List<String> rooms, Double price) {
        this.id = GetUUID.getUUID();
        this.name = name;
        this.type = type;
        this.score = score;
        this.deploy_time = deploy_time;
        this.rooms = rooms;
        this.price = price;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Date getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(Date upload_time) {
        this.upload_time = upload_time;
    }

    public Date getDeploy_time() {
        return deploy_time;
    }

    public void setDeploy_time(Date deploy_time) {
        this.deploy_time = deploy_time;
    }

    public List<String> getRooms() {
        return rooms;
    }

    public void setRooms(List<String> rooms) {
        this.rooms = rooms;
    }
}
