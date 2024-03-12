<%-- 
    Document   : accountsetting_db
    Created on : 05-Feb-2023, 10:04:27 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%--<%@include  file="sidenav.jsp"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            int tlimit=Integer.parseInt(request.getParameter("limit"));
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query2="UPDATE account SET withdraw_limit=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setInt(1, tlimit);
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            
            RequestDispatcher rd=request.getRequestDispatcher("accountsetting.jsp");
            rd.include(request, response);
            out.println("<script>display_msg('Update Successful','');</script>");
            
           
            %>
        
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
