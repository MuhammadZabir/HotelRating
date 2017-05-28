/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.model.Hotel;
import java.util.List;

/**
 *
 * @author user
 */
public interface HotelService 
{
    public void addHotel(Hotel hotel) ;
    public void updateHotel(Hotel hotel) ;
    public List<Hotel> listHotels() ;
    public Hotel getHotelById(long id) ;
    public void deleteHotel(long id) ;
    
}
