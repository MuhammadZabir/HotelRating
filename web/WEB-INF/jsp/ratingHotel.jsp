<%@ page import="com.hotelrating.util.UserLocationEnum" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="container-fluid">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav">
                            <li><a class="glyphicon glyphicon-send"></a></li>
                            <li><a class="navbar-brand"> ZubirTravels</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/HotelRating/">HOME</a></li>
                        <li><a href="/HotelRating/logout">LOGOUT</a></li>
                    </ul>
                </div>
            </nav>


            <form:form action="/HotelRating/rating/add" method = "post" modelAttribute="rating">
                <form:hidden path = "ratingId"/>
                <div class="col-md-2"></div>
                <div class="col-md-8">
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
                <br>
                <div class="col-md-2"></div>
                <div class="col-md-7">
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
                <br>
                <div class = "container-fluid">
                    <div class = "row">
                        <div class = "col-md-4">
                        </div>
                        <div class = "col-md-5">
                            <div class="panel panel-success">
                                <div class="panel-heading"><h4>Rate us!</h4></div>
                                <center>
                                    <div class="panel-body">Rating rate:
                                        <br/>
                                        <br/>

                                        <div class = "form-check form-check-inline">
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="1"/>1 - Worst
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="2"/>2 - Bad
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="3"/>3 - Average
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="4"/>4 - Good
                                            </label>
                                            <label class="form-check-label">
                                                <form:radiobutton class = "form-check-input" path = "ratingRate" value="5"/>5 - Best
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
        </div>
    </body>
</html>
