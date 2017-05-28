/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author user
 */
@Entity
@Table(name = "hotel_image")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HotelImage.findAll", query = "SELECT h FROM HotelImage h"),
    @NamedQuery(name = "HotelImage.findByImageId", query = "SELECT h FROM HotelImage h WHERE h.imageId = :imageId"),
    @NamedQuery(name = "HotelImage.findByImageName", query = "SELECT h FROM HotelImage h WHERE h.imageName = :imageName")})
public class HotelImage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "image_id")
    private Long imageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "image_name")
    private String imageName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "image_url")
    private String imageUrl;
    @JoinColumn(name = "image_hotel", referencedColumnName = "hotel_id")
    @ManyToOne(optional = false)
    private Hotel imageHotel;

    public HotelImage() {
    }

    public HotelImage(Long imageId) {
        this.imageId = imageId;
    }

    public HotelImage(Long imageId, String imageName, String imageUrl) {
        this.imageId = imageId;
        this.imageName = imageName;
        this.imageUrl = imageUrl;
    }

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Hotel getImageHotel() {
        return imageHotel;
    }

    public void setImageHotel(Hotel imageHotel) {
        this.imageHotel = imageHotel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imageId != null ? imageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HotelImage)) {
            return false;
        }
        HotelImage other = (HotelImage) object;
        if ((this.imageId == null && other.imageId != null) || (this.imageId != null && !this.imageId.equals(other.imageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hotelrating.model.HotelImage[ imageId=" + imageId + " ]";
    }
    
}
