/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Hotel;
import com.hotelrating.model.HotelImage;
import com.hotelrating.service.HotelImageService;
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
    
    @RequestMapping(value = "/hotelImages", method = RequestMethod.GET)
    public String listHotelImages(Model model)
    {
        model.addAttribute("hotelImage", new Hotel()) ;
        model.addAttribute("listHotelImages", this.hotelImageService.listHotelImages()) ;
        return "hotelImage" ;
    }
    
    @RequestMapping(value = "/hotelImage/add", method = RequestMethod.POST)
    public String addOrUpdateHotelImage(@ModelAttribute("hotelImage") HotelImage hotelImage)
    {
        if (hotelImage.getImageId() == 0)
        {
            this.hotelImageService.addHotelImage(hotelImage) ;
        }
        else
        {
            this.hotelImageService.updateHotelImage(hotelImage) ;
        }
        return "redirect:/hotelImages" ;
    }
    
    @RequestMapping(value = "/hotelImage/remove/{id}")
    public String deleteHotelImage(@PathVariable long id)
    {
        this.hotelImageService.deleteHotelImage(id) ;
        return "redirect:/hotels" ;
    }
    
    @RequestMapping(value = "/hotelImage/edit/{id}")
    public String updateHotelImage(@PathVariable long id, Model model)
    {
        model.addAttribute("hotelImage", this.hotelImageService.getHotelImageById(id)) ;
        model.addAttribute("listHotelImages", this.hotelImageService.listHotelImages()) ;
        return "hotelImage" ;
    }
}
