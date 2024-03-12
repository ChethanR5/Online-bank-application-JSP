<%-- 
    Document   : ministatement
    Created on : 28 Dec, 2022, 11:17:58 PM
    Author     : ARUN KUMAR
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@include file="adminnav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
            <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

            <script>
                $(document).ready(function () {
                $('#table2').DataTable();
                  });
                </script>
    </head>
    <body style="background-color: #E4FBFF;bottom: 0;">
        
         <a style="float:left;margin-top: 8%;margin-left: 20px;" id='login_btn' class='action-btns' href="adminhome.jsp"><button style="border:2px solid white;padding: 10px" id="block-btn" class="sidenav-list"><i style="padding-right: 10px" class="fa fa-angle-double-left"></i>Back</button> </a>
          
        
        <centre>
    <div class="row justify-content-md-center" style="padding-top: 10%;background-color: #DFF6FF">
        <div class="col-md-11" id="mainscreen" style="background-color:white;margin: 1%;border-radius: 15px;padding-top: 20px;">

            <table id="table2" class="display" style="width:90%">
        <thead>
            <tr>
                                    <th>Account No</th>
                                    <th>Name</th>
                                    <th>Mobile NO</th>
                                    <th>Balance</th>
                                    <th>Approve</th>
                                    
            </tr>
        </thead>
        <tbody>
        <%
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where status=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, "pending");
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                   out.println("<tr><td>"+rs.getString("account_no")+"</td>" );
                   out.println("<td>"+rs.getString("name")+"</td>");
                   out.println("<td>"+rs.getBigDecimal("mobile_no")+"</td>");
                   out.println("<td>"+rs.getFloat("balance")+"</td>");
                   out.println("<form action='approve_db.jsp'>");
                   
                   out.println("<td><button id='login_btn' class='action-btns' type='submit' style='background-color:green;color:white;border:1px solid white;padding:5px;' name='btn' value='"+rs.getString("account_no")+"'>Approve</button></td></form></tr>");
           
            
            }
            }
            catch(Exception e){
                out.println(e);
            }
            %>
        </tbody>
                     
                </div>
           
        </div>
        </centre>
     </body>
</html>