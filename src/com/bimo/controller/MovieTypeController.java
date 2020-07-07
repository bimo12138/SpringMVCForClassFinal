package com.bimo.controller;

/*
 * @author : 13716
 * @fileName: MovieTypeController
 * @Date : 2020 - 07 - 06 19: 46
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/movieType")
public class MovieTypeController {

    @GetMapping
    @ResponseBody
    public List<String> getMovieType() {
        List<String> movieType = new ArrayList<>();
        movieType.add("爱情片");
        movieType.add("动作片");
        return movieType;
    }
}
