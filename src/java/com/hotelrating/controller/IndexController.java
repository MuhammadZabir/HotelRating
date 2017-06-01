/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.User;
import com.hotelrating.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService)
    {
        this.userService = userService ;
    }
    
    @RequestMapping(value = "/")
    public ModelAndView index(HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView() ;
        model.setViewName("index") ;
        return model ;
    }
    
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView model = new ModelAndView();
        model.addObject("user", new User()) ;
        model.setViewName("login");
        return model;
    }
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("user")User user)
    {
        ModelAndView model= null;
        try
        {
            System.out.println(user.getUserPassword()) ;
            boolean isValidUser = userService.isValidUser(user.getUserName(), user.getUserPassword());
            if(isValidUser)
            {
                System.out.println("User Login Successful");
                request.setAttribute("loggedInUser", user.getUserFullname());
                model = new ModelAndView();
                model.setViewName("index") ;
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
    
}
