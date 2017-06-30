/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.model;

/**
 *
 * @author user
 */
public class CountLocation 
{
    private String locationName ;
    private int locationCount ;
    
    public CountLocation(String locationName, int locationCount)
    {
        this.locationName = locationName ;
        this.locationCount = locationCount ;
    }
    
    public String getLocationName()
    {
        return locationName ;
    }
    
    public void setLocationName(String locationName)
    {
        this.locationName = locationName ;
    }
    
    public int getLocationCount()
    {
        return locationCount ;
    }
    
    public void setLocationCount(int locationCount)
    {
        this.locationCount = locationCount ;
    }
    
}
