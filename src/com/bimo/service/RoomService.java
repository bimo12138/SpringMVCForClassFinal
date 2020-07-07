package com.bimo.service;

import com.bimo.pojo.Room;

import java.util.List;

/*
 * @fileName: RoomService
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 16: 29
 */
public interface RoomService {
    public List<Room> getAllRooms();
    public void saveRoom(Room room);
    public void deleteRoomById(String id);
}
