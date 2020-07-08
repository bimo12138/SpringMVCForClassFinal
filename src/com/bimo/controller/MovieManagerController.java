package com.bimo.controller;
/*
 * @fileName: MovieManagerController
 * @author  : 13716
 * @Date    : 2020 - 07 - 07 16: 17
 */

import com.bimo.pojo.Movie;
import com.bimo.pojo.Room;
import com.bimo.service.MovieService;
import com.bimo.service.RoomService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.java2d.pipe.SpanShapeRenderer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/movieManager")
public class MovieManagerController {

    private RoomService roomService;
    private MovieService movieService;

    @Autowired
    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    @Autowired
    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }

    @GetMapping
    public ModelAndView getMovieManager() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("movieManager");
        modelAndView.addObject("movies", movieService.getAllMovie());
        return modelAndView;
    }

    @PostMapping
    @ResponseBody
    public String saveMovie(String movieName, String movieType, String deployTime, String rooms, Double price, @RequestParam("movieLogo") MultipartFile movieLogo, HttpServletRequest request) throws IOException, ParseException {
        ModelAndView modelAndView = new ModelAndView();

        if (movieLogo.isEmpty()) {
            return "上传失败！";
        } else {
            deployTime = deployTime.replace("T", " ");
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            date = dateFormat.parse(deployTime);
            String logoPath = request.getSession().getServletContext().getRealPath("/media/");
            FileUtils.copyInputStreamToFile(movieLogo.getInputStream(), new File(logoPath, Objects.requireNonNull(movieLogo.getOriginalFilename())));
            Movie movie = new Movie(movieName, movieType, date, rooms, price);
            movie.setScore(0.0);
            movie.setLogoPath(movieLogo.getOriginalFilename());
            movieService.saveMovie(movie);
            return "上传成功！";
        }
    }

    @RequestMapping(value = "/rooms", method = RequestMethod.GET)
    @ResponseBody
    public List<Room> getRooms() {
        return roomService.getAllRooms();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteMovieById(String id) {
        movieService.deleteMovieById(id);
        return "删除成功！";
    }
}
