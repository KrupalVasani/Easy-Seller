<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel | Easy Seller</title>
    </head>
    
        
        <%          
            response.sendRedirect("listProducts.jsp");
          /*   String username = (String)session.getAttribute("username");
             String fullname="";
             String mobile="";
             if(username==null || username==""){
                 response.sendRedirect("index.html");
             }
             Cookie ck[]=request.getCookies();
             for(int i=0;i<ck.length;i++)
             {
                if(ck[i].getName().equals("fullname"))
                {
                    fullname=new String(ck[i].getValue())+",";
            }
            else if(ck[i].getName().equals("mobile"))
            {
                    mobile= new String(ck[i].getValue());
            }
            
            }   */
          //   out.print("<h1 style='margin-left: 4rem; margin-top:5rem;'>"+fullname+"Welcome to Book Store </h1>");
        %>
       
        
         <%@ taglib uri="WEB-INF/mytags.tld" prefix="m" %>  
         <h6 style='margin-left: 4rem; margin-top:2rem;'> Last Login Time: <m:today/> </h6>
          
         
        <div class="row w-100">
            
            <a href="addProduct.html" class="col card shadow bg-body rounded" style="width: 30rem; height: 30rem; padding: 3rem; margin: 5rem; text-decoration: none; color:black;">
                <img src="add.png" style="width: 12rem; height: 12rem; margin: auto; margin-top: 0rem;" class="card-img-top" alt="add Product image">
                <h1 style="margin: auto;">Add Product</h1>
            </a>
             <a href="listProducts.jsp" class="col card shadow bg-body rounded" style="width: 30rem; height: 30rem; padding: 3rem; margin: 5rem; text-decoration: none; color:black;">
                <img src="searching.png" style="width: 12rem; height: 12rem; margin: auto; margin-top: 0rem;" class="card-img-top" alt="">
                <h1 style="margin: auto;">Explore Products</h1>
            </a>
            <a href="myProducts.jsp" class="col card shadow bg-body rounded" style="width: 30rem; height: 30rem; padding: 3rem; margin: 5rem; text-decoration: none; color:black;">
                <img src="searching.png" style="width: 12rem; height: 12rem; margin: auto; margin-top: 0rem;" class="card-img-top" alt="">
                <h1 style="margin: auto;">My Products</h1>
            </a>
             <a href="viewCart.jsp" class="col card shadow bg-body rounded" style="width: 30rem; height: 30rem; padding: 3rem; margin: 5rem; text-decoration: none; color:black;">
                <img src="searching.png" style="width: 12rem; height: 12rem; margin: auto; margin-top: 0rem;" class="card-img-top" alt="">
                <h1 style="margin: auto;">View Cart</h1>
            </a>
            
            <a href="logout.jsp" class="col card shadow bg-body rounded" style="width: 30rem; height: 30rem; padding: 3rem; margin: 5rem; text-decoration: none; color:black;">
                <img src="exit.png" style="width: 12rem; height: 12rem; margin: auto; margin-top: 0rem;" class="card-img-top" alt="">
                <h1 style="margin: auto;">Logout</h1>
            </a>
        </div>
        
        
        
        <script type="text/javascript">
            
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        
        
    </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
</html>
,