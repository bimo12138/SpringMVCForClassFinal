package com.bimo.service.impl;

import com.bimo.dao.MovieDao;
import com.bimo.dao.RoomDao;
import com.bimo.pojo.Movie;
import com.bimo.pojo.Room;
import com.bimo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @fileName: RoomServiceImpl
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 16: 30
 */
@Service
public class RoomServiceImpl implements RoomService {

    private RoomDao roomDao;

    @Autowired
    public void setRoomDao(RoomDao roomDao) {
        this.roomDao = roomDao;
    }

    @Override
    public List<Room> getAllRooms() {
        return roomDao.getAllRooms();
    }

    @Override
    public void saveRoom(Room room) {
        roomDao.saveRoom(room);
    }

    @Override
    public void deleteRoomById(String id) {
        roomDao.deleteRoomById(id);
    }
}
