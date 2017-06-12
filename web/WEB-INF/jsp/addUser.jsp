<%-- 
    Document   : addUser
    Created on : Jun 4, 2017, 10:33:09 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;">
        <link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Add User</title>
    </head>
    <body>
         <nav class="navbar navbar-default">
           
         </nav>
        <div class="container" align="center">
            <div class="panel panel-success" style="max-width: 100;">
                
                <div class="panel-heading text-center"><h3>ADD USER</h3></div>
       

         <div class="panel-body">
        <input type="text" name="user_name" value="" size="50" placeholder="USER NAME"/></div>
         
          <div class="panel-body">
         <input type="password" name="user_password" value="" size="50" placeholder="PASSWORD"/></div>
                
                 <div class="panel-body">
         <input type="password" name="confom_password" value="" size="50" placeholder="CONFOMATION PASSWORD"/></div>
         
         <div class="panel-body">
         <select name="user_type" >
             <option>_______________________USER TYPE:-_________________________</option>
                 <option value="Traveler" >Traveler</option>
                 <option value="Family">Family</option>
                 <option value="Business">Business</option>
             </select>
         </div>
         
          <div class="panel-body">
         <input type="text" name="user_fullname" value="" size="50" placeholder="FULL NAME"/></div>
         
          <div class="panel-body">
         <input type="text" name="user_age" value="" size="50" placeholder="AGE"/></div>
         
         
         <div class="panel-body">
          <select name="user_location">
            <option>______________________Hotel Location:-_______________________</option>
            <option value="Johor">Johor</option>
            <option value="Melaka">Melaka</option>
            <option value="Negeri Sembila">Negeri Sembilan</option>
            <option value="Selangor">Selangor</option>
            <option value="Kuala Lumpur">Kuala Lumpur</option>
            <option value="Perak">Perak</option>
            <option value="Kedah">Kedah</option>
            <option value="Pulau Pinang">Pulau Pinang</option>
            <option value="Perlis">Perlis</option>
            <option value="Terengganu">Terengganu</option>
            <option value="Kelantan">Kelantan</option>
            <option value="Sabah">Sabah</option>
            <option value="Sarawak">Sarawak</option>
            <option value="Labuan">Labuan</option>
        </select>
         
         </div>
         
        <input type="submit" value="Submit" name="submit" />
        <input type="reset" value="Reset" name="reset" />
        </div>
        </div>
    </body>
</html>
