/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.Hotel;
import java.math.BigInteger;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
public class HotelDAOImpl implements HotelDAO
{
    private static final Logger logger = LoggerFactory.getLogger(HotelDAOImpl.class) ;
    
    @Autowired
    private SessionFactory sessionFactory ;
    
    public void setSessionFactory(SessionFactory sf)
    {
        this.sessionFactory = sf ;
    }
    
    @Override
    public Hotel addHotel(Hotel hotel)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Add hotel = {}", hotel) ;
        session.persist(hotel) ;
        Hotel result = (Hotel) session.createQuery("FROM Hotel WHERE hotelName = :hotelName")
                              .setParameter("hotelName", hotel.getHotelName()).uniqueResult() ;
        
        return result ;  
    }
    
    @Override
    public void updateHotel(Hotel hotel)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.update(hotel) ;
        logger.debug("Update hotel = {}", hotel) ;
    }
    
    @Override
    public List<Hotel> listHotels()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of Hotel") ;
        return session.createSQLQuery("SELECT * FROM hotel").list() ;
    }
    
    @Override
    public Hotel getHotelById(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.info("Get Hotel by ID = {}", id) ;
        return (Hotel) session.get(Hotel.class, id) ;
    }
    
    @Override
    public void deleteHotel(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        Hotel hotel = (Hotel) session.load(Hotel.class, id) ;
        if (hotel != null)
        {
            session.delete(hotel) ;
        }
        logger.debug("Hotel deleted = {}", hotel) ;
    }
    
    @Override
    public List<Hotel> listHotelsPage(int page, int size)
    {
        List<Hotel> hotels = null;
        Session session = this.sessionFactory.getCurrentSession() ;
        Criteria criteria = getCriteria(session) ;
        criteria.addOrder(Order.desc("hotelRatingOverall")) ;
        ScrollableResults scrollableResults = criteria.scroll() ;
        scrollableResults.last() ;
        scrollableResults.close() ;
        criteria.setFirstResult(page * 10) ;
        criteria.setMaxResults(size) ;
        hotels = criteria.list() ;
        
        return hotels;
    }
    
    @Override
    public List<Hotel> searchHotelsPage(String search, int page, int size)
    {
        List<Hotel> hotels = null ;
        Session session = this.sessionFactory.getCurrentSession() ;
        Criteria criteria = getCriteria(session) ;
        criteria.add(Restrictions.sqlRestriction("MATCH({alias}.hotel_name) AGAINST('*" +
                                                  search + "*' IN BOOLEAN MODE)")) ;
        criteria.addOrder(Order.desc("hotelRatingOverall")) ;
        ScrollableResults scrollableResults = criteria.scroll() ;
        scrollableResults.last() ;
        scrollableResults.close() ;
        criteria.setFirstResult(page * 10) ;
        criteria.setMaxResults(size) ;
        hotels = criteria.list() ;
        
        return hotels ;
    }
    
    @Override
    public int countHotels()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of Hotel") ;
        BigInteger result = (BigInteger) session.createSQLQuery("SELECT COUNT(*) FROM hotel").uniqueResult() ;
        return result.intValue() ;
    }
    
    @Override
    public int searchCountHotels(String search)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of Hotel") ;
        BigInteger result = (BigInteger) session.createSQLQuery("SELECT COUNT(*) FROM hotel WHERE MATCH(hotel_name) AGAINST('*" + search + "*' IN BOOLEAN MODE)").uniqueResult() ;
        return result.intValue() ;
    }
    
    private static Criteria getCriteria(Session session) 
    {
        Criteria criteria = session.createCriteria(Hotel.class);
        criteria.add(Restrictions.isNotNull("hotelId"));
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("hotelId"), "hotelId")
                .add(Projections.property("hotelName"), "hotelName")
                .add(Projections.property("hotelOwner"), "hotelOwner")
                .add(Projections.property("hotelLocation"), "hotelLocation")
                .add(Projections.property("hotelStar"), "hotelStar")
                .add(Projections.property("hotelDescription"), "hotelDescription")
                .add(Projections.property("hotelMainImage"), "hotelMainImage")
                .add(Projections.property("hotelRatingOverall"), "hotelRatingOverall"))
                .setResultTransformer(Transformers.aliasToBean(Hotel.class)) ;
        return criteria;
    }
}
