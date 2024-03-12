<%-- 
    Document   : block
    Created on : 05-Feb-2023, 10:52:50 pm
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
                
                var activeBtn=document.getElementById("block-btn");
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
            String status=rs.getString("status");
             
            %>
            
             
            <div style="display: none;">
            <div id="insert-screen">
                
                <% 

             
            
            
            out.println("<form method='post' action='block_db.jsp'>" );
            if(status.equals("approved")){
                 out.println("<input type='submit' id='login_btn' class='action-btns' name='block' style='background-color:green;color:white;padding:8px;margin-left:15%;margin-top:25px;border-radius:5px;' value='Request for Block'><br></form>");
            }
             else if(status.equals("blocked")){
                 out.println("<input type='submit' id='login_btn' class='action-btns' name='block' style='background-color:green;color:white;padding:8px;margin-left:15%;margin-top:25px;border-radius:5px;' value='Request for Unblock'><br></form>");
             }
             else if(status.equals("blockrequest"))
            {
                out.println("<h3 style='margin-top:25px;'> waiting for approval of Block Request</h3>");
            }
           
        }
        catch(Exception e){
            out.println(e);
        }
            %>
        </div>
        

</div>
    </body>
</html>
        