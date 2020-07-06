package com.bimo.pojo;

import com.bimo.utils.GetUUID;

import java.util.Date;

public class Command {
    private String id;
    private String videoName;
    private String content;
    private String author;
    private Date uploadTime;

    public Command() {
    }

    public Command(String videoName, String content, String author) {
        this.id = GetUUID.getUUID();
        this.videoName = videoName;
        this.content = content;
        this.author = author;
        this.uploadTime = new Date();
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
}
