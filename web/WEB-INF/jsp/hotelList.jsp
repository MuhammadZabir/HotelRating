<%@ page import="com.hotelrating.model.Hotel" %>
<%@ page import="com.hotelrating.util.UserLocationEnum" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
        <style>
            html,
            body,
            .fullImage{
                height: 100%;
            }
            
            .fullImage{
                background: url('http://www.mrwallpaper.com/wallpapers/airplane-flight-sunset-1920x1080.jpg') ;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>  
        <title>Welcome</title>
    </head>
    <body>
        <%
            int paging = (Integer) request.getAttribute("paging");
            String search = (String) request.getAttribute("search");
            int active = (Integer) request.getAttribute("active");
        %>
        <div class="fullImage">
            <div class="full-bg-img flex-center">
                <div class="container-fluid">
                    <div class = "row">
                        <div class = "col-md-12">
                           <!-- <nav class="navbar navbar-toggleable-md navbar-default bg-inverse">
                                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                        <li class="nav-item"><a class = "nav-link" href="#"><h3>HOME</h3></a></li>
                                        <li class="nav-item"><a class = "nav-link" href="#"><h3>LOGOUT</h3></a></li>
                                    </ul>
                            </nav>-->
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
                        </div>
                    </div>
                    <div class="hidden-xs hidden-md hidden-lg"><br></div>
                    <div class="row">
                        <div class = "col-md-2"></div>
                        <div class = "col-md-6"><input type="text" id = "searchValue" name="searchValue" value="" size="30" class="form-control"></div>
                        <div class = "col-md-2"><a onclick = "this.href='/HotelRating/search/' + document.getElementById('searchValue').value + '&1'" class = "btn btn-success">Search</a></div>
                        <div class = "col-md-2"></div>
                    </div>
                    <br/>
                    <br/>
                    <div class="hidden-xs hidden-md hidden-lg"><br></div>
                    <div class = "row">
                        <div class = "col-md-2"></div>
                        <div class = "col-md-8">
                            <c:if test = "${!empty hotels}">
                                <div class = "table-responsive pre-scrollable">
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
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${hotels}" var = "hotel">
                                                <tr bgcolor="#ffffff">
                                                    <%
                                                        Hotel hotel = (Hotel) pageContext.getAttribute("hotel") ;
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
                                                    <td><a class = "btn" href="/HotelRating/hotelDash/${hotel.hotelId}">Overall</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination pagination-sm">
                                    <%
                                        for (int x = 1 ; x <= paging ; x++)
                                        {
                                            if (search != null)
                                            {
                                                if (active == x)
                                                {
                                    %>
                                                    <li class="active"><a class = "nav-link active" href="/HotelRating/search/<%=search%>&<%=x%>"><%=x%></a></li>
                                    <%
                                                }
                                                else
                                                {
                                    %>
                                                    <li><a class = "nav-link" href="/HotelRating/search/<%=search%>&<%=x%>"><%=x%></a></li>
                                    <%
                                                }
                                            }
                                            else
                                            {
                                                if (active == x)
                                                {
                                    %>
                                                    <li class="active"><a class = "nav-link active" href="/HotelRating/hotelList/<%=x%>"><%=x%></a></li>
                                    <%
                                                }
                                                else
                                                {
                                    %>
                                                    <li><a class = "nav-link" href="/HotelRating/hotelList/<%=x%>"><%=x%></a></li>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </ul>
                            </c:if>
                        </div>
                        <div class = "col-md-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>