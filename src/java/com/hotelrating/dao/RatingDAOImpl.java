/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.Rating;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
public class RatingDAOImpl implements RatingDAO
{
    private static final Logger logger = LoggerFactory.getLogger(RatingDAOImpl.class) ;
    
    @Autowired
    private SessionFactory sessionFactory ;
    
    public void setSessionFactory(SessionFactory sf)
    {
        this.sessionFactory = sf ;
    }
    
    @Override
    public void addRating(Rating rating)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.persist(rating) ;
        logger.debug("Add rating = {}", rating) ;
    }
    
    @Override
    public void updateRating(Rating rating)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.update(rating) ;
        logger.debug("Update rating = {}", rating) ;
    }
    
    @Override
    public List<Rating> listRatings()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of Rating") ;
        return session.createSQLQuery("SELECT * FROM rating").list() ;
    }
    
    @Override
    public Rating getRatingById(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get Rating by ID = {}", id) ;
        return (Rating) session.load(Rating.class, id) ;
    }
    
    @Override
    public void deleteRating(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Rating rating = (Rating) session.load(Rating.class, id) ;
        if (rating != null)
        {
            session.delete(rating) ;
        }
        logger.debug("Rating deleted = {}", rating) ;
    }
    
    @Override
    public boolean validateExistance(long hotelId, long userId)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Query query = session.createSQLQuery("SELECT COUNT(1) FROM rating where rating_user = :rating_user AND rating_hotel = :rating_hotel")
                .setParameter("rating_user", userId).setParameter("rating_hotel", hotelId) ;
        List<BigInteger> results = query.list() ;
        
        return results.get(0).intValue() > 0 ;
    }
    
    @Override   
    public Rating getRatingByHotelAndUser(long hotelId, long userId) //This is one of way to implement check IndexController for another
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Rating rate = null ;
        Query query =  session.createQuery("FROM Rating WHERE ratingHotel.hotelId = :ratingHotel AND ratingUser.userId = :ratingUser") ;
        query.setParameter("ratingHotel", hotelId) ;
        query.setParameter("ratingUser", userId) ;
        List<Rating> results = query.list() ;
        for (Rating rating : results)
        {
            rate = rating ;
        }
        
        return rate ;
    }
    
    @Override
    public List<Rating> getAllByHotelId(long hotelId)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        List<Rating> rate = new ArrayList<>() ;
        Query query = session.createQuery("FROM Rating WHERE ratingHotel.hotelId = :ratingHotel")
                             .setParameter("ratingHotel", hotelId) ;
        rate = query.list() ;
        return rate ;
    }
}
