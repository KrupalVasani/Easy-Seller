<%-- 
    Document   : add_to_cart.jsp
    Created on : 09-May-2022, 5:24:41 pm
    Author     : ABCD
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to cart Page</title>
    </head>
    <body>
        <%
            
            
        int u_id=Integer.parseInt(request.getParameter("u_id"));
        int p_id=Integer.parseInt(request.getParameter("p_id"));
        int quantity=Integer.parseInt(request.getParameter("quantity"));
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
            
            PreparedStatement ps_retrive = con.prepareStatement("select * from cart where u_id=? and p_id=?");
      
            ps_retrive.setInt(1,u_id);
            ps_retrive.setInt(2,p_id);
            
            ResultSet quantity_rs=ps_retrive.executeQuery();
            if(quantity_rs.next())
            {
            int existingQuantity=quantity_rs.getInt("quantity");
            quantity+=existingQuantity;
            PreparedStatement ps = con.prepareStatement("update cart set quantity=? where u_id=? and p_id=?");
        ps.setInt(2,u_id);
        ps.setInt(3,p_id);
        ps.setInt(1,quantity);
            
            int count = ps.executeUpdate();
            if(count>0)
            {
            
            //item added successfuly
        }
        else
        {
        //some error occured
        }
            }
            else
            {
        PreparedStatement ps = con.prepareStatement("Insert into cart(u_id,p_id,quantity) values(?,?,?)");
        ps.setInt(1,u_id);
        ps.setInt(2,p_id);
        ps.setInt(3,quantity);
            
            int count = ps.executeUpdate();
            if(count>0)
            {
            
            //item added successfuly
        }
        else
        {
        //some error occured
        }}
response.sendRedirect("listProducts.jsp");
           
        %>
    </body>
</html>
