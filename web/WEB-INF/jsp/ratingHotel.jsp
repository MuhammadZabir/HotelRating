<%-- 
    Document   : ratingHotel
    Created on : Jun 4, 2017, 10:50:55 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <title>Rating</title>
    </head>
    <body>
    <center>
        <h1>Rating</h1>
        <br>
        <br>
        <br>
        
        Rating rate:
        <input type="radio" name="rating_rate" value="1" />1 star
        <input type="radio" name="rating_rate" value="2" />2 star
        <input type="radio" name="rating_rate" value="3" />3 star
        <input type="radio" name="rating_rate" value="4" />4 star
        <input type="radio" name="rating_rate" value="5" />5 star
        <br><br>
        
        Rating comment:
        <input type="text" name="rating_comment" value="" />
        
        <br>
        <br><br>
        
        <input type="submit" value="Submit" name="submit" />
        <input type="reset" value="Reset" name="reset" />
        </center>
    </body>
</html>
