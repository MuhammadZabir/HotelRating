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
        <div class="container-fluid">
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
                <div class="container col-md-6">
                    <div class="panel panel-primary">

                        <div class="panel-heading">ADD A NEW HOTEL</div>
                        <div class="panel-body">
                            <label class="col-md-3">Hotel Name</label>
                            <div class="col-md-9"><form:input path = "hotelName" size="50" placeholder="Hotel Name" class="form-control"/></div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Owner Name</label>
                            <div class="col-md-9"><form:input path = "hotelOwner" size="50" placeholder="Hotel Owner" class="form-control"/></div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Hotel Location</label>
                            <div class="col-md-9">
                                <form:select path = "hotelLocation" width ="100" class="form-control">
                                    <form:option value = "">Select:-</form:option>
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
                        </div>

                        <div class="panel-body">
                            <label class="col-md-3">Hotel Star</label>
                            <div class="col-md-9">
                                <form:select path = "hotelStar" class="form-control">
                                    <form:option value = "0">Select:-</form:option>
                                    <form:option value = "1">1 - Worst</form:option>
                                    <form:option value = "2">2 - Bad</form:option>
                                    <form:option value = "3">3 - Average</form:option>
                                    <form:option value = "4">4 - Good</form:option>
                                    <form:option value = "5">5 - Best</form:option>
                                </form:select>
                            </div>
                        </div>

                        <div class="panel-body">
                            <label class="col-md-3">Description</label>
                            <div class="col-md-9">
                                <form:textarea path = "hotelDescription" rows="2" cols="40" placeholder="Description" class="form-control"/>                       
                            </div>
                        </div>

                        <div class="panel-body">
                            <label class="col-md-3">Hotel Logo:</label>
                            <div class="col-md-9">
                                <input type="file" name="file" value="" size="50" accept='image/*' placeholder="Hotel Logo"/>
                            </div>
                        </div>

                        <div class="panel-body">
                            <label class="col-md-3">Hotel Gallery:</label>
                            <div class="col-md-9">
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
                        </div>

                        <div class="panel-body text-right">
                            <input type="submit" class = "btn btn-success" value="Submit" name="submit" />
                            <input type="reset" class = "btn" value="Reset" name="reset" /> 
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>
