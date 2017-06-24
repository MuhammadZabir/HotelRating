/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotelrating.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author user
 */
@Entity
@Table(name = "hotel")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Hotel.findAll", query = "SELECT h FROM Hotel h"),
    @NamedQuery(name = "Hotel.findByHotelId", query = "SELECT h FROM Hotel h WHERE h.hotelId = :hotelId"),
    @NamedQuery(name = "Hotel.findByHotelName", query = "SELECT h FROM Hotel h WHERE h.hotelName = :hotelName"),
    @NamedQuery(name = "Hotel.findByHotelOwner", query = "SELECT h FROM Hotel h WHERE h.hotelOwner = :hotelOwner"),
    @NamedQuery(name = "Hotel.findByHotelLocation", query = "SELECT h FROM Hotel h WHERE h.hotelLocation = :hotelLocation")})
public class Hotel implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "hotel_id")
    private Long hotelId;
    @Size(max = 200)
    @Column(name = "hotel_name", unique = true)
    private String hotelName;
    @Size(max = 200)
    @Column(name = "hotel_owner")
    private String hotelOwner;
    @Size(max = 200)
    @Column(name = "hotel_location")
    private String hotelLocation;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "hotel_description")
    private String hotelDescription;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "hotel_main_image")
    private String hotelMainImage;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "imageHotel")
    private Collection<HotelImage> hotelImageCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ratingHotel")
    private Collection<Rating> ratingCollection;

    public Hotel() {
    }

    public Hotel(Long hotelId) {
        this.hotelId = hotelId;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelOwner() {
        return hotelOwner;
    }

    public void setHotelOwner(String hotelOwner) {
        this.hotelOwner = hotelOwner;
    }

    public String getHotelLocation() {
        return hotelLocation;
    }

    public void setHotelLocation(String hotelLocation) {
        this.hotelLocation = hotelLocation;
    }

    public String getHotelDescription() {
        return hotelDescription;
    }

    public void setHotelDescription(String hotelDescription) {
        this.hotelDescription = hotelDescription;
    }

    public String getHotelMainImage() {
        return hotelMainImage;
    }

    public void setHotelMainImage(String hotelMainImage) {
        this.hotelMainImage = hotelMainImage;
    }

    @XmlTransient
    public Collection<HotelImage> getHotelImageCollection() {
        return hotelImageCollection;
    }

    public void setHotelImageCollection(Collection<HotelImage> hotelImageCollection) {
        this.hotelImageCollection = hotelImageCollection;
    }

    @XmlTransient
    public Collection<Rating> getRatingCollection() {
        return ratingCollection;
    }

    public void setRatingCollection(Collection<Rating> ratingCollection) {
        this.ratingCollection = ratingCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (hotelId != null ? hotelId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hotel)) {
            return false;
        }
        Hotel other = (Hotel) object;
        if ((this.hotelId == null && other.hotelId != null) || (this.hotelId != null && !this.hotelId.equals(other.hotelId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hotelrating.model.Hotel[ hotelId=" + hotelId + " ]";
    }
    
}
