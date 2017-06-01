/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.dao;

import com.hotelrating.model.User;
import java.math.BigInteger;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author user
 */
@Repository
public class UserDAOImpl implements UserDAO 
{
    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class) ;
    
    @Autowired
    private SessionFactory sessionFactory ;
    
    public void setSessionFactory(SessionFactory sf)
    {
        this.sessionFactory = sf ;
    }
    
    @Override
    public void addUser(User user)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.persist(user) ;
        logger.debug("Add User = {}", user) ;
    }
    
    @Override
    public void updateUser(User user)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        session.update(user) ;
        logger.debug("Update User = {}", user) ;
    }
    
    @Override
    public List<User> listUsers()
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get list of Users") ;
        return session.createSQLQuery("SELECT * FROM user").list() ;
    }
    
    @Override
    public User getUserById(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        logger.debug("Get User By ID = {}", id) ;
        return (User) session.load(User.class, id) ;
    }
    
    @Override
    public void deleteUser(long id)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        User user = (User) session.load(User.class, id) ;
        if (user.getUserId() != null)
        {
            session.delete(user) ;
        }
        logger.debug("User Deleted = {}", user) ;
    }
    
    @Override
    public boolean isValidUser(String user_name, String user_password)
    {
        Session session = this.sessionFactory.getCurrentSession() ;
        
        Query query = session.createSQLQuery("SELECT COUNT(1) FROM user where user_name = :user_name AND user_password = :user_password")
                .setParameter("user_name", user_name).setParameter("user_password", user_password) ;
        List<BigInteger> results = query.list() ;
        
        return results.get(0).intValue() > 0 ;
    }

    
}
