/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Rating;
import com.hotelrating.service.HotelService;
import com.hotelrating.service.RatingService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author user
 */
@Controller
public class RatingController 
{
    private RatingService ratingService ;
    private HotelService hotelService ;
    
    @Autowired(required = true)
    @Qualifier(value = "ratingService")
    public void setRatingService(RatingService ratingService)
    {
        this.ratingService = ratingService ;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "hotelService")
    public void setHotelService(HotelService hotelService)
    {
        this.hotelService = hotelService ;
    }
    
    @RequestMapping(value = "/ratings", method = RequestMethod.GET)
    public String listRatings(Model model)
    {
        model.addAttribute("rating", new Rating()) ;
        model.addAttribute("listRatings", this.ratingService.listRatings()) ;
        return "rating" ;
    }
    
    @RequestMapping(value = "/rating/add", method = RequestMethod.POST)
    public String addOrUpdateRating(@ModelAttribute("rating") Rating rating)
    {
        if (rating.getRatingId() == 0)
        {
            this.ratingService.addRating(rating) ;
        }
        else
        {
            this.ratingService.updateRating(rating) ;
        }
        return "redirect:/ratings" ;
    }
    
    @RequestMapping(value = "/rating/remove/{id}")
    public String deleteRating(@PathVariable long id)
    {
        this.ratingService.deleteRating(id) ;
        return "redirect:/ratings" ;
    }
    
    @RequestMapping(value = "/rating/edit/{id}")
    public String updateRating(@PathVariable long id, Model model)
    {
        model.addAttribute("rating", this.ratingService.getRatingById(id)) ;
        model.addAttribute("listRatings", this.ratingService.listRatings()) ;
        return "rating" ;
    }
    
    @RequestMapping(value = "/rating/{id}", method = RequestMethod.GET)
    public ModelAndView viewRateForm(HttpServletRequest request, HttpServletResponse response, @PathVariable long id) 
    {
        ModelAndView model = new ModelAndView() ;
        model.addObject("hotel", this.hotelService.getHotelById(id)) ;
        model.setViewName("ratingHotel") ;
        return model ;
    }
    
}
