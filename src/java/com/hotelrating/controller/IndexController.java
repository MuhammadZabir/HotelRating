/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.User;
import com.hotelrating.service.HotelService;
import com.hotelrating.service.UserService;
import com.hotelrating.util.UserRoleEnum;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
public class IndexController 
{
    private UserService userService ;
    private HotelService hotelService ;
    
    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService)
    {
        this.userService = userService ;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "hotelService")
    public void setHotelService(HotelService hotelService)
    {
        this.hotelService = hotelService ;
    }
    
    @RequestMapping(value = "/")
    public ModelAndView index(HttpSession session, HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView() ;
        User user = (User) session.getAttribute("loggedInUser") ;
        if (user != null)
        {
            if (user.getUserRole() == UserRoleEnum.User.getValue())
                model.setViewName("redirect:/index/1") ;
            else
                model.setViewName("indexAdmin") ;
        }
        else
        {
            model.addObject("user", new User()) ;
            model.setViewName("login") ;
        }
        return model ;
    }
    
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView executeLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user")User user)
    {
        ModelAndView model = null;
        try
        {
            model = new ModelAndView();
            if(userService.isValidUser(user.getUserName(), user.getUserPassword()))
            {
                user = userService.getUserByNameAndPassword(user.getUserName(), user.getUserPassword()) ;
                session.setAttribute("loggedInUser", user) ;
                if (user.getUserRole() == UserRoleEnum.User.getValue())
                {
                    int totalCount = this.hotelService.countHotels() ;
                    double page = Math.ceil((double) totalCount / 10.0) ;
                    request.setAttribute("paging", (int) page) ;
                    request.setAttribute("active", 1) ;
                    model.addObject("hotels", this.hotelService.listHotelsPage(0, 10)) ;
                    model.setViewName("index") ;
                }
                else
                {
                    model.setViewName("indexAdmin") ;
                }
            }
            else
            {
                model = new ModelAndView();
                model.setViewName("login");
                request.setAttribute("message", "Invalid credentials!!");
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return model;
    }
    
    @RequestMapping(value="/index/{page}", method = RequestMethod.GET)
    public ModelAndView allIndexPage(HttpServletRequest request, @PathVariable("page") int page)
    {
        ModelAndView model = new ModelAndView() ;
        int currentPage = page - 1 ;
        int totalCount = this.hotelService.countHotels() ;
        double pages = Math.ceil((double) totalCount / 10.0) ;
        request.setAttribute("paging", (int) pages) ;
        request.setAttribute("active", page) ;
        model.addObject("hotels", this.hotelService.listHotelsPage(currentPage, 10)) ;
        model.setViewName("index") ;
        return model ;
    }
    
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session)
    {
        ModelAndView model = new ModelAndView() ;
        session.invalidate() ;
        model.setViewName("redirect:/") ;
        return model ;
    }
    
    @RequestMapping(value = "/search/{search}&{page}", method = RequestMethod.GET)
    public ModelAndView searchIndexPage(HttpServletRequest request, @PathVariable("search") String search, @PathVariable("page") int page)
    {
        ModelAndView model = new ModelAndView() ;
        int currentPage = page - 1 ;
        int totalCount = this.hotelService.searchCountHotels(search) ;
        double pages = Math.ceil((double) totalCount / 10.0) ;
        request.setAttribute("paging", (int) pages) ;
        request.setAttribute("active", page) ;
        model.addObject("hotels", this.hotelService.searchHotelsPage(search, currentPage, 10)) ;
        model.setViewName("index") ;
        return model ;
    }
    
}
