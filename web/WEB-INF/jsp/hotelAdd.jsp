<%-- 
    Document   : hotelAdd
    Created on : Jun 4, 2017, 9:19:19 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
              
        <title>Add Hotel</title>
    </head>
    <body>
        
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><h3>HOME</h3></a></li>
                        <li><a href="#"><h3>DASHBOARD</h3></a></li>
                        <li><a href="#"><h3>ADD HOTEL</h3></a></li>
                        <li><a href="#"><h3>LOG OUT</h3></a></li>
                    </ul>
                </div>
            </nav>
        
            <div class="col-md-3"></div>
            <div class="container col-md-6" align="center">
                <div class="panel panel-success">

                    <div class="panel-heading text-center"><h3>ADD HOTEL</h3></div>
                    <div class="panel-body">
                    <input type="text" name="hotel_name" value="" size="50" placeholder="Hotel Name"/></div>

                     <div class="panel-body">
                    <input type="text" name="hotel_owner" value="" size="50" placeholder="Hotel Owner"/></div>

                    <div class="panel-body">
                    <select name="hotel_location" width ="100">
                        <option>______________________Hotel Location:-_______________________</option>
                        <option value="Johor" >Johor</option>
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
                    </select></div>

                    <div class="panel-body">
                    <textarea name="hotel_discription" rows="2" cols="40" placeholder="Description"></textarea></div>


                     <div class="panel-body">Hotel Logo:
                    <input type="file" name="hotel_main_image" value="" size="50" placeholder="Hotel Logo"/></div>

                     <div class="panel-body">Hotel Gallery:
                    <input type="file" name="image_hotel" value="" size="50"/></div>

                     <div class="panel-body">
                    <input type="text" name="image_url" value="" size="50" placeholder="Hotel URL"/></div>

                     <div class="panel-body"><input type="submit" value="Submit" name="submit" />
                    <input type="reset" value="Reset" name="reset" /> </div>
                </div>
            </div>
    </body>
</html>
