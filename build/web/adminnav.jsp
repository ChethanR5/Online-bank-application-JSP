<%-- 
    Document   : usernav
    Created on : 03-Feb-2023, 10:52:55 pm
    Author     : arun kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<script>
//    function to display msg
    function display_msg(msg,clr){
    
        if (clr=="danger"){
            red_msg();
        }
    document.getElementById("modal").style.display="block";
   
    document.getElementById("icon_title").innerHTML=msg;
  }
  
  function close_mod(){
    document.getElementById("modal").style.display="none";
  }
//  to change modal color to red
  function red_msg(){
      
      document.getElementById("msgbox").style.backgroundColor="orangered";
      document.getElementById("msgbox-close").style.backgroundColor="orangered";
      document.getElementById("msgbox-okay").style.backgroundColor="white";
      document.getElementById("msgbox-okay").style.borderColor="orangered";
      document.getElementById("msgbox-okay").style.color="orangered";
  }

    
</script>
  </head>

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
                        <li><a href="approve_users.jsp">Approve</a></li>
                        <li><a href="search_users.jsp">Search</a></li>
                        
                        <li class="has-sub">
                            <a href="javascript:void(0)">Block/Unblock</a>
                            <ul class="sub-menu">
                                <li><a href="blocked_users.jsp">Blocked</a></li>
                                <li><a href="unblock_requests">Unblock</a></li>
                            </ul>
                        </li>
                        <li><a href="no_limit.jsp">Limit</a></li>
                    </ul>   
                    <div class="border-button">
                      <a id="logoutbtn" style="background-color: green;color: white;border-color: white" id="modal_trigger" href="logout.jsp" class="sign-in-up"><i class="fa fa-user"></i> Logout </a>
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
  
  <footer style="bottom:0;position: fixed;padding: 15px;left:0;width:100%">
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

 