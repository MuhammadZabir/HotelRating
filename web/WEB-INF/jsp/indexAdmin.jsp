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
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/"><h3>HOME</h3></a></li>
                    <li><a href="#"><h3>DASHBOARD</h3></a></li>
                    <li><a href="/HotelRating/hotel"><h3>ADD HOTEL</h3></a></li>
                    <li><a href="/HotelRating/logout"><h3>LOG OUT</h3></a></li>
                </ul>
            </div>
            
        </nav>
        <div class="jumbotron">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="container vertical rounded">
                    
                            <h2>Percentage Customers Per State</h2>
                            
                            <c:forEach items = "${objects}" var = "object">
                                <div class="progress-bar">
                                    <div class="progress-track">
                                      <span style = "color:red">${object.locationName}</span>
                                      <div class="progress-fill">
                                        <span><fmt:formatNumber type="number" maxFractionDigits="2" value = "${(object.locationCount / total) * 100}"/>%</span><br/> 
                                      </div>
                                    </div>
                                  </div>
                            </c:forEach> 
                        </div>
                    </div>
                </div>  
            </div>
        
        
            <div class="jumbotron">
                <div class="container-fluid">

                    <table table-bordered >
                        <tr>
                            <td> <h2>Reviews</h2></td>
                            <td> <h2>User Type</h2></td>
                            <td> <h2>Ranking</h2></td>
                        </tr>
                         <tr>
                             <td><div class="col-md-4"><div id="chart"></div></div></td>
                            <td class="col-md-4"><canvas id="pie" width="650" height="350"></canvas></td>
                            <td class="col-md-4"><h1>#30</h1></td> 
                        </tr>


                    </table>


                </div>
            </div>
    </body>
</html>
<link rel="stylesheet" href="/HotelRating/css/chart.css" type="text/css">
<script src="/HotelRating/js/chart.js"></script>
