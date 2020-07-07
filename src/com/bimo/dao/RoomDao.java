package com.bimo.dao;
/*
 * @fileName: RoomDao
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 16: 22
 */

import com.bimo.pojo.Room;

import java.util.List;

public interface RoomDao {
    public List<Room> getAllRooms();
    public void saveRoom(Room room);
    public void deleteRoomById(String id);
}
