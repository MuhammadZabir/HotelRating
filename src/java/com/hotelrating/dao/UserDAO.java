/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.User;
import java.sql.SQLException;
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
    public boolean isValidUser(String user_name, String user_password) ;
    public User getUserByNameAndPassword(String user_name, String user_password) ;
}
