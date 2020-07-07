package com.bimo.pojo;

import com.bimo.utils.GetUUID;

import java.util.ArrayList;
import java.util.List;

public class Room {
    private String id;
    private String roomName;
    private Integer status;
    private Integer charts;

    public Room() {
    }

    public Room(String roomName, Integer charts) {
        this.id = GetUUID.getUUID();
        this.roomName = roomName;
        this.status = 0;
        this.charts = charts;
    }

    public void setCharts(Integer charts) {
        this.charts = charts;
    }

    public Integer getCharts() {
        return charts;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
