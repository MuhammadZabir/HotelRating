/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Hotel;
import com.hotelrating.service.HotelService;
import javax.servlet.http.HttpServletRequest;
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
public class HotelController
{
    private HotelService hotelService ;
    
    @Autowired(required = true)
    @Qualifier(value = "hotelService")
    public void setHotelService(HotelService hotelService)
    {
        this.hotelService = hotelService ;
    }
    
    @RequestMapping(value = "/hotels")
    public String listHotels(HttpServletRequest request, HttpSession session, Model model)
    {
        model.addAttribute("listHotels", this.hotelService.listHotels()) ;
        return "hotel" ;
    }
    
    @RequestMapping(value = "/hotel/add", method = RequestMethod.POST)
    public String addOrUpdateHotel(@ModelAttribute("hotel") Hotel hotel)
    {
        if (hotel.getHotelId() == 0)
        {
            this.hotelService.addHotel(hotel) ;
        }
        else
        {
            this.hotelService.updateHotel(hotel) ;
        }
        return "redirect:/hotels" ;
    }
    
    @RequestMapping(value = "/hotel/remove/{id}")
    public String deleteHotel(@PathVariable long id)
    {
        this.hotelService.deleteHotel(id) ;
        return "redirect:/hotels" ;
    }
    
    @RequestMapping(value = "/hotel/edit/{id}")
    public String updateHotel(@PathVariable long id, Model model)
    {
        model.addAttribute("hotel", this.hotelService.getHotelById(id)) ;
        model.addAttribute("listHotels", this.hotelService.listHotels()) ;
        return "hotel" ;
    }
}
