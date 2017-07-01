/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Hotel;
import com.hotelrating.model.HotelImage;
import com.hotelrating.model.User;
import com.hotelrating.service.HotelImageService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author user
 */
@Controller
public class HotelImageController 
{
    private HotelImageService hotelImageService ;
    
    @Autowired(required = true)
    @Qualifier(value = "hotelImageService")
    public void setHotelImageService(HotelImageService hotelImageService)
    {
        this.hotelImageService = hotelImageService ;
    }
    
    private boolean validateSession(HttpSession session)
    {
        User user = (User) session.getAttribute("loggedInUser") ;
        return user != null ;
    }
}
