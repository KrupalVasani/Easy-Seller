<%-- 
    Document   : print_bill.jsp
    Created on : 11-May-2022, 8:47:41 am
    Author     : ABCD
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Page</title>
    </head>
    <body>
        
        <%

try
{
	Document document=new Document();
	PdfWriter.getInstance(document,new FileOutputStream("E:/easy_seller_xxxxxx.pdf"));

	document.open();

        
        Font regular = new Font(FontFamily.HELVETICA, 14);
        Font bold =  new Font(FontFamily.HELVETICA, 16, Font.BOLD);
        Paragraph p = new Paragraph("Easy Seller\n",bold);

        String datee="Date: "+LocalDate.now().toString();
        Paragraph date=new Paragraph(datee);
        
        String p_body=session.getAttribute("address").toString();
        p_body=new String("\n\nShipping address:\n"+p_body);
        Paragraph email1=new Paragraph("Email: "+session.getAttribute("email").toString());
        
        
        Paragraph pbody = new Paragraph(p_body);
	document.add(p);
        document.add(date);
        document.add(email1);
        document.add(pbody);
	document.close();
        response.sendRedirect("confirm_order.jsp");
}
catch(  DocumentException | FileNotFoundException e)
{
}
        %>
    </body>
</html>
