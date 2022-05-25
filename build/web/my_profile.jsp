<%-- 
    Document   : my_profile.jsp
    Created on : 11-May-2022, 1:43:34 am
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
    </head>
    <body>
        
<%@ include file="navbar.html" %> 
        <%!
         ResultSet rs ;
        int p_id;
        String name,email,contact,address;
     //   String base64DataString;
        %>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
            int u_id=Integer.parseInt(session.getAttribute("u_id").toString());
             PreparedStatement ps = con.prepareStatement("Select * from users where u_id="+u_id);
            
          rs = ps.executeQuery();
            if(rs.next())
            {
            try
         {
          p_id=rs.getInt("u_id");
             name=rs.getString("name");
            contact=rs.getString("contact");
             email=rs.getString("email");
             address=rs.getString("address");
        }catch(Exception e){}
        }
        else
        {
        }
            %>
            
             <form class="card shadow bg-body rounded" style="width: 40rem; padding: 3rem; margin: auto; margin-top: 7rem" action="updateData.jsp">
            <h1 class='rounded mx-auto d-block'> User Profile</h1><br>
            <table style="margin-top: 2rem;">
                <input class="form-control" type="hidden" name="p_id" value="${p_id}" required/>
                <!--<img src="avatar.png"  height='200' width='200'alt="Avatar" class="avatar rounded mx-auto d-block">-->
                
                <%
                byte[] imgData = rs.getBytes("profile_photo"); // blob field
                byte[] encodeBase64 = Base64.encodeBase64(imgData);
                 String base64DataString = new String(encodeBase64 , "UTF-8");
                out.print("<img src='data:image/jpg;base64,"+base64DataString+"' style='width: 8rem; height: 10rem; margin: auto; margin-top: 0rem;' class='card-img-top'>");
                %>
                
                <tr><td class="pt-4"><h5>Name: </h5></td><td><input class="form-control" type="text" name="p_name" value="<%=name%>" required/></td></tr>
                <tr><td class="pt-4"><h5>Price: </h5></td><td><input class="form-control" type="text" name="p_price" value="<%=contact%>" required/></td></tr>
                <tr><td class="pt-4"><h5>Stock: </h5></td><td><input class="form-control" type="text" name="p_quantity" value="<%=email%>" required/></td></tr>           
                <tr><td class="pt-4"><h5>Description: </h5></td><td><textarea class="form-control" rows="3" name="p_description"><%=address%></textarea></td></tr>
                <!--<tr><td></td><td><input class="btn btn-dark w-100 mt-4" type="submit" value="Update Details"/></td></tr>-->
            </table>
        </form>
    </body>
</html>
