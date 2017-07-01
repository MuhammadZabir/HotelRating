/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.User;
import com.hotelrating.service.UserService;
import com.hotelrating.util.UserRoleEnum;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.exception.ConstraintViolationException;
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
public class UserController 
{
    private UserService userService ;
    
    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService)
    {
        this.userService = userService ;
    }
    
    @RequestMapping(value = "/register")
    public ModelAndView toRegister()
    {
        ModelAndView model = new ModelAndView() ;
        model.addObject("user", new User()) ;
        model.setViewName("addUser") ;
        return model ;
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(HttpSession session, HttpServletRequest request, @ModelAttribute("user")User user)
    {
        ModelAndView model = new ModelAndView() ;
        if (!user.getUserPassword().equals((String) request.getParameter("confirmPassword")))
        {
            request.setAttribute("messagePass", "The Password is not matched") ;
            model.setViewName("addUser") ;
            return model ;
        }
        user.setUserRole(UserRoleEnum.User.getValue()) ;
        try
        {
            user = this.userService.addUser(user) ;
            session.setAttribute("loggedInUser", user) ;
            model.setViewName("redirect:/index/1") ;
            return model ;
        }
        catch (ConstraintViolationException e)
        {
            request.setAttribute("messageUser", "The username has been taken") ;
            model.setViewName("addUser") ;
            return model;
        }
    }
    
    private boolean validateSession(HttpSession session)
    {
        User user = (User) session.getAttribute("loggedInUser") ;
        return user != null ;
    }
}
