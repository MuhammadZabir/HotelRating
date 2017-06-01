/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.model.HotelImage;
import java.util.List;

/**
 *
 * @author user
 */
public interface HotelImageService 
{
    public void addHotelImage(HotelImage hotelImage) ;
    public void updateHotelImage(HotelImage hotelImage) ;
    public List<HotelImage> listHotelImages() ;
    public HotelImage getHotelImageById(long id) ;
    public void deleteHotelImage(long id) ;
}