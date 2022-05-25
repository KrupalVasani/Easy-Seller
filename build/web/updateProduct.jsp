<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Page</title>
    </head>
    <body>
        
        <c:set var="p_id" value="${param.p_id}"/>
        <c:set var="p_name" value="${param.p_name}"/>
        <c:set var="p_description" value="${param.p_description}"/>
        <c:set var="p_price" value="${param.p_price}"/>
        <c:set var="p_quantity" value="${param.p_quantity}"/>
        

        <form class="card shadow bg-body rounded" style="width: 40rem; padding: 3rem; margin: auto; margin-top: 7rem" action="updateData.jsp">
            <h1>Update Product Details !</h1>
            <table style="margin-top: 2rem;">
                <input class="form-control" type="hidden" name="p_id" value="${p_id}" required/>
                <tr><td class="pt-4"><h5>Name: </h5></td><td><input class="form-control" type="text" name="p_name" value="${p_name}" required/></td></tr>
                <tr><td class="pt-4"><h5>Price: </h5></td><td><input class="form-control" type="text" name="p_price" value="${p_price}" required/></td></tr>
                <tr><td class="pt-4"><h5>Stock: </h5></td><td><input class="form-control" type="text" name="p_quantity" value="${p_quantity}" required/></td></tr>           
                <tr><td class="pt-4"><h5>Description: </h5></td><td><textarea class="form-control" rows="3" name="p_description">${p_description}</textarea></td></tr>
                <tr><td></td><td><input class="btn btn-dark w-100 mt-4" type="submit" value="Update Details"/></td></tr>
            </table>
        </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
