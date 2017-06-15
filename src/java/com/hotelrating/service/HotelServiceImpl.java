/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.dao.HotelDAO;
import com.hotelrating.model.Hotel;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Service
public class HotelServiceImpl implements HotelService 
{
    private HotelDAO hotelDAO ;
    
    public void setHotelDAO(HotelDAO hotelDAO)
    {
        this.hotelDAO = hotelDAO ;
    }
    
    @Override
    @Transactional
    public void addHotel(Hotel hotel)
    {
        this.hotelDAO.addHotel(hotel) ;
    }
    
    @Override
    @Transactional
    public void updateHotel(Hotel hotel)
    {
        this.hotelDAO.updateHotel(hotel) ;
    }
    
    @Override
    @Transactional
    public List<Hotel> listHotels()
    {
        return this.hotelDAO.listHotels() ;
    }
    
    @Override
    @Transactional
    public Hotel getHotelById(long id)
    {
        return this.hotelDAO.getHotelById(id) ;
    }
    
    @Override
    @Transactional
    public void deleteHotel(long id)
    {
        this.hotelDAO.deleteHotel(id) ;
    }
    
    @Override
    @Transactional
    public List<Hotel> listHotelsPage(int page, int size)
    {
        return this.hotelDAO.listHotelsPage(page, size) ;
    }
    
    @Override
    @Transactional
    public int countHotels()
    {
        return this.hotelDAO.countHotels() ;
    }
    
    @Override
    @Transactional
    public int searchCountHotels(String search)
    {
        return this.hotelDAO.searchCountHotels(search) ;
    }
}
