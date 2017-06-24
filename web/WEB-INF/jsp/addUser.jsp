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
        <nav class="navbar navbar-default">

        </nav>
        <form:form action = "/HotelRating/register" method = "post" modelAttribute = "user">
            <div class="col-md-3"></div>
            <div class="container col-md-6" align="center">
                <div class="panel panel-success">
                    <div class="panel-heading text-center"><h3>ADD USER</h3></div>
                    <div class="panel-body">
                        <form:input path = "userName" size="50" placeholder="USER NAME"/>
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
                    <div class="panel-body">
                        <form:password path = "userPassword" size="50" placeholder="PASSWORD"/>
                    </div>
                    <div class="panel-body">
                        <input type="password" name="confirmPassword" size="50" placeholder="CONFIRMATION PASSWORD"/>
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
                    <div class="panel-body">
                        <form:select path = "userType">
                            <form:option value = "">_______________________USER TYPE:-_________________________</form:option>
                            <form:option value = "<%=UserTypeEnum.Traveler.getValue()%>" >Traveler</form:option>
                            <form:option value = "<%=UserTypeEnum.FAMILY.getValue()%>">Family</form:option>
                            <form:option value = "<%=UserTypeEnum.BUSINESS.getValue()%>">Business</form:option>
                        </form:select>
                    </div>
                    <div class="panel-body">
                        <form:input path = "userFullname" size="50" placeholder="FULL NAME"/>
                    </div>
                    <div class="panel-body">
                        <form:input onkeypress = "return event.charCode >= 48 && event.charCode <= 57" path = "userAge" size="50" placeholder="AGE"/>
                    </div>
                    <div class="panel-body">
                        <form:select path = "userLocation">
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
                    <button type="submit" class="btn">Submit</button>
                    <input type="reset" class="btn" value="Reset" name="reset" />
                </div>
            </div>
        </form:form>
    </body>
</html>
