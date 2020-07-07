package com.bimo.controller;

/*
 * @fileName: RoomController
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 17: 17
 */

import com.bimo.pojo.Room;
import com.bimo.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    private RoomService roomService;

    @Autowired
    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping
    public ModelAndView getRooms() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("roomManager");
        modelAndView.addObject("rooms", roomService.getAllRooms());
        return modelAndView;
    }

    @PostMapping
    @ResponseBody
    public String saveRoom(Room room) {
        Room tmp = new Room(room.getRoomName(), room.getCharts());
        roomService.saveRoom(tmp);
        return "success";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteRoomById(String id) {
        roomService.deleteRoomById(id);
        return "删除成功！";
    }
}
