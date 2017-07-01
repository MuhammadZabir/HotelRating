<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="com.hotelrating.util.UserLocationEnum" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
              
        <title>Add Hotel</title>
    </head>
    <body>
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
        <%
            String fileMessage = (String) request.getAttribute("fileMessage") ;
            String hotelMessage = (String) request.getAttribute("hotelMessage") ;
            if (hotelMessage != null)
            {        
        %>
                <div class="alert alert-warning">
                    <strong><%= hotelMessage %></strong>
                </div>
        <%
            }
        %>
        <form:form action = "/HotelRating/hotel" method = "post" enctype="multipart/form-data" modelAttribute = "hotel">
            <div class="col-md-3"></div>
            <div class="container col-md-6" align="center">
                <div class="panel panel-success">

                    <div class="panel-heading text-center"><h3>ADD HOTEL</h3></div>
                    <div class="panel-body">
                        <form:input path = "hotelName" size="50" placeholder="Hotel Name"/>
                    </div>
                    <div class="panel-body">
                        <form:input path = "hotelOwner" size="50" placeholder="Hotel Owner"/>
                    </div>
                    <div class="panel-body">
                        <form:select path = "hotelLocation" width ="100">
                            <form:option value = "">______________________Hotel Location:-_______________________</form:option>
                                <form:option value = "<%=UserLocationEnum.JOHOR.getValue()%>">Johor</form:option>
                                <form:option value = "<%=UserLocationEnum.MELAKA.getValue()%>">Melaka</form:option>
                                <form:option value = "<%=UserLocationEnum.NEGERI_SEMBILAN.getValue()%>">Negeri Sembilan</form:option>
                                <form:option value = "<%=UserLocationEnum.SELANGOR.getValue()%>">Selangor</form:option>
                                <form:option value = "<%=UserLocationEnum.KUALA_LUMPUR.getValue()%>">Kuala Lumpur</form:option>
                                <form:option value = "<%=UserLocationEnum.PERAK.getValue()%>">Perak</form:option>
                                <form:option value = "<%=UserLocationEnum.KEDAH.getValue()%>">Kedah</form:option>
                                <form:option value = "<%=UserLocationEnum.PULAU_PINANG.getValue()%>">Pulau Pinang</form:option>
                                <form:option value = "<%=UserLocationEnum.PERLIS.getValue()%>">Perlis</form:option>
                                <form:option value = "<%=UserLocationEnum.TERENGGANU.getValue()%>">Terengganu</form:option>
                                <form:option value = "<%=UserLocationEnum.KELANTAN.getValue()%>">Kelantan</form:option>
                                <form:option value = "<%=UserLocationEnum.SABAH.getValue()%>">Sabah</form:option>
                                <form:option value = "<%=UserLocationEnum.SARAWAK.getValue()%>">Sarawak</form:option>
                                <form:option value = "<%=UserLocationEnum.LABUAN.getValue()%>">Labuan</form:option>
                        </form:select>
                    </div>
                    
                    <div class="panel-body">
                        <form:select path = "hotelStar">
                            <form:option value = "0">Hotel Star</form:option>
                            <form:option value = "1">1</form:option>
                            <form:option value = "2">2</form:option>
                            <form:option value = "3">3</form:option>
                            <form:option value = "4">4</form:option>
                            <form:option value = "5">5</form:option>
                        </form:select>
                    </div>

                    <div class="panel-body">
                        <form:textarea path = "hotelDescription" rows="2" cols="40" placeholder="Description"/>
                    </div>

                    <div class="panel-body">Hotel Logo:
                        <input type="file" name="file" value="" size="50" accept='image/*' placeholder="Hotel Logo"/>
                    </div>

                    <div class="panel-body">Hotel Gallery:
                        <input type="file" name="imageHotel" value="" accept='image/*' size="50" multiple/>
                        <%
                            if (fileMessage != null)
                            {
                        %>
                                <div class="alert alert-warning">
                                    <strong><%= fileMessage %></strong>
                                </div>
                        <%       
                            }
                        %>
                    </div>

                    <div class="panel-body">
                        <input type="submit" class = "btn" value="Submit" name="submit" />
                        <input type="reset" class = "btn" value="Reset" name="reset" /> 
                    </div>
                </div>
            </div>
        </form:form>
    </body>
</html>
