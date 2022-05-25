
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/easy_seller" user="root" password="" />
               
        <sql:update dataSource="${db}" var="count">
            DELETE FROM products WHERE p_id=?
            <sql:param value="${param.p_id}"/>
            
        </sql:update>
        <% response.sendRedirect("myProducts.jsp");   %>    
    </body>
</html>
