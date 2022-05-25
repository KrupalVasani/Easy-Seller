
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
        <title>List of Products</title>
        
        <style>* {
  padding: 0;
  margin: 0;
  font-family: 'IBM Plex Sans', sans-serif;
}
body{
    background: url();
}

.counter {
    width: 150px;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.counter input {
    width: 50px;
    border: 0;
    line-height: 30px;
    font-size: 20px;
    text-align: center;
    background: #0052cc;
    color: #fff;
    appearance: none;
    outline: 0;
}
.counter span {
    display: block;
    font-size: 25px;
    padding: 0 10px;
    cursor: pointer;
    color: #0052cc;
    user-select: none;
}
            </style>
            
            <script>
                
                function increaseCount(a, b) {
  var input = b.previousElementSibling;
  var value = parseInt(input.value, 10);
  value = isNaN(value) ? 0 : value;
  value++;
  input.value = value;
}

function decreaseCount(a, b) {
  var input = b.nextElementSibling;
  var value = parseInt(input.value, 10);
  if (value > 1) {
    value = isNaN(value) ? 0 : value;
    value--;
    input.value = value;
  }
}
                </script>
    </head>
    <body>
        
        
<%@ include file="navbar.html" %> 
        
        <%
          //  out.print("<a href='home.jsp' class='btn btn-dark previous' style='margin-top:5rem; margin-left:5rem;'>&laquo; Home</a>");
            out.print("<h1 style='padding-top: 1rem; padding-left:5rem;'>Product List </h1>");
            out.print("<div class='row w-100' style='padding-top: 2rem; padding-left:5rem;'>");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
            Statement s = con.createStatement();
            int u_id;
            if(session.getAttribute("u_id")==null){u_id=3;}
            else{u_id=Integer.parseInt(session.getAttribute("u_id").toString());}
            ResultSet rs = s.executeQuery("SELECT * from products where u_id <> "+u_id);
            
            while(rs.next()){
                
                //managing image
                byte[] imgData = rs.getBytes("image"); // blob field
                byte[] encodeBase64 = Base64.encodeBase64(imgData);
                String base64DataString = new String(encodeBase64 , "UTF-8");
                
                out.print("<div class='col-auto card shadow bg-body rounded' style='width: 18rem; height: auto; padding: 1rem; margin: 0.7rem;'>");
                out.print("<img src='data:image/jpg;base64,"+base64DataString+"' style='width: 8rem; height: 10rem; margin: auto; margin-top: 0rem;' class='card-img-top'>");
                out.print("<h3 style='padding-left: 1rem; padding-top: 1rem'>"+rs.getString("name")+"</h3>");
                out.print("<h4 style='padding-left: 1rem; padding-top: 0.2rem'>  &#x20b9; "+rs.getString("price")+"</h4>");
                out.print("<h6 style='padding-left: 1rem; padding-top: 0.2rem'>Quantity: "+rs.getString("quantity")+"</h6>");
                out.print("<h6 style='padding-left: 1rem; padding-top: 0.2rem'>"+rs.getString("description")+"</h6>");
                
                
                out.print("<form action='add_to_cart.jsp'>"
                + "<input hidden type='text' name='u_id' value='"+u_id+"'>"
                + "<input hidden type='text' name='p_id' value='"+rs.getInt("p_id")+"'>"
                + "<div class='counter' style='color:grey;'>"
                + "<span class='down' onClick='decreaseCount(event, this)'>-</span>"
                + "<input name='quantity'  type='text' value='1'>"
                + "<span class='up' onClick='increaseCount(event, this)'>+</span>"
                + "</div>"
                );
                
                out.print("<br><div class='btn-group'>"
                + "<p><a class='btn btn-success ' >Buy now</a></p>&nbsp&nbsp&nbsp"
                + "<p><input class='btn btn-secondary' type='submit' value='Add to Cart'/></p>"
                + "</div>");
                
                
                out.print("</form>");
                
                out.print("<div class='card-body'>");
            
                out.print("</div>");
                out.print("</div>");
            }
            out.print("</div>");
                
        %>
        
       
            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
