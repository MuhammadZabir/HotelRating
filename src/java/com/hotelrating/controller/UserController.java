/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.User;
import com.hotelrating.service.UserService;
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
public class UserController 
{
    private UserService userService ;
    
    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService)
    {
        this.userService = userService ;
    }
    
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listHotels(Model model)
    {
        model.addAttribute("user", new User()) ;
        model.addAttribute("userlists", this.userService.listUsers()) ;
        return "user" ;
    }
    
    @RequestMapping(value = "/user/add", method = RequestMethod.GET)
    public String addOrUpdateUser(@ModelAttribute("user") User user)
    {
        if (user.getUserId() != 0)
        {
            this.userService.addUser(user) ;
        }
        
        else
        {
            this.userService.updateUser(user) ;
        }
        
        return "redirect:/users" ;
    }
    
    @RequestMapping(value = "/user/remove/{id}")
    public String deleteUser(@PathVariable long id)
    {
        this.userService.deleteUser(id) ;
        return "redirect:/users" ;
    }
    
    @RequestMapping(value = "/user/edit/{id}")
    public String updateUser(@PathVariable long id, Model model)
    {
        model.addAttribute("user", this.userService.getUserById(id)) ;
        model.addAttribute("userlists", this.userService.listUsers()) ;
        
        return "user" ;
    }
}
