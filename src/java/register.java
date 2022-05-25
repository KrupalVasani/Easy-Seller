
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

        try {
            
            ServletContext context=getServletContext();    
           String driverName=context.getInitParameter("drivername");  
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
   
        
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            String pincode = request.getParameter("pincode");
            
            InputStream inputStream=null;
            Part filePart = request.getPart("profile_photo");
            if (filePart != null) {
                inputStream  = filePart.getInputStream();
            }
            
            PreparedStatement ps = con.prepareStatement("Insert into users(name,email,password,contact,address,pincode,profile_photo) values(?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3, password);
            ps.setString(4,contact);
            ps.setString(5,address);
            ps.setString(6,pincode);
            ps.setBlob(7,inputStream);
            
            int count = ps.executeUpdate();
            if(count > 0){
               // Cookie name_ck=new Cookie("name",name);
                Cookie mobile_ck=new Cookie("mobile",contact);
               // response.addCookie(name_ck);
                response.addCookie(mobile_ck);
               
                //response.sendRedirect("index.html");
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
                
            else
               response.sendRedirect("register.html");
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e){
            out.print("There is something wrong");
            out.println(e+"");
}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
