<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="com.hotelrating.util.UserTypeEnum" %>
<%@ page import="com.hotelrating.util.UserLocationEnum" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
        <title>Add User</title>
    </head>
    <body>
        <% 
                String messagePass = (String)request.getAttribute("messagePass") ;
                String messageUser = (String)request.getAttribute("messageUser") ;
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
                        <li><a href="/HotelRating/">BACK</a></li>
                    </ul>
                </div>
            </nav>
            <form:form action = "/HotelRating/register" method = "post" modelAttribute = "user">
                <div class="col-md-3"></div>
                <div class="container col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading text-center">SIGN UP / ADD USER</div>
                        <div class="panel-body">
                            <label class="col-md-3">User Name</label>
                                <div class="col-md-9">
                                    <form:input path = "userName" size="50" placeholder="USER NAME" class="form-control"/>
                                    <%
                                        if (messageUser != null)
                                        {
                                    %>
                                            <div class="alert alert-warning">
                                                <strong><%= messageUser %></strong>
                                            </div>
                                    <%
                                        }
                                    %>
                                </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Password</label>
                            <div class="col-md-9">
                                <form:password path = "userPassword" size="50" placeholder="PASSWORD" class="form-control"/>
                            </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Confirmation Password</label>
                            <div class="col-md-9">
                                <input type="password" name="confirmPassword" size="50" placeholder="CONFIRMATION PASSWORD" class="form-control"/>
                                <%
                                    if (messagePass != null)
                                    {
                                %>
                                        <div class="alert alert-warning">
                                            <strong><%= messagePass %></strong>
                                        </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">User Type</label>
                            <div class="col-md-9">
                                <form:select path = "userType" class="form-control">
                                    <form:option value = "">Select:-</form:option>
                                    <form:option value = "<%=UserTypeEnum.Traveler.getValue()%>" >Traveler</form:option>
                                    <form:option value = "<%=UserTypeEnum.FAMILY.getValue()%>">Family</form:option>
                                    <form:option value = "<%=UserTypeEnum.BUSINESS.getValue()%>">Business</form:option>
                                </form:select>
                            </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Full Name</label>
                            <div class="col-md-9">
                                <form:input path = "userFullname" size="50" placeholder="FULL NAME" class="form-control"/>
                            </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Age</label>
                            <div class="col-md-9">
                                <form:input onkeypress = "return event.charCode >= 48 && event.charCode <= 57" path = "userAge" size="50" placeholder="AGE" class="form-control"/>
                            </div>
                        </div>
                        <div class="panel-body">
                            <label class="col-md-3">Location</label>
                            <div class="col-md-9">
                                <form:select path = "userLocation" class="form-control">
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
                        <div class="panel-body text-right">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <input type="reset" class="btn" value="Reset" name="reset" /><br>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>
