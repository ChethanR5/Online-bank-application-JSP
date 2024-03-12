<%-- 
    Document   : balance
    Created on : 04-Feb-2023, 8:09:19 pm
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
                
                var activeBtn=document.getElementById("withdraw-btn");
                activeBtn.style.backgroundColor="#0D4C92";
                activeBtn.style.boxShadow="-3px 3px #1363DF";
                activeBtn.style.border="1px solid white";
                activeBtn.style.paddingLeft="80px";
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
             int w_limit=rs.getInt("withdraw_limit");
             
             String pattern="yyyy-MM-dd";
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat(pattern);
//            Date d=new Date();
            String s=simpleDateFormat.format(new Date())+"%";

            
            String query4="select count(tid),sum(amount) from transactions where from_acc_no=? and date_time like ? and (type=? or type=?)";
            PreparedStatement ps4=con.prepareStatement(query4);
            ps4.setString(1, accno);
            ps4.setString(2, s);
            ps4.setString(3, "withdraw");
            ps4.setString(4, "transfer");

            ResultSet rs4=ps4.executeQuery();
            
            rs4.next();
            int t_count=rs4.getInt("count(tid)");
            int t_sum=rs4.getInt("sum(amount)");
            
            String query5="select * from manager";
            PreparedStatement ps5=con.prepareStatement(query5);
            
            ResultSet rs5=ps5.executeQuery();
            rs5.next();
            int daily_limit=rs5.getInt("daily_limit_no");
            

            %>
            
            
             <div style="display: none;">
            <div id="insert-screen">
               
                   
                   
                <% 
                     out.println("<form method='post' action='withdraw_db.jsp'>");
                      out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Enter Amount to Withdraw : <input style='margin:10px' type='number' name='withdrawamt' placeholder='in Rs' autofocus required><hr></h3>");
                     
            out.println("<input id='login_btn' class='action-btns' type='submit' style='background-color:green;color:white;padding:8px 15px 8px 15px;margin-left:45%;border-radius:5px;border-color:white' value='Withdraw'><hr></form>");
               
                   
             

//                    out.println("<h3 name='screen-lines' id='screen-lines' class='screen-lines' style='color:#0D4C92;padding-top:20px;font-family: 'Roboto', sans-serif;'>Balance in Acc no: "+accno+" is :<b> Rs."+balance+"<hr></b></h3>");
       
            %>
        </div>
            </div>
        
        <div style="display:none;">
            <div id="info-screen">
        <%
            out.println("<h5 id='name' class='headlines'>Name : "+name.toUpperCase()+"<hr></h5>");
            out.println("<h5 class='headlines'>Acc Number : "+accno+"<hr></h5>");
            out.println("<h5 class='headlines'>Balance : Rs."+balance+"<hr></h5>");
            int rem_lim=w_limit-t_sum;
            int rem_count=t_count-daily_limit;
//            out.println("<h5 class='headlines'>Balance : Rs."+balance+"<hr></h5>");
            out.println("<h6 class='headlines'>Withdrawal Limit :<b>"+w_limit+"</b></h6>");
            out.println("<h6 class='headlines'>Amount Transacted Today :<b>"+t_sum+"</b></h6>");
            out.println("<h6 class='headlines'>Allowed Transaction Limit :<b>"+rem_lim+"</b></h6>");
            out.println("<h6 class='headlines'>Transaction Limit :<b>"+daily_limit+"</b></h6>");
            out.println("<h6 class='headlines'>No of Transactions :<b>"+t_count+"</b></h6>");
            out.println("<h6 class='headlines'>Allowed No of Transactions :<b>"+-(rem_count)+"</b><hr></h6>");
           
            
            }
        catch(Exception e){
            out.println(e);
        }
        %>
            </div>
        </div>
            
        </body>
</html>