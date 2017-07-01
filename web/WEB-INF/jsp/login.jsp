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
        <form:form action = "/HotelRating/login" method = "post" modelAttribute = "user">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li><a href="/HotelRating/register"><h3>SIGN UP</h3></a></li>
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
                <div class = "col-md-4">
                </div>
                <div class = "col-md-4">
                    <div class="panel panel-success">
                       <div class="panel-heading text-center"><h3>LOG IN</h3></div>
                       <div class="panel-body"><form:input path = "userName" type="text" class="form-control" id="user_email" placeholder="Email Address"/></div>
                       <div class="panel-body text-right"><a href="#">Forgot Password</a></div>
                       <div class="panel-body"><form:input path = "userPassword" type="password" class="form-control" id="user_password" placeholder="Password"/></div>
                       <div class="panel-body"><input type="checkbox" value="" disabled>Remember me?</div>
                       <div class="panel-body text-right"><button type="submit" class="btn btn-success">Log In</button></div>
                    </div>
                </div>
            </div>
        </form:form>
    </body>
</html>
