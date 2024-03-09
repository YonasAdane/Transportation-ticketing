<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>

<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
           if(session.getAttribute("name")==null){
            response.sendRedirect("LoginPage.jsp");
            }
  
        %>
        <h1>Hello User!</h1>
        <table>
            <tr>
                <td>Start:</td>
                <td><input type="text" name="UserName"></td>
            </tr>
            <tr>
                <td>Destination:</td>
                <td><input type="text" name="Destination"></td>
            </tr>
            <tr>
                <td>Start:</td>
                <td><input type="text" name="Start"></td>
            </tr>
            <tr>
                <td>Start:</td>
                <td><input type="text" name="UserName"></td>
            </tr>
            <tr>
                <td>Start:</td>
                <td><input type="text" name="UserName"></td>
            </tr>
            <tr>
                <td>Start:</td>
                <td><input type="text" name="UserName"></td>
            </tr>
            
        </table>
    </body>
</html>
