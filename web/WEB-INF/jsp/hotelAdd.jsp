<%-- 
    Document   : hotelAdd
    Created on : Jun 4, 2017, 9:19:19 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
              
        <title>Add Hotel</title>
    </head>
    <body>
    <center>
        <br>
        <br>
        <h1>Add Hotel</h1>
        <br>
        Hotel Name:
        <input type="text" name="hotel_name" value="" size="50" /><br><br>
            
        Hotel Owner:
        <input type="text" name="hotel_owner" value="" size="50" /><br><br>
        
       Hotel Location:
        <select name="hotel_location" width ="50">
            <option>-----------------------------------------------------------</option>
            <option value="Johor" >Johor</option>
            <option value="Melaka">Melaka</option>
            <option value="Negeri Sembila">Negeri Sembilan</option>
            <option value="Selangor">Selangor</option>
            <option value="Kuala Lumpur">Kuala Lumpur</option>
            <option value="Perak">Perak</option>
            <option value="Kedah">Kedah</option>
            <option value="Pulau Pinang">Pulau Pinang</option>
            <option value="Perlis">Perlis</option>
            <option value="Terengganu">Terengganu</option>
            <option value="Kelantan">Kelantan</option>
            <option value="Sabah">Sabah</option>
            <option value="Sarawak">Sarawak</option>
            <option value="Labuan">Labuan</option>
        </select>
       <br><br>
       
       Description
        <textarea name="hotel_discription" rows="1" cols="40"></textarea><br><br>


        Hotel Logo:
        <input type="file" name="hotel_main_image" value="" size="50"/><br><br>
        
        Hotel Gallery:
        <input type="file" name="image_hotel" value="" size="50"/><br><br>
        
        Hotel URL:
        <input type="text" name="image_url" value="" size="50" /><br>
        
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <input type="submit" value="Submit" name="submit" />
        <input type="reset" value="Reset" name="reset" />

        </center>
    </body>
</html>
