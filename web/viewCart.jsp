<%-- 
    Document   : viewCart
    Created on : 09-May-2022, 4:45:08 pm
    Author     : ABCD
--%>

<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart Page</title>
    </head>
    <body>
        
        
<%@ include file="navbar.html" %> 
        <a href='home.jsp' class='btn btn-dark previous' style='margin-top:5rem; margin-left:5rem;'>&laquo; Home</a>
     <h1 style='padding-top: 1rem; padding-left:5rem;'>My Cart </h1>
        
        
        
        <%
            int sum=0;
        int u_id=Integer.parseInt(session.getAttribute("u_id").toString());
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
   
            PreparedStatement ps = con.prepareStatement("select * from cart where u_id="+u_id);
            
            ResultSet rs1=ps.executeQuery();

            out.print(" <div class='row' style='padding-top: 2rem; padding-left:5rem; '>");

            boolean hasProducts=false;
            
while(rs1.next())
{
     hasProducts=true;

//get product data
PreparedStatement ps1 = con.prepareStatement("select * from products where p_id="+rs1.getInt("p_id"));
ResultSet rs=ps1.executeQuery();

int quantity=rs1.getInt("quantity");

if(rs.next())
{

byte[] imgData = rs.getBytes("image"); // blob field
                byte[] encodeBase64 = Base64.encodeBase64(imgData);
                String base64DataString = new String(encodeBase64 , "UTF-8");
int totalPrice=Integer.parseInt(rs.getString("price"))*quantity;


//build product model
out.print("<div class='col-auto card shadow bg-body rounded' style='width: 18rem; height: auto; padding: 1rem; margin: 0.7rem;'>");
                out.print("<img src='data:image/jpg;base64,"+base64DataString+"' style='width: 8rem; height: 10rem; margin: auto; margin-top: 0rem;' class='card-img-top'>");
                out.print("<h2 style='padding-left: 1rem; padding-top: 1rem'>"+rs.getString("name")+"</h3>");
                out.print("<h4 style='padding-left: 1rem; padding-top: 0.2rem'>  &#x20b9; "+rs.getString("price")+"</h4>");
                out.print("<h5 style='padding-left: 1rem; padding-top: 0.2rem'>Quantity: "+quantity+"</h6>");  
                out.print("<h4 style='padding-left: 1rem; padding-top: 0.2rem'> Total Price &#x20b9; "+totalPrice+"</h4>");
                   sum+=totalPrice;
       out.print("<a class='btn btn-warning' href='removeFromCart.jsp?p_id="+rs.getInt("p_id")+"&u_id="+u_id+"'>Remove from Cart</a>");
        out.print(" </div>");
        }
        
        
        
        
        
        
        
        
        
        
        }out.print(" </div>");
        
        
        
        
        
                out.print("<p class='d-flex justify-content-center'>Total Amount: &#x20b9;"+sum+"</p>");
                out.print("<p class='d-flex justify-content-center'><a class='btn btn-info' href='take_address.jsp' >Place Order</a></p>");
                
        
        
        
        
        
        
        
         if(!hasProducts)
         {
            out.println("<h2 class='d-flex justify-content-center'>Ooops Your Cart Is Empty.</h2>");
        }
        %>
        
        
    </body>
</html>
