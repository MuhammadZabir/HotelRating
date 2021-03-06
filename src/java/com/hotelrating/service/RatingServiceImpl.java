/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.dao.RatingDAO;
import com.hotelrating.model.CountLocation;
import com.hotelrating.model.Rating;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Service
public class RatingServiceImpl implements RatingService
{
    private RatingDAO ratingDAO ;
    
    public void setRatingDAO(RatingDAO ratingDAO)
    {
        this.ratingDAO = ratingDAO ;
    }
    
    @Override
    @Transactional
    public void addRating(Rating rating)
    {
        this.ratingDAO.addRating(rating) ;
    }
    
    @Override
    @Transactional
    public void updateRating(Rating rating)
    {
        this.ratingDAO.updateRating(rating) ;
    }
    
    @Override
    @Transactional
    public List<Rating> listRatings()
    {
        return this.ratingDAO.listRatings() ;
    }
    
    @Override
    @Transactional
    public Rating getRatingById(long id)
    {
        return this.ratingDAO.getRatingById(id) ;
    }
    
    @Override
    @Transactional
    public void deleteRating(long id)
    {
        this.ratingDAO.deleteRating(id) ;
    }
    
    @Override
    @Transactional
    public boolean validateExistance(long hotelId, long userId)
    {
        return this.ratingDAO.validateExistance(hotelId, userId) ;
    }
    
    @Override
    @Transactional
    public Rating getRatingByHotelAndUser(long hotelId, long userId)
    {
        return this.ratingDAO.getRatingByHotelAndUser(hotelId, userId) ;
    }
    
    @Override
    @Transactional
    public List<Rating> getAllByHotelId(long hotelId)
    {
        return this.ratingDAO.getAllByHotelId(hotelId ) ;
    }
    
    @Override
    @Transactional
    public List<CountLocation> getCountByLocation()
    {
        return this.ratingDAO.getCountByLocation() ;
    }
    
    @Override
    @Transactional
    public int getTotalCount()
    {
        return this.ratingDAO.getTotalCount() ;
    }
    
    @Override
    @Transactional
    public List<CountLocation> getCountRatingByHotel(long hotelId)
    {
        return this.ratingDAO.getCountRatingByHotel(hotelId) ;
    }
    
    @Override
    @Transactional
    public int getTotalCountRatingByHotel(long hotelId)
    {
        return this.ratingDAO.getTotalCountRatingByHotel(hotelId) ;
    }
    
    @Override
    @Transactional
    public List<CountLocation> getCountRatingByType(long hotelId)
    {
        return this.ratingDAO.getCountRatingByType(hotelId) ;
    }
}
