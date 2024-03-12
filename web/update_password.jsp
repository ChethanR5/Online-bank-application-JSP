<%-- 
    Document   : update_password
    Created on : 05-Feb-2023, 10:11:47 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include  file="sidenav.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance Page</title>
        <script>
            $(document).ready(function(){

            $(document).ready(function(){
                
                var activeBtn=document.getElementById("password-up-btn");
                activeBtn.style.backgroundColor="#0D4C92";
                activeBtn.style.boxShadow="-3px 3px #1363DF";
                activeBtn.style.border="1px solid white";
                activeBtn.style.paddingLeft="30px";
//                document.getElementById("insert-screen");
                document.getElementById("insert-here").innerHTML=document.getElementById("insert-screen").innerHTML;
//                var balance=document.getElementById("balance").innerHTML;
                document.getElementById("balance").innerHTML=document.getElementById("info-screen").innerHTML;
              
             
            });
  
});

            function checkpass(){
                
                var o=document.getElementById("newpass1").value;
                 var n=document.getElementById("newpass2").value;
                 if(o!==n){
                     if( o && n){
                     document.getElementById('dis').innerHTML='*password doesn\'t match';
                     document.getElementById('dis').style.display="block";
                 }
             }
                 else{
                     document.getElementById('dis').style.display="none";
                 }
             }
            
        </script>
        
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
            String name=rs.getString("name");
            int balance=rs.getInt("balance");
            String password=rs.getString("password");
             
            %>
            
            <div style="display: none;">
            <div id="insert-screen">
               
                <% 

              
                out.println("<form method='post' action='updatepassword_db.jsp'>");
                out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Enter Old Password :</h3><h4> <input type='password' id='oldpass' name='oldpass' required></h4>");
                out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Enter New Password :</h3><h4> <input type='password' id='newpass1' name='newpass1' onblur='checkpass()' required></h4>");
                
                out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Re-Enter New Password :</h3><h4> <input type='password' id='newpass2' name='newpass2' onblur='checkpass()' required><hr></h4>");
                out.println("<div style='color:red;height:30px;margin-left:3%;margin-right:40%;margin-top:-10px;'><p id='dis' style='color:red;display:none'></p> </div>");
                out.println("<input id='login_btn' class='action-btns' type='submit' style='background-color:green;color:white;padding:8px 15px 8px 15px;margin-left:20%;border-radius:5px;border-color:white' value='Update Password'><hr></form>");
               
            
           
           
        }
        catch(Exception e){
            out.println(e);
        }
            %>
        </div>
        

</div>
        
        
    </body>
</html>
