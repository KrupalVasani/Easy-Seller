
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of My Products</title>
        
  
    </head>
    <body>
        
        
       
<%@ include file="navbar.html" %> 
        
        <%
            out.print("<a href='home.jsp' class='btn btn-dark previous' style='margin-top:5rem; margin-left:5rem;'>&laquo; Home</a>");
            out.print("<h1 style='padding-top: 1rem; padding-left:5rem;'>List Of My Products, </h1>");
            out.print("<div class='row w-100' style='padding-top: 2rem; padding-left:5rem;'>");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
            Statement s = con.createStatement();
            int u_id=Integer.parseInt(session.getAttribute("u_id").toString());
            ResultSet rs = s.executeQuery("SELECT * from products where u_id = "+u_id);
            
            while(rs.next()){
                
                //managing image
                byte[] imgData = rs.getBytes("image"); // blob field
                byte[] encodeBase64 = Base64.encodeBase64(imgData);
                String base64DataString = new String(encodeBase64 , "UTF-8");
                
                out.print("<div class='col-auto card shadow bg-body rounded' style='width: 20rem; height: auto; padding: 1rem; margin: 0.7rem;'>");
                out.print("<img src='data:image/jpg;base64,"+base64DataString+"' style='width: 8rem; height: 10rem; margin: auto; margin-top: 0rem;' class='card-img-top'>");
                out.print("<h3 style='padding-left: 1rem; padding-top: 1rem'>"+rs.getString("name")+"</h3>");
                out.print("<h4 style='padding-left: 1rem; padding-top: 0.2rem'>  &#x20b9; "+rs.getString("price")+"</h4>");
                out.print("<h6 style='padding-left: 1rem; padding-top: 0.2rem'>Quantity: "+rs.getString("quantity")+"</h6>");
                out.print("<h6 style='padding-left: 1rem; padding-top: 0.2rem'>"+rs.getString("description")+"</h6>");
                
                out.print("<br><div class='btn-group'>");
                out.print("<p><a class='btn btn-secondary 'href='updateProduct.jsp?p_id="+rs.getInt("p_id")+"&p_name="+rs.getString("name")+"&p_description="+rs.getString("description")+"&p_price="+rs.getInt("price")+"&p_quantity="+rs.getString("quantity")+"' class='card-link'>Update Product</a></p>&nbsp&nbsp&nbsp");
                out.print("<p><a class='btn btn-danger 'href='deleteData.jsp?p_id="+rs.getInt("p_id")+"' class='card-link'>Delete Product</a></p>");
                 out.print("</div>");

                out.print("<div class='card-body'>");
            
                out.print("</div>");
                out.print("</div>");
            }
            out.print("</div>");
                
        %>
        
        <c:set var="date" value="18-04-2022" />  
  
        <fmt:parseDate value="${date}" var="parsedDate"  pattern="dd-MM-yyyy" />  
        <p style='margin-left: 4rem; margin-top:1rem;'><c:out value="${parsedDate}" /></p>
            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
