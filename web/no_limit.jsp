<%-- 
    Document   : no_limit
    Created on : 06-Feb-2023, 3:06:12 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>

<%@include file="adminnav.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--<h1>Admin Home Page</h1>-->
        <%
        String accno=session.getAttribute("accno").toString();
//        out.println(accno);
            
        %>
        <centre>
            <div class="row justify-content-md-center" style="padding-top: 10%;background-color: #DFF6FF">
        <div class="col-md-10" id="mainscreen" style="background-color:#BCCEF8;border-radius: 15px;padding: 20px 10px 20px 10px;">

        
            
        
      <div class="row-md-8">
            <div class="col-md-3" id="sidenav" style="float:left">
                <div class="buttons">
                 
                <ul class="buttons" style='list-style-type: none;' class="buttons">
                    
                    <a class="btns" href="approve_users.jsp"><li id="balance-btn" class="sidenav-list">Approve Users</li> </a>
                    <a class="btns" href="search_users.jsp"><li id="deposit-btn" class="sidenav-list">Search Users</li> </a>
                    <a class="btns" href="blocked_users.jsp"><li id="withdraw-btn" class="sidenav-list">Blocked Users</li> </a>
                    <a class="btns" href="unblock_requests.jsp"><li id="transfer-btn" class="sidenav-list">Unblock Requests</li> </a>
                    <a class="btns" href="transactions.jsp"><li id="limit-btn" class="sidenav-list">Transactions</li> </a>
                    <a class="btns" href="no_limit.jsp"><li id="block-btn" class="sidenav-list">Set Transactions Limit</li> </a>
                   
                </div>  </div>
            <div class="col-md-9" style="border-radius: 10px;padding-left: 20px;float:right;background-color:#BCCEF8;" id="insert-here">
                
                   
            
            <%
            try{
              
                db_connection db=new db_connection();
                Connection con=db.dbcon();
                
            String query="select * from manager where m_name=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            
            int tlimit=rs.getInt("daily_limit_no");
                   
             out.println("<form method='post' action='daily_limit_no.jsp'>" );
            out.println("<h2 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Enter Number of Transaction<br> Limit per Day :");
//            out.println("<input type='text' name='limit' value="+tlimit+" pattern='[0-9]{*}'></h2><br>");
            out.println("<input style='margin:10px' type='number' name='limit' value="+tlimit+"  placeholder='in Rs' autofocus required><hr></h3>");    
            
            out.println("<input id='login_btn' class='action-btns' type='submit' style='background-color:green;color:white;padding:8px 15px 8px 15px;margin-left:45%;border-radius:5px;border-color:white' value='Set Limit'><hr></form>");
           
//            out.println("<input type='submit' style='background-color:green;color:white;padding:8px;margin-left:15%;border-radius:5px;' value='Set Limit'></form>");
       
            
            }
            catch(Exception e){
                out.println(e);
            }
            %>
                     
               
            </div>
            
        
        
        
</div>
            
            
            
            


</div>
</div>
</centre>
    
    
                
        

    </body>
</html>

