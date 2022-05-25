
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <%
        
            String ad1=request.getParameter("ad1");
            String ad2=request.getParameter("ad2");
            String ad3=request.getParameter("ad3");
            String ad4=request.getParameter("ad4");
            String ad5=request.getParameter("ad5");
            String ad6=request.getParameter("ad6");
            
            int u_id=Integer.parseInt(session.getAttribute("u_id").toString());

            //String addr=ad1+"\n"+ad2+"\n"+ad3+"\n"+ad4+"\n"+ad5+"\n"+ad6+"\n";
            String addr="Hiren Kumar\n121-H.K Bhildings\nAhmedabad\nGujarat,India.";
            
            session.setAttribute("address",addr);
            
            /**
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
   
            PreparedStatement ps = con.prepareStatement("insert into addresses values(?,?,?,?,?,?,?)");
            ps.setString(1, ad1);
            ps.setString(2, ad2);
            ps.setString(3, ad3);
            ps.setString(4, ad4);
            ps.setString(5, ad5);
            ps.setString(6, ad6);
            ps.setInt(7, u_id);
            
            int count=ps.executeUpdate();
            if(count>0)
            {
        //data uploaddededdedde
        }
        else
        {//error}
        
        
        
        }*/
        %>
        <% response.sendRedirect("confirm_order.jsp");   %>    
    </body>
</html>
