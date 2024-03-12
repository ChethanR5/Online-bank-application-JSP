<%-- 
    Document   : blocked_userhome
    Created on : 06-Feb-2023, 9:27:44 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db_connection.db_connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="arun kumar m">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>simplebank.com</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-snapx-photography.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
     <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

    </head>
    
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

<body style="background-color:#DFF6FF;background-repeat: no-repeat;height: 100%">


  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        
                        <!-- <img style="float:left;" src="bank3.png" height="40px" alt="SnapX Photography Template"> -->
                        <span id="title">SIMPLE BANK</span>
                    </a>
                    
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <!--<li><a href="index.html" class="active">Home</a></li>-->
                        <li><a href="#">Deposit</a></li>
                        <li><a href="#">Withdraw</a></li>
                        
                        <li class="has-sub">
                            <a href="javascript:void(0)">Acc Settings</a>
                            <ul class="sub-menu">
                                <li><a href="#">Block</a></li>
                                <li><a href="#">Limit</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Transfer</a></li>
                    </ul>   
                    <div class="border-button">
                      <a id="logoutbtn" style="background-color: green;color: white;border-color: white;" id="modal_trigger" href="logout.jsp" class="sign-in-up"><i class="fa fa-user"></i> Logout </a>
                    </div>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  
  <div id="modal" class="popupContainer" style="display:none;margin-top: 100px;">
    <div id="msgbox" class="popupHeader" style="background-color: #82CD47">
        <span class="header_title" style="color:white">Message!</span>
        <span id="msgbox-close" class="modal_close" style="background-color: #82CD47;" id="close_button" onclick="close_mod()"><i class="fa fa-times"></i></span>
    </div>

    <section class="popupBody">
       
        <div class="social_login">
            <div class="">
                <a href="#" class="social_box fb">
                   
                    <span class="icon_title" id="icon_title"  style="color:black">Message Body</span>
                    
                   

                </a>

               
            </div>

           
            <hr>
            <div class="action_btns">
                
                <div style="float:right;" class="one_half"><a id="msgbox-okay" style="border: solid 2px #82CD47;background-color: white;color:#82CD47;" onclick="close_mod()" href="#" id="login_form" class="btn"><b>Okay</b></a></div>
           
            </div>
        </div>

       
    </section>
  </div>
  
  
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
<!--                <div class="buttons">
                 
                <ul class="buttons" style='list-style-type: none;' class="buttons">
                    
                    <a class="btns" href="#"><li id="balance-btn" class="sidenav-list">Balance</li> </a>
                    <a class="btns" href="#"><li id="deposit-btn" class="sidenav-list">Deposit</li> </a>
                    <a class="btns" href="#"><li id="withdraw-btn" class="sidenav-list">Withdraw</li> </a>
                    <a class="btns" href="#"><li id="transfer-btn" class="sidenav-list">Transfer</li> </a>
                    <a class="btns" href="#"><li id="ministatement-btn" class="sidenav-list">Mini Statement</li> </a>
                    <a class="btns" href="#"><li id="limit-btn" class="sidenav-list">Set Withdrawal Limit</li> </a>
                    <a class="btns" href="#"><li id="block-btn" class="sidenav-list">Request for Block</li> </a>
                    <a class="btns" href="#"><li id="password-up-btn" class="sidenav-list">Password Update</li> </a>
                
                </div> -->
</div>
            <div class="col-md-8" style="border-radius: 10px;float:right;background-color:#BCCEF8;" id="insert-here">
                <%
                     if(status.equals("blocked")){
            out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines'>Your Account is Blocked</h3>");
            out.println("<h4 name='screen-lines' id='screen-lines' class='screen-lines'>Request to Unblocked</h4>");
             out.println("<form method='post' action='block_db.jsp'>" );
            
             out.println("<input id='login_btn' class='action-btns' type='submit' name='block' style='background-color:green;color:white;padding:8px;margin-left:15%;border-radius:5px;' value='Request for Unblock'><br></form>");
             }
             else if(status.equals("pending")){
             out.println("<h4 name='screen-lines' id='screen-lines' class='screen-lines'>Account Approval is Pending</h4>");
          
            }
            else if(status.equals("unblockrequest")){
                 out.println("<h4 name='screen-lines' id='screen-lines' class='screen-lines'>Unblock Request is Pending</h4>");
             }
                    
        
                    
                    %>
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
            
            <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>

  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>



           <!--<script>display_msg("HELLO","danger");</script>--> 
    </body>
</html>

  
  

  