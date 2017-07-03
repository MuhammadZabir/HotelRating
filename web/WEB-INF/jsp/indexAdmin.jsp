<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.hotelrating.model.CountLocation"%>
<%@page import = "java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <div class="col-md-1"></div>
            <center class="container-fluid panel panel-danger col-md-10">
                        <div class="container-fluid vertical rounded">
                            <h2><br>Customers Statistic</h2>
                            <c:forEach items = "${objects}" var = "object">
                                <div class="progress-bar">
                                    <div class="progress-track">
                                      <div class="progress-fill">
                                        <span><fmt:formatNumber type="number" maxFractionDigits="2" value = "${(object.locationCount / total) * 100}"/>%</span><br/> 
                                      </div>
                                    </div>
                                        <span style = "color:gray">${object.locationName} <br/>(<fmt:formatNumber type="number" maxFractionDigits="2" value = "${(object.locationCount / total) * 100}"/> %)</span>
                                  </div>
                            </c:forEach>
                            <div class="col-md-10"><br></div>
                        </div>  
            </center>
        </div>
    </body>
</html>
<link rel="stylesheet" href="/HotelRating/css/chart.css" type="text/css">
<script src="/HotelRating/js/chart.js"></script>
