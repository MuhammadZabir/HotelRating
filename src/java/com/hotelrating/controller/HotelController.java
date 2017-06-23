/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Hotel;
import com.hotelrating.service.HotelService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author user
 */
@Controller
public class HotelController
{
    private HotelService hotelService ;
    
    @Autowired(required = true)
    @Qualifier(value = "hotelService")
    public void setHotelService(HotelService hotelService)
    {
        this.hotelService = hotelService ;
    }
    
    @RequestMapping(value = "/hotels")
    public String listHotels(HttpServletRequest request, HttpSession session, Model model)
    {
        model.addAttribute("listHotels", this.hotelService.listHotels()) ;
        return "hotel" ;
    }
    
    @RequestMapping(value = "/hotel/add", method = RequestMethod.POST)
    public String addOrUpdateHotel(@ModelAttribute("hotel") Hotel hotel)
    {
        if (hotel.getHotelId() == 0)
        {
            this.hotelService.addHotel(hotel) ;
        }
        else
        {
            this.hotelService.updateHotel(hotel) ;
        }
        return "redirect:/hotels" ;
    }
    
    @RequestMapping(value = "/hotel/remove/{id}")
    public String deleteHotel(@PathVariable long id)
    {
        this.hotelService.deleteHotel(id) ;
        return "redirect:/hotels" ;
    }
    
    @RequestMapping(value = "/hotel/edit/{id}")
    public String updateHotel(@PathVariable long id, Model model)
    {
        model.addAttribute("hotel", this.hotelService.getHotelById(id)) ;
        model.addAttribute("listHotels", this.hotelService.listHotels()) ;
        return "hotel" ;
    }
    
    /**
    * Upload multiple file using Spring Controller
    */
    @RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
    public @ResponseBody String uploadMultipleFileHandler(HttpServletRequest request, @RequestParam("name") String[] names,
            @RequestParam("file") MultipartFile[] files) {

        if (files.length != names.length)
                return "Mandatory information missing";

        String message = "";
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            String name = names[i];
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file
                ServletContext sc = request.getServletContext() ;
                String rootPath = sc.getRealPath("/something");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                        dir.mkdirs();

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                                + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                                new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                message = message + "You successfully uploaded file=" + name
                                + "";
            } catch (Exception e) {
                    return "You failed to upload " + name + " => " + e.getMessage();
            }
        }
        return message;
      }
}