package com.bimo.service.impl;

import com.bimo.dao.MovieDao;
import com.bimo.pojo.Movie;
import com.bimo.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @fileName: MovieServiceImpl
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 14: 14
 */
@Service
public class MovieServiceImpl implements MovieService {

    private MovieDao movieDao;



    @Autowired
    public void setMovieDao(MovieDao movieDao) {
        this.movieDao = movieDao;
    }

    @Override
    public Movie getMovieById(String id) {
        return movieDao.getMovieById(id);
    }
    @Override
    public List<Movie> getAllMovie() {
        return movieDao.getAllMovie();
    }

    @Override
    public void saveMovie(Movie movie) {
        movieDao.saveMovie(movie);
    }

    @Override
    public void deleteMovieById(String id) {
        movieDao.deleteMovieById(id);
    }

    @Override
    public List<Movie> getMovieOrderByScore() {
        return movieDao.getMovieOrderByScore();
    }

    @Override
    public List<Movie> getMovieOrderByUpload() {
        return movieDao.getMovieOrderByUpload();
    }
}
