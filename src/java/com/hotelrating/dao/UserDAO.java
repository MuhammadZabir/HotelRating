/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.User;
import java.util.List;

/**
 *
 * @author user
 */
public interface UserDAO 
{
    public void addUser(User user) ;
    public void updateUser(User user) ;
    public List<User> listUsers() ;
    public User getUserById(long id) ;
    public void deleteUser(long id) ;
}
