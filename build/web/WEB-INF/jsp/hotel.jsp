<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Hotel Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
    <h1>
	Add a Person
    </h1>

    <c:url var="addAction" value="/hotel/add" ></c:url>

    <form:form action="${addAction}" modelAttribute="hotel">
    <table>
            <c:if test="${!empty hotel.hotelName}">
            <tr>
                    <td>
                            <form:label path="hotelId">
                                    <spring:message text="ID"/>
                            </form:label>
                    </td>
                    <td>
                            <form:input path="hotelId" readonly="true" size="8"  disabled="true" />
                            <form:hidden path="hotelId" />
                    </td> 
            </tr>
            </c:if>
            <tr>
                    <td>
                            <form:label path="hotelName">
                                    <spring:message text="Name"/>
                            </form:label>
                    </td>
                    <td>
                            <form:input path="hotelName" />
                    </td> 
            </tr>
            <tr>
                    <td colspan="2">
                            <c:if test="${!empty hotel.hotelName}">
                                    <input type="submit"
                                            value="<spring:message text="Edit hotel"/>" />
                            </c:if>
                            <c:if test="${empty hotel.hotelName}">
                                    <input type="submit"
                                            value="<spring:message text="Add hotel"/>" />
                            </c:if>
                    </td>
            </tr>
    </table>	
    </form:form>
    <br>
    <h3>Hotels List</h3>
    <c:if test="${!empty listHotels}">
            <table class="tg">
            <tr>
                    <th width="80">Hotel ID</th>
                    <th width="120">Hotel Name</th>
                    <th width="60">Edit</th>
                    <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listHotels}" var="hotel">
                    <tr>
                            <td>${hotel.hotelId}</td>
                            <td>${hotel.hotelName}</td>
                            <td><a href="<c:url value='/edit/${hotel.hotelId}' />" >Edit</a></td>
                            <td><a href="<c:url value='/remove/${hotel.hotelId}' />" >Delete</a></td>
                    </tr>
            </c:forEach>
            </table>
    </c:if>
</body>
</html>
