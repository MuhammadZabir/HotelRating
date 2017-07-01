/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.dao.HotelImageDAO;
import com.hotelrating.model.HotelImage;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Service
public class HotelImageServiceImpl implements HotelImageService
{
    private HotelImageDAO hotelImageDAO ;
    
    public void setHotelImageDAO(HotelImageDAO hotelImageDAO)
    {
        this.hotelImageDAO = hotelImageDAO ;
    }
    
    @Override
    @Transactional
    public void addHotelImage(HotelImage hotelImage)
    {
        this.hotelImageDAO.addHotelImage(hotelImage) ;
    }
    
    @Override
    @Transactional
    public void updateHotelImage(HotelImage hotelImage)
    {
        this.hotelImageDAO.updateHotelImage(hotelImage) ;
    }
    
    @Override
    @Transactional
    public List<HotelImage> listHotelImages()
    {
        return this.hotelImageDAO.listHotelImages() ;
    }
    
    @Override
    @Transactional
    public HotelImage getHotelImageById(long id)
    {
        return this.hotelImageDAO.getHotelImageById(id) ;
    }
    
    @Override
    @Transactional
    public void deleteHotelImage(long id)
    {
        this.hotelImageDAO.deleteHotelImage(id) ;
    }
    
    @Override
    @Transactional
    public List<String> getAllImagesByHotel(long hotelId)
    {
        return this.hotelImageDAO.getAllImagesByHotel(hotelId) ;
    }
}
