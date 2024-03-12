<%-- 
    Document   : register_db
    Created on : 06-Feb-2023, 10:18:21 pm
    Author     : aruna
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="usernav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <a style="float:left;margin-top: 8%;margin-left: 20px;" id='login_btn' class='action-btns' href="index.html"><button style="border:2px solid white;padding: 10px" id="block-btn" class="sidenav-list"><i style="padding-right: 10px" class="fa fa-angle-double-left"></i>Back</button> </a>
          
        
        
        <%
            try{
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            float contact=Float.parseFloat(request.getParameter("contact"));
//            String address=request.getParameter("address");
//            String passrecovery=request.getParameter("passrecovery");
//            String hint=request.getParameter("hint");
            String accno=request.getParameter("accno");
          
            
         
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            
            
            String query="INSERT INTO `account`(`account_no`, `name`, `password`, `mobile_no`) VALUES (?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ps.setString(2, name);
//            ps.setString(3, address);
            ps.setString(3, password);
            ps.setFloat(4, contact);

            
            int result=ps.executeUpdate();
            if(result==1){
                out.println("<script>display_msg('"+accno+", is your Account Number, Please Note It.Your Account will be Approved By Admin');</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("index.html");
//                rd.include(request, response);
            }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
        
    </body>
</html>

