/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.service;

import com.hotelrating.dao.UserDAO;
import com.hotelrating.model.User;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
@Service
public class UserServiceImpl implements UserService
{
    private UserDAO userDAO ;
    
    public void setUserDAO(UserDAO userDAO)
    {
        this.userDAO = userDAO ;
    }
    
    @Override
    @Transactional
    public void addUser(User user)
    {
        this.userDAO.addUser(user) ;
    }
    
    @Override
    @Transactional
    public void updateUser(User user)
    {
        this.userDAO.updateUser(user) ;
    }
    
    @Override
    @Transactional
    public List<User> listUsers()
    {
        return this.userDAO.listUsers() ;
    }
    
    @Override
    @Transactional
    public User getUserById(long id)
    {
        return this.userDAO.getUserById(id) ;
    }
    
    @Override
    @Transactional
    public void deleteUser(long id)
    {
        this.userDAO.deleteUser(id) ;
    }
    
    @Override
    @Transactional
    public boolean isValidUser(String user_name, String user_password)
    {
        return this.userDAO.isValidUser(user_name, user_password);
    }
    
    @Override
    @Transactional
    public User getUserByNameAndPassword(String user_name, String user_password)
    {
        return this.userDAO.getUserByNameAndPassword(user_name, user_password) ;
    }
}
