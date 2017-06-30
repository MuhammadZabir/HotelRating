/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.controller;

import com.hotelrating.model.Hotel;
import com.hotelrating.model.HotelImage;
import com.hotelrating.service.HotelImageService;
import com.hotelrating.service.HotelService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.exception.ConstraintViolationException;
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
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author user
 */
@Controller
public class HotelController
{
    private HotelService hotelService ;
    private HotelImageService hotelImageService ;
    
    @Autowired(required = true)
    @Qualifier(value = "hotelService")
    public void setHotelService(HotelService hotelService)
    {
        this.hotelService = hotelService ;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "hotelImageService")
    public void setHotelImageService(HotelImageService hotelImageService)
    {
        this.hotelImageService = hotelImageService ;
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
    
    @RequestMapping(value = "/hotel")
    public ModelAndView hotel()
    {
        ModelAndView model = new ModelAndView() ;
        model.addObject("hotel", new Hotel()) ;
        model.setViewName("hotelAdd") ;
        return model ;
    }
    
    @RequestMapping(value = "/hotel", method = RequestMethod.POST)
    public ModelAndView hotelProcess(HttpServletRequest request, @ModelAttribute("hotel")Hotel hotel, 
            @RequestParam("file") MultipartFile file, @RequestParam("imageHotel") MultipartFile[] imageHotel)
    {
        ModelAndView model = new ModelAndView() ;
        try
        {
            List<HotelImage> hotelImages = new ArrayList<>() ;
            if (!file.isEmpty())
            {
                HotelImage hotelImage = new HotelImage() ;
                String extension = file.getOriginalFilename().split("\\.")[1] ;
                if (!(extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("jpeg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("bmp")))
                {
                    request.setAttribute("fileMessage", "File image not supported. JPG, JPEG, PNG, BMP only.") ;
                    model.setViewName("hotelAdd") ;
                    return model ;
                }
                byte[] bytes = file.getBytes() ;
                String rootPath = request.getServletContext().getRealPath("/") ;
                File dir = new File(rootPath + File.separator + "Images") ;
                if (!dir.exists())
                    dir.mkdirs() ;
                String name = hotel.getHotelName() + "_1." + extension;
                
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name) ;
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile)) ;
                stream.write(bytes) ;
                stream.close() ;
                hotelImage.setImageName(name) ;
                hotelImage.setImageUrl("/Images/" + name) ;
                hotel.setHotelMainImage("/Images/" + name) ;
                hotelImage.setImageHotel(hotel) ;
                hotelImages.add(hotelImage) ;
            }
            
            if (imageHotel.length > 0)
            {
                int count = 2 ;
                for (MultipartFile image : imageHotel)
                {
                    if (!image.isEmpty() && image != null)
                    {
                        byte[] bytes = image.getBytes() ;
                        String extension = image.getOriginalFilename().split("\\.")[1] ;
                        if (!(extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("jpeg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("bmp")))
                        {
                            request.setAttribute("fileMessage", "File image not supported. JPG, JPEG, PNG, BMP only.") ;
                            model.setViewName("hotelAdd") ;
                            return model ;
                        }
                        String rootPath = request.getServletContext().getRealPath("/") ;
                        File dir = new File(rootPath + File.separator + "Images") ;
                        if (!dir.exists())
                            dir.mkdirs() ;
                        String name = hotel.getHotelName() + "_" + count + "." + extension ;
                        File serverFile = new File(dir.getAbsolutePath() + File.separator + name) ;
                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile)) ;
                        stream.write(bytes) ;
                        stream.close() ;
                        count++ ;
                        HotelImage hotelImage = new HotelImage() ;
                        hotelImage.setImageName(name) ;
                        hotelImage.setImageUrl("/Images/" + name) ;
                        hotelImage.setImageHotel(hotel) ;
                        hotelImages.add(hotelImage) ;
                    }
                }
            }
            hotel = this.hotelService.addHotel(hotel) ;
            if (!hotelImages.isEmpty())
            {
                for (HotelImage hotelImage : hotelImages)
                {
                    this.hotelImageService.addHotelImage(hotelImage) ;
                }
            }
            model.setViewName("redirect:/rating/" + hotel.getHotelId()) ;
            return model ;
        }
        catch (IOException e)
        {
            request.setAttribute("fileMessage", "There is something wrong with image") ;
            model.setViewName("hotelAdd") ;
            return model ;
        }
        catch (ConstraintViolationException e)
        {
            request.setAttribute("hotelMessage", "The hotel already existed") ;
            model.setViewName("hotelAdd") ;
            e.printStackTrace() ;
            return model ;
        }
    }
   
    
    
}