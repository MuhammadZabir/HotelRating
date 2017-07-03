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
        <div class="container-fluid bek">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/HotelRating/">DASHBOARD</a></li>
                        <li><a href="/HotelRating/hotelList/1">LIST HOTEL</a></li>
                        <li><a href="/HotelRating/hotel">ADD HOTEL</a></li>
                        <li><a href="/HotelRating/logout">LOG OUT</a></li>
                    </ul>
                </div>
            </nav>

            <div class="col-md-6">
                <div class="panel panel-primary text-center">
                    <div class="panel-heading text-center"><h4>${hotel.hotelName}</h4></div>
                    <div class="panel-body text-center">
                    <%

                        if (hotel.getHotelMainImage() != null)
                        {
                    %>
                            <p>
                                <img src="<c:url value='${hotel.hotelMainImage}'/>" class = "img-thumbnail img-responsive" width = "200"/>
                            </p>
                    <%
                        }
                        else
                        {
                    %>
                            <p><span>No Display</span></p>
                    <%
                        }
                    %>
                    <table>
                        <tr>
                            <c:if test = "${images != null}">
                                <c:forEach items = "${images}" var = "image">
                                    <td>
                                        <img src = "<c:url value = '${image}'/>" class = "img-thumbnail img-responsive" width = "200"/>
                                    </td>
                                </c:forEach>
                            </c:if>
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center"><h4>Hotel Details</h4></div>
                    <div class="panel-body">
                        <label class="col-md-4">Hotel Name</label>
                        <div class="col-md-8">${hotel.hotelName}</div>
                    </div>
                    <div class="panel-body">
                        <label class="col-md-4">Hotel Owner</label>
                        <div class="col-md-8">${hotel.hotelOwner}</div>
                    </div>
                    <div class="panel-body">
                        <label class="col-md-4">Hotel Location</label>
                        <%
                            for (UserLocationEnum userLocation : UserLocationEnum.values())
                            {
                                if (hotel.getHotelLocation().equals(String.valueOf(userLocation.getValue())))
                                {
                        %>
                                    <div class="col-md-8"><%=userLocation.getName()%></div>
                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="panel-body">
                        <label class="col-md-4">Hotel Star</label>
                        <div class="col-md-8">${hotel.hotelStar}</div>
                    </div>
                    <div class="panel-body">    
                        <label class="col-md-4">Hotel Description</label>
                        <div class="col-md-8">${hotel.hotelDescription}</div>
                    </div>
                    <div class="panel-body">    
                        <label class="col-md-4">Hotel Rating</label>
                        <div class="col-md-8">${hotel.hotelRatingOverall}</div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="panel col-md-12">
                    <table table-bordered >
                        <tr>
                            <td><br><h2>Reviews</h2></td>
                            <td><br><h2>User Type</h2></td>
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
        </div>
    </body>
</html>
<link rel="stylesheet" href="/HotelRating/css/chart.css" type="text/css">
<script src="/HotelRating/js/pie.js"></script>
