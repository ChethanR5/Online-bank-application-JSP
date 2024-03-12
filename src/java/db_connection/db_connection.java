/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package db_connection;

import java.sql.*;

/**
 *
 * @author Arun Kumar
 */
public class db_connection {
//   public static void main(String[] args)
//   {
//       db_connection d=new db_connection();
//       d.dbcon();
//   }
   public Connection dbcon()
    {
        Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/satm";
            String username="root";
            String password="";
            con = DriverManager.getConnection(url, username, password);
            if(con!=null)
            {
                System.out.println("Connection established");
            }
            else
            {
               System.out.println("problem with database Connection "); 
            }
        }
        catch(Exception e)
        {
        System.out.println(e);
        }
        return con;
    }
}

