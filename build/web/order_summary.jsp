<%-- 
    Document   : order_summary.jsp
    Created on : 10-May-2022, 11:59:39 pm
    Author     : ABCD
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
        
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%
            int sum=0;
        int u_id=Integer.parseInt(session.getAttribute("u_id").toString());
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
   
            PreparedStatement ps = con.prepareStatement("select * from cart where u_id="+u_id);
            
            ResultSet rs1=ps.executeQuery();

            out.print(" <div class='col d-flex justify-content-center ' style='padding-top: 2rem; padding-left:5rem; '>");

while(rs1.next())
{
//get product data
PreparedStatement ps1 = con.prepareStatement("select * from products where p_id="+rs1.getInt("p_id"));
ResultSet rs=ps1.executeQuery();

int quantity=rs1.getInt("quantity");

if(rs.next())
{

int totalPrice=Integer.parseInt(rs.getString("price"))*quantity;


//build product model
out.print("<div class='col d-flex justify-content-center card shadow bg-body rounded center'  style='height: auto; padding: 1rem; margin: 0.7rem;'>");
                out.print("<div class='card-header text-uppercase font-weight-bold ' style='padding-left: 1rem; padding-top: 1rem'>"+rs.getString("name")+"</div>");
                out.print("<div class='card-body row '><div  class='col font-italic'style='padding-left: 1rem; padding-top: 0.2rem'>Price:  &#x20b9; "+rs.getString("price")+"</div>");
                out.print("<div  class='col font-italic' style='padding-left: 1rem; padding-top: 0.2rem'>Quantity: "+quantity+"</div>");  
                out.print("<div  class='col font-weight-normal'style='padding-left: 1rem; padding-top: 0.2rem'> Total Price &#x20b9; "+totalPrice+"</div></div>");
                   sum+=totalPrice;
        out.print(" </div>");
        
        }
        
        
        }out.print(" </div>");
        
        %>
    </body>
</html>
