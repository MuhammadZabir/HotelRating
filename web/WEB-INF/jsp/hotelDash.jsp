<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.hotelrating.model.CountLocation"%>
<%@page import = "java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.hotelrating.util.UserLocationEnum" %>
<%@ page import="com.hotelrating.model.Hotel" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>  
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
                    <li><a href="/HotelRating/"><h3>DASHBOARD</h3></a></li>
                    <li><a href="/HotelRating/hotelList/1"><h3>LIST HOTEL</h3></a></li>
                    <li><a href="/HotelRating/hotel"><h3>ADD HOTEL</h3></a></li>
                    <li><a href="/HotelRating/logout"><h3>LOG OUT</h3></a></li>
                </ul>
            </div>
            
        </nav>
       
                    </ul>
                </div>
        </nav>
        
        
        <form:form action="/HotelRating/rating/add" method = "post" modelAttribute="rating">
            <form:hidden path = "ratingId"/>
            
              
                                    <table class="table table-striped table-hover">
                                        <thead class = "thead-inverse">
                                            <tr class="info">
                                                <th></th>
                                                <th>Hotel Name</th>
                                                <th>Hotel Owner</th>
                                                <th>Hotel Location</th>
                                                <th>Hotel Star</th>
                                                <th>Hotel Description</th>
                                                <th>Hotel Rating</th>
                                              
                                            </tr>
                                        </thead>

             <tbody>
                                            
                                                <tr bgcolor="#ffffff">
                                                    <%
                                                     
                                                        if (hotel.getHotelMainImage() != null)
                                                        {
                                                    %>
                                                            <td>
                                                                <img src="<c:url value='${hotel.hotelMainImage}'/>" class = "img-thumbnail img-responsive" width = "200"/>
                                                            </td>
                                                    <%
                                                        }
                                                        else
                                                        {
                                                    %>
                                                            <td><span>No Display</span></td>
                                                    <%
                                                        }
                                                    %>
                                                    <td>${hotel.hotelName}</td>
                                                    <td>${hotel.hotelOwner}</td>
                                                    <%
                                                        for (UserLocationEnum userLocation : UserLocationEnum.values())
                                                        {
                                                            if (hotel.getHotelLocation().equals(String.valueOf(userLocation.getValue())))
                                                            {
                                                    %>
                                                                <td><%=userLocation.getName()%></td>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                    <td>${hotel.hotelStar}</td>
                                                    <td>${hotel.hotelDescription}</td>
                                                    <td>${hotel.hotelRatingOverall}</td>
                                                  
                                                </tr>
                                            
                                        </tbody>
    </table>
                                                    
            <div class="jumbotron">
                <div class="container-fluid">

                    <table table-bordered >
                        <tr>
                            <td> <h2>Reviews</h2></td>
                            <td> <h2>User Type</h2></td>
                        </tr>
                        <tr>
                            <c:forEach items = "${ratingCount}" var = "count">
                                <input id = "${count.locationName}" type = "hidden" value = "${count.locationCount}"/>
                            </c:forEach>
                            <c:forEach items = "${ratingType}" var = "type">
                                <input id ="${type.locationName}" type = "hidden" value = "${type.locationCount}"/>
                            </c:forEach>
                            <td><div class="col-md-4"><div id="chart"></div></div></td>
                            <td class="col-md-4"><canvas id="pie" width="650" height="350"></canvas></td>
                        </tr>


                    </table>


                </div>
            </div>
    </body>
</html>
<link rel="stylesheet" href="/HotelRating/css/chart.css" type="text/css">
<script src="/HotelRating/js/pie.js"></script>
