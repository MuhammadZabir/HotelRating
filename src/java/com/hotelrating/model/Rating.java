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
import javax.persistence.FetchType;
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
@Table(name = "rating")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Rating.findAll", query = "SELECT r FROM Rating r"),
    @NamedQuery(name = "Rating.findByRatingId", query = "SELECT r FROM Rating r WHERE r.ratingId = :ratingId"),
    @NamedQuery(name = "Rating.findByRatingRate", query = "SELECT r FROM Rating r WHERE r.ratingRate = :ratingRate")})
public class Rating implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "rating_id")
    private Long ratingId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rating_rate")
    private int ratingRate;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "rating_comment")
    private String ratingComment;
    @JoinColumn(name = "rating_hotel", referencedColumnName = "hotel_id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Hotel ratingHotel;
    @JoinColumn(name = "rating_user", referencedColumnName = "user_id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User ratingUser;

    public Rating() {
    }

    public Rating(Long ratingId) {
        this.ratingId = ratingId;
    }

    public Rating(Long ratingId, int ratingRate) {
        this.ratingId = ratingId;
        this.ratingRate = ratingRate;
    }

    public Long getRatingId() {
        return ratingId;
    }

    public void setRatingId(Long ratingId) {
        this.ratingId = ratingId;
    }

    public int getRatingRate() {
        return ratingRate;
    }

    public void setRatingRate(int ratingRate) {
        this.ratingRate = ratingRate;
    }

    public String getRatingComment() {
        return ratingComment;
    }

    public void setRatingComment(String ratingComment) {
        this.ratingComment = ratingComment;
    }

    public Hotel getRatingHotel() {
        return ratingHotel;
    }

    public void setRatingHotel(Hotel ratingHotel) {
        this.ratingHotel = ratingHotel;
    }

    public User getRatingUser() {
        return ratingUser;
    }

    public void setRatingUser(User ratingUser) {
        this.ratingUser = ratingUser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ratingId != null ? ratingId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Rating)) {
            return false;
        }
        Rating other = (Rating) object;
        if ((this.ratingId == null && other.ratingId != null) || (this.ratingId != null && !this.ratingId.equals(other.ratingId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hotelrating.model.Rating[ ratingId=" + ratingId + " ]";
    }
    
}
