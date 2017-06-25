/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.Hotel;
import java.util.List;

/**
 *
 * @author user
 */
public interface HotelDAO 
{
    public Hotel addHotel(Hotel hotel) ;
    public void updateHotel(Hotel hotel) ;
    public List<Hotel> listHotels() ;
    public Hotel getHotelById(long id) ;
    public void deleteHotel(long id) ;
    public List<Hotel> listHotelsPage(int page, int size) ;
    public List<Hotel> searchHotelsPage(String search, int page, int size) ;
    public int countHotels() ;
    public int searchCountHotels(String search) ;
}
