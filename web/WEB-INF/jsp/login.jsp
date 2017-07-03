<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <form:form action = "/HotelRating/login" method = "post" modelAttribute = "user">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                        </div>
                        <ul class="nav navbar-nav">
                            <li><a class="glyphicon glyphicon-send"></a></li>
                            <li><a class="navbar-brand"> ZubirTravels</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/HotelRating/register">SIGN UP</a></li>
                        </ul>
                    </div>
                </nav>
                <% 
                    String message = (String)request.getAttribute("message"); 
                    if (message != null)
                    {
                %>
                        <div class="alert alert-warning">
                            <strong><%= message %></strong>
                        </div>
                <%
                    }
                %>
                <div class = "row">
                    <div class = "col-md-1"></div>
                    <div class = "col-md-5"><br><br><br><br><br><br>
                        <h1>Great Location, Service and Stay.</h1>
                    </div>
                    <div class = "col-md-1"></div>
                    <div class = "col-md-4">
                        <br><br>

                        <div class="panel panel-success">
                            <div class="panel-heading">LOG IN</div>
                            <div class="panel-body">
                                <form:input path = "userName" type="text" class="form-control" id="user_email" placeholder="Email Address"/>                
                                <br><form:input path = "userPassword" type="password" class="form-control" id="user_password" placeholder="Password"/>
                                <br><a href="#">Forgot Password</a>
                            </div>
                            <div class="panel-body text-right"><input type="checkbox" value="" disabled>Remember me? | <button type="submit" class="btn btn-success">Log In</button></div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </body>
</html>
