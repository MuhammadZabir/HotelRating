/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.model.CountLocation;
import com.hotelrating.model.Rating;
import java.util.List;

/**
 *
 * @author user
 */
public interface RatingService 
{
    public void addRating(Rating rating) ;
    public void updateRating(Rating rating) ;
    public List<Rating> listRatings() ;
    public Rating getRatingById(long id) ;
    public void deleteRating(long id) ;
    public boolean validateExistance(long hotelId, long userId) ;
    public Rating getRatingByHotelAndUser(long hotelId, long userId) ;
    public List<Rating> getAllByHotelId(long hotelId) ;
    public List<CountLocation> getCountByLocation() ;
    public int getTotalCount() ;
    public List<CountLocation> getCountRatingByHotel(long hotelId) ;
    public int getTotalCountRatingByHotel(long hotelId) ;
    public List<CountLocation> getCountRatingByType(long hotelId) ;
}
