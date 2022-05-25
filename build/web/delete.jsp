
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
        <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/bookstorejava" user="root" password="" />
        
        <c:set var="bookId" value="${param.bookid}" scope="session"/>
        
        <sql:query dataSource="${db}" var="rs">
            select * from books where bookId=?
            <sql:param value="${bookId}"/>
        </sql:query>
            <table border="2px">
                <tr>
                    <th>BookName</th>
                    <th>BookAuthor</th>
                    <th>BookPrice</th>
                    <th>BookStock</th>    
                    <th>BookImage</th>
                    <th>BookDescription</th>
                </tr>
                <tr>
                    <form action="deleteData.jsp">
                        <input type='hidden' name='bookid' value="${bookId}"/> 
                            <c:forEach var="table" items="${rs.rows}">
                                <td>${table.bookName}</td>
                                <td>${table.bookAuthor}</td>
                                <td>${table.bookPrice}</td>
                                <td>${table.bookStock}</td>
                                <td>${table.bookImage}</td>
                                <td>${table.bookDescription}</td>
                                <td><input type="submit" value="Delete Data"/></td>
                            </c:forEach>
                    </form>
                </tr>
            </table>
    </body>
</html>
