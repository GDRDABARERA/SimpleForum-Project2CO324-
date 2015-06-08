<%-- 
    Document   : login.jsp
    Created on : May 4, 2015, 9:22:29 AM
    Author     : dinalidabarera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logIn page</title>
   
    </head>
    <body>
        
            <form action="j_security_check" method="POST" class="alert-success">
                <b> Username :</b><input type="text" name="j_username"><br>
                <b> Password :</b><input type="password" name="j_password">
                <br>
                <input type="submit" value="Login" name="j_security_check">
            </form>
       
    </body>
</html>