<%-- 
    Document   : unblock_user_db
    Created on : 06-Feb-2023, 2:46:03 pm
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
                String accno=request.getParameter("btn");
                db_connection db=new db_connection();
                Connection con=db.dbcon();
            
            String query="UPDATE account SET status=? WHERE account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, "approved");
            ps.setString(2, accno);
            
            ps.executeUpdate();
             out.println("<script>display_msg('"+accno+" is Unblocked','');</script>");
            
            RequestDispatcher rd=request.getRequestDispatcher("unblock_requests.jsp");
            rd.include(request, response);
            }
            catch(Exception e){
            out.println(e);
                
            }
            %>
      
    </body>
</html>
