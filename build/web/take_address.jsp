<%-- 
    Document   : take_address.jsp
    Created on : 10-May-2022, 11:23:21 pm
    Author     : ABCD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
       
    </head>
    <body>
         <form class="card shadow bg-body rounded" style="width: 40rem; padding: 3rem; margin: auto; margin-top: 7rem" action="upload_address.jsp" enctype="multipart/form-data" >
            <h2>Enter your Shipping Address</h2>
            <table style="margin-top: 2rem;">
                <tr><td class="pt-4"><h5>Full Name: </h5></td><td><input class="form-control" type="text" name="ad1" required/></td></tr>
                <tr><td class="pt-4"><h5>Phone Number: </h5></td><td><input class="form-control" type="text" name="ad2" required/></td></tr>
                <tr><td class="pt-4"><h5>Pin-code: </h5></td><td><input class="form-control" type="text" name="ad3" required/></td></tr>
                <tr><td class="pt-4"><h5>State: </h5></td><td><input class="form-control" type="text" name="ad4" required/></td></tr>
                <tr><td class="pt-4"><h5>City/Village: </h5></td><td><input class="form-control" type="text" name="ad5" required/></td></tr>
                <tr><td class="pt-4"><h5>House no. Building Name: </h5></td><td><input class="form-control" type="text" name="ad6" required/></td></tr>
   
                <tr><td></td><td><input class="btn btn-dark w-100 mt-4" type="submit" value="Add Address Details and Continue"/></td></tr>
            </table>
        </form>
    </body>
</html>
