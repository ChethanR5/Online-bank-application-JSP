<%-- 
    Document   : adminhome
    Created on : 06-Feb-2023, 10:08:06 am
    Author     : aruna
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="col-md-9" style="border-radius: 10px;float:right;background-color:#BCCEF8;" id="insert-here">
                
                    <h2 class='headlines' style='color:black;padding:50px;'>Welcome Admin!<br></h2>
                     
               
            </div>
            
        
        
        
</div>
            
            
            
            


</div>
</div>
</centre>
    
    
                
        

    </body>
</html>

