
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
            

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");
            PrintWriter out = response.getWriter();
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");

            PreparedStatement ps = con.prepareStatement("Select * from users where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                int u_id=rs.getInt("u_id");
               // out.print("user id : "+uid);
                
                HttpSession session = request.getSession();
                session.setAttribute("u_id", u_id);
                session.setAttribute("email", email);
                session.setAttribute("name", name);
                
                response.sendRedirect("home.jsp");
          
            }else{
                RequestDispatcher rd=request.getRequestDispatcher("invalid_user.html");
                rd.forward(request,response);
               //response.sendRedirect("index.html");
               
            }
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e){System.out.print(e);}
    }
}

    
