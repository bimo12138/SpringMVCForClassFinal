package com.bimo.controller;

import com.bimo.pojo.Movie;
import com.bimo.service.MovieService;
import com.bimo.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/movie")
public class MovieController {

    private MovieService movieService;

    @Autowired
    public void setUserService(MovieService movieService) {
        this.movieService = movieService;
    }

    @GetMapping
    public ModelAndView getVideoById(String movieId) {
        ModelAndView modelAndView = new ModelAndView();
        Movie movie = movieService.getMovieById(movieId);
        modelAndView.setViewName("movie");
        modelAndView.addObject("movie", movie);
        return modelAndView;
    }

    @RequestMapping(value = "/orderByScore", method = RequestMethod.GET)
    @ResponseBody
    public List<Movie> getVideoByScore() {
        return movieService.getMovieOrderByScore();
    }

    @RequestMapping(value = "/orderByUpload", method = RequestMethod.GET)
    @ResponseBody
    public List<Movie> getVideoByUpload() {
        return movieService.getMovieOrderByUpload();
    }

}
