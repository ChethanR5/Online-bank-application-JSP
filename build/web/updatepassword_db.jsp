<%-- 
    Document   : updatepassword_db
    Created on : 05-Feb-2023, 10:33:19 pm
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
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            String name=rs.getString("name");
            int balance=rs.getInt("balance");
            String password=rs.getString("password");
            
            
            
            String old=request.getParameter("oldpass");
            String newpass=request.getParameter("newpass2");
            
            if(!old.equals(password)){
                out.println("<script>display_msg('Old Password Wrong','danger')</script>)");
                RequestDispatcher rd=request.getRequestDispatcher("update_password.jsp");
                rd.include(request, response);
            }
            else{
            String query2="UPDATE account SET password=? WHERE account_no=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            
           
            ps2.setString(1, newpass);
            ps2.setString(2, accno);
            
            
            int rs2=ps2.executeUpdate();
            
            
            out.println("<script>display_msg('Password Successfully Updated','')</script>)");
                RequestDispatcher rd=request.getRequestDispatcher("update_password.jsp");
                rd.include(request, response);
            }
            
            }
            catch(Exception e){
                out.println(e);
            }
            
            %>
        
        <!--<h1>Hello World!</h1>-->
    </body>
</html>
