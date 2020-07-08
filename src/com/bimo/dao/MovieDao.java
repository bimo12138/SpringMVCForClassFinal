package com.bimo.dao;

import com.bimo.pojo.Movie;

import java.util.List;

public interface MovieDao {
    public Movie getMovieById(String id);
    public void saveMovie(Movie movie);
    public List<Movie> getAllMovie();
    public void deleteMovieById(String id);
    public List<Movie> getMovieOrderByScore();
    public List<Movie> getMovieOrderByUpload();
}
