/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.CountLocation;
import com.hotelrating.model.Rating;
import java.math.BigDecimal;
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
    
    @Override
    public List<CountLocation> getCountByLocation()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Object[] object = (Object[]) session.createSQLQuery("SELECT SUM(CASE WHEN u.user_location = 1 THEN 1 ELSE 0 END) AS Johor," +
                                                 "SUM(CASE WHEN u.user_location = 2 THEN 1 ELSE 0 END) AS Melaka," +
                                                 "SUM(CASE WHEN u.user_location = 3 THEN 1 ELSE 0 END) AS 'Negeri Sembilan'," +
                                                 "SUM(CASE WHEN u.user_location = 4 THEN 1 ELSE 0 END) AS Selangor," +
                                                 "SUM(CASE WHEN u.user_location = 5 THEN 1 ELSE 0 END) AS 'Kuala Lumpur'," +
                                                 "SUM(CASE WHEN u.user_location = 6 THEN 1 ELSE 0 END) AS Perak," +
                                                 "SUM(CASE WHEN u.user_location = 7 THEN 1 ELSE 0 END) AS Kedah," +
                                                 "SUM(CASE WHEN u.user_location = 8 THEN 1 ELSE 0 END) AS 'Pulau Pinang'," +
                                                 "SUM(CASE WHEN u.user_location = 9 THEN 1 ELSE 0 END) AS Perlis," +
                                                 "SUM(CASE WHEN u.user_location = 10 THEN 1 ELSE 0 END) AS Terengganu," +
                                                 "SUM(CASE WHEN u.user_location = 11 THEN 1 ELSE 0 END) AS Kelantan," +
                                                 "SUM(CASE WHEN u.user_location = 12 THEN 1 ELSE 0 END) AS Sabah," +
                                                 "SUM(CASE WHEN u.user_location = 13 THEN 1 ELSE 0 END) AS Sarawak," +
                                                 "SUM(CASE WHEN u.user_location = 14 THEN 1 ELSE 0 END) AS Labuan " +
                                                 "FROM rating r JOIN user u ON r.rating_user = u.user_id ;").uniqueResult() ;
        
        List<CountLocation> result = new ArrayList<>() ;
        result.add(new CountLocation("Johor", ((BigDecimal) object[0]).intValue())) ;
        result.add(new CountLocation("Melaka", ((BigDecimal) object[1]).intValue())) ;
        result.add(new CountLocation("Negeri Sembilan", ((BigDecimal) object[2]).intValue())) ;
        result.add(new CountLocation("Selangor", ((BigDecimal) object[3]).intValue())) ;
        result.add(new CountLocation("Kuala Lumpur", ((BigDecimal) object[4]).intValue())) ;
        result.add(new CountLocation("Perak", ((BigDecimal) object[5]).intValue())) ;
        result.add(new CountLocation("Kedah", ((BigDecimal) object[6]).intValue())) ;
        result.add(new CountLocation("Pulau Pinang", ((BigDecimal) object[7]).intValue())) ;
        result.add(new CountLocation("Perlis", ((BigDecimal) object[8]).intValue())) ;
        result.add(new CountLocation("Terengganu", ((BigDecimal) object[9]).intValue())) ;
        result.add(new CountLocation("Kelantan", ((BigDecimal) object[10]).intValue())) ;
        result.add(new CountLocation("Sabah", ((BigDecimal) object[11]).intValue())) ;
        result.add(new CountLocation("Sarawak", ((BigDecimal) object[12]).intValue())) ;
        result.add(new CountLocation("Labuan", ((BigDecimal) object[13]).intValue())) ;
        
        return result ;
    }
    
    @Override
    public int getTotalCount()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        return (int) ((BigInteger) session.createSQLQuery("SELECT COUNT(*) FROM rating").uniqueResult()).intValue() ;
    }
    
    @Override
    public List<CountLocation> getCountRatingByHotel(long hotelId)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Object[] object = (Object[]) session.createSQLQuery("SELECT SUM(CASE WHEN rating_rate = 5 THEN 1 ELSE 0 END) AS Best," +
                                                            "SUM(CASE WHEN rating_rate BETWEEN 4 AND 4.9 THEN 1 ELSE 0 END) AS Good," +
                                                            "SUM(CASE WHEN rating_rate BETWEEN 3 AND 3.9 THEN 1 ELSE 0 END) AS Average," +
                                                            "SUM(CASE WHEN rating_rate BETWEEN 2 AND 2.9 THEN 1 ELSE 0 END) AS Bad," +
                                                            "SUM(CASE WHEN rating_rate BETWEEN 1 AND 1.9 THEN 1 ELSE 0 END) AS Worst " +
                                                            "FROM rating WHERE rating_hotel = :hotelId")
                                                            .setParameter("hotelId", hotelId).uniqueResult() ;
        List<CountLocation> result = new ArrayList<>() ;
        result.add(new CountLocation("Best", ((BigDecimal) object[0]).intValue())) ;
        result.add(new CountLocation("Good", ((BigDecimal) object[1]).intValue())) ;
        result.add(new CountLocation("Average", ((BigDecimal) object[2]).intValue())) ;
        result.add(new CountLocation("Bad", ((BigDecimal) object[3]).intValue())) ;
        result.add(new CountLocation("Worst", ((BigDecimal) object[4]).intValue())) ;
        
        return result ;
    }
    
    @Override
    public int getTotalCountRatingByHotel(long hotelId)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        return (int) ((BigInteger) session.createSQLQuery("SELECT COUNT(*) FROM rating WHERE rating_hotel = :hotelId")
                                   .setParameter("hotelId", hotelId).uniqueResult()).intValue() ;
    }
    
    @Override
    public List<CountLocation> getCountRatingByType(long hotelId)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Object[] object = (Object[]) session.createSQLQuery("SELECT SUM(CASE WHEN u.user_type = 1 THEN 1 ELSE 0 END) AS Traveler," +
                                                            "SUM(CASE WHEN u.user_type = 2 THEN 1 ELSE 0 END) AS Family," +
                                                            "SUM(CASE WHEN u.user_type = 3 THEN 1 ELSE 0 END) AS Business " +
                                                            "FROM rating r JOIN user u ON r.rating_user = u.user_id " +
                                                            "WHERE rating_hotel = :hotelId")
                                                            .setParameter("hotelId", hotelId)
                                                            .uniqueResult() ;
        List<CountLocation> result = new ArrayList<>() ;
        result.add(new CountLocation("Traveler", ((BigDecimal) object[0]).intValue())) ;
        result.add(new CountLocation("Family", ((BigDecimal) object[1]).intValue())) ;
        result.add(new CountLocation("Business", ((BigDecimal) object[2]).intValue())) ;
        return result ;
    }
}
