/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.util;

/**
 *
 * @author user
 */
public enum UserTypeEnum 
{
    Traveler(1), FAMILY(2), BUSINESS(3) ;
    
    private final int value ;
    
    private UserTypeEnum(int value)
    {
        this.value = value ;
    }
    
    public int getValue()
    {
        return this.value ;
    }
}
