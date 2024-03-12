<%-- 
    Document   : transactions
    Created on : 06-Feb-2023, 3:02:16 pm
    Author     : aruna
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
                $('#table5').DataTable();
                  });
                </script>
    </head>
    <body style="background-color: #E4FBFF;bottom: 0;">
        
         <a style="float:left;margin-top: 8%;margin-left: 20px;" id='login_btn' class='action-btns' href="adminhome.jsp"><button style="border:2px solid white;padding: 10px" id="block-btn" class="sidenav-list"><i style="padding-right: 10px" class="fa fa-angle-double-left"></i>Back</button> </a>
          
        
        <centre>
    <div class="row justify-content-md-center" style="padding-top: 10%;background-color: #DFF6FF">
        <div class="col-md-11" id="mainscreen" style="background-color:white;margin: 1%;border-radius: 15px;padding-top: 20px;">

            <table id="table5" class="display" style="width:100%">
        <thead>
            <tr>
                                    <th>Transaction ID</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Type</th>
                                    <th>From Acc No</th>
                                    <th>To Acc No</th>
                                    <th>Amount</th>
            </tr>
        </thead>
        <tbody>
        <%
            try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from transactions";
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                    out.println("<tr><td>"+rs.getInt("tid")+"</td>" );
                   out.println("<td>"+rs.getDate("date_time")+"</td>");
                   out.println("<td>"+rs.getTime("date_time")+"</td>");
                   out.println("<td>"+rs.getString("type")+"</td>");
                   out.println("<td>"+rs.getString("from_acc_no")+"</td>");
                   out.println("<td>"+rs.getString("to_acc_no")+"</td>");
                   out.println("<td>"+rs.getInt("amount")+"</td></tr>");
            }
            }
            catch(Exception e){
                out.println(e);
            }
            %>
        </tbody>
        </table>
          </div>
           
        </div>
        


       
</centre>
        
    </body>
</html>
