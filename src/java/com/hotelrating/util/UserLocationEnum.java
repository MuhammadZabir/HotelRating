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
public enum UserLocationEnum 
{
    JOHOR(1), MELAKA(2), NEGERI_SEMBILAN(3), SELANGOR(4), KUALA_LUMPUR(5), PERAK(6),
    KEDAH(7), PULAU_PINANG(8), PERLIS(9), TERENGGANU(10), KELANTAN(11), SABAH(12),
    SARAWAK(13), LABUAN(14) ;
    
    private final int value ;
    
    private UserLocationEnum(int value)
    {
        this.value = value ;
    }
    
    public int getValue()
    {
        return this.value ;
    }
}
