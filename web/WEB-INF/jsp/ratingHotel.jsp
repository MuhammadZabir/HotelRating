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
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
        <title>Rating</title>
    </head>
    <body>
        <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><h3>HOME</h3></a></li>
                        <li><a href="#"><h3>LOGOUT</h3></a></li>
                    </ul>
                </div>
        </nav>
        <div class = "row">
            <div class = "col-md-4">
            </div>
            <div class = "col-md-4">
                <div class="panel panel-success">
                   <div class="panel-heading text-center"><h3>Rating</h3></div>
                        <center>
                            <div class="panel-body">Rating rate:
                                <br/>
                                <br/>
                                <input type="radio" name="rating_rate" value="1" />1 star
                                <input type="radio" name="rating_rate" value="2" />2 star
                                <input type="radio" name="rating_rate" value="3" />3 star
                                <input type="radio" name="rating_rate" value="4" />4 star
                                <input type="radio" name="rating_rate" value="5" />5 star
                            </div>
                            <div class="panel-body">Rating comment:
                                <br/>
                                <br/>
                                <textarea  class="form-control" rows="3" type="text" name="rating_comment" value="" /></textarea>
                            </div>
                            <div class="panel-body"><input class="btn btn-success" type="submit" value="Submit" name="submit" />
                            </div>
                        </center>
                </div>
            </div>
    </body>
</html>
