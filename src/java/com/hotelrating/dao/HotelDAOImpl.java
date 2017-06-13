/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.Hotel;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
    public void addHotel(Hotel hotel)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.persist(hotel) ;
        logger.debug("Add hotel = {}", hotel) ;
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
        logger.debug("Get Hotel by ID = {}", id) ;
        return (Hotel) session.load(Hotel.class, id) ;
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
        try 
        {
            ScrollableResults scrollableResults = getCriteria(session).scroll() ;
            scrollableResults.last() ;
            scrollableResults.close() ;
            Criteria criteria = getCriteria(session) ;
            criteria.setFirstResult(page) ;
            criteria.setMaxResults(size) ;
            hotels = criteria.list() ;
        } 
        catch (HibernateException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            session.close();
        }
        return hotels;
    }
    
    @Override
    public List<Hotel> searchHotelsPage(String search, int page, int size)
    {
        List<Hotel> hotels = null ;
        Session session = this.sessionFactory.getCurrentSession() ;
        Criteria criteria = getCriteria(session) ;
        criteria.add(Restrictions.sqlRestriction("MATCH({alias}.hotel_name) AGAINST('" +
                                                  search + "' IN BOOLEAN MODE)")) ;
        criteria.setFirstResult(page) ;
        criteria.setMaxResults(size) ;
        ScrollableResults scrollableResults = criteria.scroll() ;
        scrollableResults.last() ;
        scrollableResults.close() ;
        hotels = criteria.list() ;
        
        return hotels ;
    }
    
    private static Criteria getCriteria(Session session) 
    {
        Criteria criteria = session.createCriteria(Hotel.class);
        criteria.add(Restrictions.isNotNull("hotelName"));
        criteria.setProjection(Projections.projectionList()
                .add(Projections.property("hotelName"))
                .add(Projections.property("hotelId")));
        criteria.addOrder(Order.asc("hotelId"));
        return criteria;
    }
}
