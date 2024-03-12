<%-- 
    Document   : daily_limit_no
    Created on : 06-Feb-2023, 3:15:52 pm
    Author     : aruna
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include  file="adminnav.jsp"%>
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
            int tlimit=Integer.parseInt(request.getParameter("limit"));
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query2="UPDATE manager SET daily_limit_no=? WHERE m_name=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setInt(1, tlimit);
            ps2.setString(2, accno);
            ps2.executeUpdate();
            out.println("<script>display_msg('Changes Updated','');</script>");
            
            RequestDispatcher rd=request.getRequestDispatcher("no_limit.jsp");
            rd.include(request, response);
            }
            catch(Exception e){
                out.println(e);
            }
            
           
            %>
       
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
