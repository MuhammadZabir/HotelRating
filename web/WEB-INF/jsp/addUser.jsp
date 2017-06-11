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
        <title>Add User</title>
    </head>
    <body>
         <center>
        <br>
        <br>
        <h1>Add User</h1>

        Username:
        <input type="text" name="user_name" value="" size="30" /><br><br>
         
         Password:
         <input type="password" name="user_password" value="" size="30" /><br><br>
         
         User Type:
         <select name="user_type" >
             <option>-----------------------------------------------------------</option>
                 <option value="Traveler" >Traveler</option>
                 <option value="Family">Family</option>
                 <option value="Business">Business</option>
             </select>
         <br><br>
         
         Full Name:
         <input type="text" name="user_fullname" value="" size="30"/><br><br>
         
         User Age:
         <input type="text" name="user_age" value="" size="30" /><br><br>
         
         
         User Location:
          <select name="user_location">
            <option>-----------------------------------------------------------</option>
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
         
         <br>
         
         <br>
         <br>
         
        <input type="submit" value="Submit" name="submit" />
        <input type="reset" value="Reset" name="reset" />
        </center>
    </body>
</html>
