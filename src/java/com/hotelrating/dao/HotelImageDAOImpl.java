/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.HotelImage;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
public class HotelImageDAOImpl implements HotelImageDAO
{
    private static final Logger logger = LoggerFactory.getLogger(HotelDAOImpl.class) ;
    
    @Autowired
    private SessionFactory sessionFactory ;
    
    public void setSessionFactory(SessionFactory sf)
    {
        this.sessionFactory = sf ;
    }
    
    @Override
    public void addHotelImage(HotelImage hotelImage)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.persist(hotelImage) ;
        logger.debug("Add HotelImage = {}", hotelImage) ;
    }
    
    @Override
    public void updateHotelImage(HotelImage hotelImage)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.update(hotelImage) ;
        logger.debug("Update HotelImage = {}", hotelImage) ;
    }
    
    @Override
    public List<HotelImage> listHotelImages()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of HotelImage") ;
        return session.createSQLQuery("SELECT * FROM hotel_image").list() ;
    }
    
    @Override
    public HotelImage getHotelImageById(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get HotelImage by ID = {}", id) ;
        return (HotelImage) session.load(HotelImage.class, id) ;
    }
    
    @Override
    public void deleteHotelImage(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        HotelImage hotelImage = (HotelImage) session.load(HotelImage.class, id) ;
        if (hotelImage != null)
        {
            session.delete(hotelImage) ;
        }
        logger.debug("HotelImage deleted = {}", hotelImage) ;
    }
}
