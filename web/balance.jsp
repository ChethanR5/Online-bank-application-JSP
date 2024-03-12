<%-- 
    Document   : balance
    Created on : 04-Feb-2023, 8:09:19 pm
    Author     : aruna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="sidenav.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balance Page</title>
        <script>
            $(document).ready(function(){

            $(document).ready(function(){
                var activeBtn=document.getElementById("balance-btn");
                activeBtn.style.backgroundColor="#0D4C92";
                activeBtn.style.boxShadow="-3px 3px #1363DF";
                activeBtn.style.border="1px solid white";
                activeBtn.style.paddingLeft="80px";
//                document.getElementById("insert-screen");
                document.getElementById("insert-here").innerHTML=document.getElementById("insert-screen").innerHTML;
              $('#sidenav').append();
            });
  
});
            
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
            %>
            <div style="display: none;">
            <div id="insert-screen">
               
                   
                   
                <% 
//                    out.println("<button name='button' id='button' value='button'></button>");
                    out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Balance in Acc no: "+accno+" is :<b> Rs."+balance+"<hr></b></h3>");
//                   out.println("<h3 style='margin-top:100px' name='screen-lines' id='screen-lines' class='screen-lines' style='color:black;padding-top:20px;'>Balance in Acc no: "+accno+" is : Rs."+balance+"</h3><button name='button' id='button'>Button</button>");
        }
        catch(Exception e){
            out.println(e);
        }
            %>
        </div>
            </div>
        
    </body>
</html>
