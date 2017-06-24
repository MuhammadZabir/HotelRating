<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="com.hotelrating.model.Hotel" %>
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
        <%
            Hotel hotel = (Hotel) request.getAttribute("hotel") ;
            request.getSession().setAttribute("hotel", hotel) ;
        %>
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
        <form:form action="/HotelRating/rating/add" method = "post" modelAttribute="rating">
            <div class = "container-fluid">
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
                                        
                                        <div class = "form-check form-check-inline">
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="1"/>1 star
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="2"/>2 star
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="3"/>3 star
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="4"/>4 star
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="5"/>5 star
                                            </label>
                                        </div>
                                    </div>
                                    <div class="panel-body">Rating comment:
                                        <br/>
                                        <br/>
                                        <form:textarea class="form-control" rows="3" path = "ratingComment" placeholder = "Please place your comment here" />
                                    </div>
                                    <div class="panel-body"><input class="btn btn-success" type="submit" value="Submit" name="submit" />
                                    </div>
                                </center>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </body>
</html>
