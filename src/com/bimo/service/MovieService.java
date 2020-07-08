package com.bimo.service;

import com.bimo.pojo.Movie;

import java.util.List;

/*
 * @fileName: movieService
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 14: 12
 */
public interface MovieService {
    public List<Movie> getAllMovie();
    public void saveMovie(Movie movie);
    public void deleteMovieById(String id);
    public List<Movie> getMovieOrderByScore();
    public List<Movie> getMovieOrderByUpload();
    public Movie getMovieById(String id);
}
