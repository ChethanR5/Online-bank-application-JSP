<%-- 
    Document   : sidenav
    Created on : 04-Feb-2023, 12:31:57 am
    Author     : arun kumar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="usernav.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% try{
            String accno=session.getAttribute("accno").toString();
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, accno);
            ResultSet rs=ps.executeQuery();
            rs.next();
            String name=rs.getString("name").toUpperCase();

            String status=rs.getString("status");
            int balance=rs.getInt("balance");
            
            
            %>

            
<div class="row col-md-12 justify-content-md-center" id="main-bg">

    
    

    <div class="col-md-3" id="balance">
        <%
            out.println("<h5 id='name' class='headlines'>Name : "+name+"<hr></h5>");
            out.println("<h5 class='headlines'>Acc Number : "+accno+"<hr></h5>");
            out.println("<h5 class='headlines'>Balance : Rs."+balance+"<hr></h5>");
            %>
    </div>
    
    
        <div class="col-md-8" id="mainscreen">
            
        
      <div class="row-md-8">
            <div class="col-md-3" id="sidenav" style="float:left">
                <div class="buttons">
                 
                <ul class="buttons" style='list-style-type: none;' class="buttons">
                    
                    <a class="btns" href="balance.jsp"><li id="balance-btn" class="sidenav-list">Balance</li> </a>
                    <a class="btns" href="deposit.jsp"><li id="deposit-btn" class="sidenav-list">Deposit</li> </a>
                    <a class="btns" href="withdraw.jsp"><li id="withdraw-btn" class="sidenav-list">Withdraw</li> </a>
                    <a class="btns" href="transfer.jsp"><li id="transfer-btn" class="sidenav-list">Transfer</li> </a>
                    <a class="btns" href="ministatement.jsp"><li id="ministatement-btn" class="sidenav-list">Mini Statement</li> </a>
                    <a class="btns" href="accountsetting.jsp"><li id="limit-btn" class="sidenav-list">Set Withdrawal Limit</li> </a>
                    <a class="btns" href="block.jsp"><li id="block-btn" class="sidenav-list">Request for Block</li> </a>
                    <a class="btns" href="update_password.jsp"><li id="password-up-btn" class="sidenav-list">Password Update</li> </a>
                
                </div>  </div>
            <div class="col-md-8" style="border-radius: 10px;float:right;background-color:#BCCEF8;" id="insert-here">
                
            </div>
            
        
        
        </div>
</div>


    
    
    
        </div>
     <% 
        }
        catch(Exception e){
            out.println(e);
        }
            %>
           
            
            <footer style="bottom:0;position: fixed;padding: 15px;width:100%">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2023 <a href="#">SIMPLE BANK</a> Co., Ltd. All rights reserved. Author : <a href="https://github.com/ArunMaddyGit">Arun Kumar.</a>
          Template Design: <a title="CSS Templates" rel="sponsored" href="https://templatemo.com/page/1" target="_blank">TemplateMo</a></p>
        </div>
      </div>
    </div>
  </footer>
           <!--<script>display_msg("HELLO","danger");</script>--> 
    </body>
</html>
