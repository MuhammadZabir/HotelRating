/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.Hotel;
import java.util.List;
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
}
