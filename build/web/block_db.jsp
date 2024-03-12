<%-- 
    Document   : block_db
    Created on : 05-Feb-2023, 11:02:28 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
            try{
            String accno=session.getAttribute("accno").toString();
            String value=request.getParameter("block");
            
            
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
           
            
            String query2="UPDATE account SET status=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
           if(value.equals("Request for Block")){
            ps2.setString(1,"blocked" );
           }
           else{
             ps2.setString(1,"unblockrequest" );
           }
            ps2.setString(2, accno);
            int rs2=ps2.executeUpdate();
            
            RequestDispatcher rd=request.getRequestDispatcher("index.html");
            rd.forward(request, response);
            
            }
            catch(Exception e)
            {
                out.println(e);
            }
            %>
    </body>
</html>
