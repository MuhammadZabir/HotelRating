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
    JOHOR(1, "Johor"), MELAKA(2, "Melaka"), NEGERI_SEMBILAN(3, "Negeri Sembilan"),
    SELANGOR(4, "Selangor"), KUALA_LUMPUR(5, "Kuala Lumpur"), PERAK(6, "Perak"),
    KEDAH(7, "Kedah"), PULAU_PINANG(8, "Pulau Pinang"), PERLIS(9, "Perlis"), TERENGGANU(10, "Terengganu"),
    KELANTAN(11, "Kelantan"), SABAH(12, "Sabah"), SARAWAK(13, "Sarawak"), LABUAN(14, "Labuan") ;
    
    private final int value ;
    private final String name ;
    
    private UserLocationEnum(int value, String name)
    {
        this.value = value ;
        this.name = name ;
    }
    
    public int getValue()
    {
        return this.value ;
    }
    
    public String getName()
    {
        return this.name ;
    }
}
