package com.hotelrating.util;

public enum UserRoleEnum 
{
    ADMIN(1), User(2);
    
    private final int value ;
    
    private UserRoleEnum(int value)
    {
        this.value = value ;
    }
    
    public int getValue()
    {
        return this.value ;
    }
}
