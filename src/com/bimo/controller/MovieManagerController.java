package com.bimo.controller;
/*
 * @fileName: MovieManagerController
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 16: 17
 */

import com.bimo.pojo.Room;
import com.bimo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/movieManager")
public class MovieManagerController {

    private RoomService roomService;

    @Autowired
    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping
    public String getMovieManager() {
        return "movieManager";
    }

    @RequestMapping(value = "/rooms", method = RequestMethod.GET)
    @ResponseBody
    public List<Room> getRooms() {
        return roomService.getAllRooms();
    }
}
