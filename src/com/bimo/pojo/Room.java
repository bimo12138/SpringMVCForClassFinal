package com.bimo.pojo;

import com.bimo.utils.GetUUID;

public class Room {
    private String id;
    private String roomName;
    private Integer status;

    public Room() {
    }

    public Room(String roomName) {
        this.id = GetUUID.getUUID();
        this.roomName = roomName;
        this.status = 0;
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
