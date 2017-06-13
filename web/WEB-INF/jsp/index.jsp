<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
    </head>
    <body>
        <div class="fullImage">
            <div class="full-bg-img flex-center">
                <div class="container-fluid">
                    <div class = "row">
                        <div class = "col-md-12">
                            <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse">
                                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                        <li class="nav-item"><a class = "nav-link" href="#"><h3>HOME</h3></a></li>
                                        <li class="nav-item"><a class = "nav-link" href="#"><h3>LOGOUT</h3></a></li>
                                    </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="hidden-xs hidden-md hidden-lg"><br></div>
                    <div class="row">
                        <div class = "col-md-2"></div>
                        <div class = "col-md-6"><input type="text" name="user_name" value="" size="30" class="form-control"></div>
                        <div class = "col-md-2"><input type="submit" value="Search" name="submit" class="btn btn-success"></div>
                        <div class = "col-md-2"></div>
                    </div>
                    <div class="hidden-xs hidden-md hidden-lg"><br></div>
                    <div class = "row">
                        <div class = "col-md-2"></div>
                        <div class = "col-md-8">
                            <c:if test = "${!empty hotels}">
                                <div class = "table-responsive">
                                    <table class="table table-striped">
                                        <thead class = "thead-inverse">
                                            <tr>
                                                <th>Hotel Name</th>
                                                <th>Hotel Owner</th>
                                                <th>Hotel Location</th>
                                                <th>Hotel Description</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items = "${hotels}" var = "hotel">
                                                <tr>
                                                    <td>${hotel.hotelName}</td>
                                                    <td>${hotel.hotelOwner}</td>
                                                    <td>${hotel.hotelLocation}</td>
                                                    <td>${hotel.hotelDescription}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                        <div class = "col-md-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>