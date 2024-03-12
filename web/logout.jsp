<%-- 
    Document   : logout
    Created on : 28 Dec, 2022, 1:44:00 AM
    Author     : ARUN KUMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            session.invalidate();
            out.print("<script>window.location.replace('index.html')</script>");
            }
            catch(Exception e)
            {
                out.println(e);
            }

            %>
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
