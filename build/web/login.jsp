<%-- 
    Document   : login
    Created on : 26 Dec, 2022, 8:29:54 PM
    Author     : ARUN KUMAR
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
        <%
            try{
            String userid=request.getParameter("userid");
            String password=request.getParameter("password");
            
            db_connection db=new db_connection();
            Connection con=db.dbcon();
            
            if(!userid.isEmpty() && !password.isEmpty()){
            String query="select * from account where account_no=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, userid);
            ResultSet rs=ps.executeQuery();
//            int rs2=ps.executeQuery();
            
               
            if(rs.next()){
           
                if(userid.equalsIgnoreCase(rs.getString("account_no")) && password.equalsIgnoreCase(rs.getString("password"))){
                    session.setAttribute("accno", userid);
                    String status=rs.getString("status");
                    if(status.equals("approved")){
                         RequestDispatcher rd=request.getRequestDispatcher("userhome.jsp");
                    rd.forward(request, response);
                    }
                    else{
                    RequestDispatcher rd=request.getRequestDispatcher("blocked_userhome.jsp");
                    rd.forward(request, response);
                    }
                }
                                
            
            }
            else{
            
            String query2="select m_name, m_password from manager where m_name=?";
            PreparedStatement ps2=con.prepareStatement(query2);
            ps2.setString(1, userid);
            ResultSet rs2=ps2.executeQuery();
            if(rs2.next()){
           
                if(userid.equalsIgnoreCase(rs2.getString("m_name")) && password.equalsIgnoreCase(rs2.getString("m_password"))){
                    session.setAttribute("accno", userid);
                    RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
                    rd.forward(request, response);
                }
            
            
            }
            
            else{
                out.println("<p>invalid user</p>");
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
            
            }
            }
//            else{
//                 out.println("<script>alert('invalid user')</script>");
//                RequestDispatcher rd=request.getRequestDispatcher("index.html");
//                rd.forward(request, response);
//            }
            }
            catch(Exception e){
                out.println(e);
            
            }

            %>
        
    </body>
</html>
