import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet(urlPatterns = {"/AddProduct"})
@MultipartConfig
public class AddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easy_seller","root","");

         //   String p_id = request.getParameter("p_id");
            String p_name = request.getParameter("p_name");
            String p_description = request.getParameter("p_description");
            String p_price = request.getParameter("p_price");
            String p_quantity = request.getParameter("p_quantity");
            
            HttpSession session=request.getSession();
            //we should get this from session so we have to set u_id as session attribute at the time of successfuly login
            int p_u_id=Integer.parseInt(session.getAttribute("u_id").toString());
            
            
            //taking image data
            InputStream inputStream=null;
            Part filePart = request.getPart("p_image");
            if (filePart != null) {
                inputStream  = filePart.getInputStream();
            }   

            PreparedStatement ps = con.prepareStatement("insert into products(name,description,quantity,price,image,u_id) values(?,?,?,?,?,?)");
            ps.setString(1, p_name);
            ps.setString(2, p_description);
            ps.setString(3, p_price);
            ps.setString(4, p_quantity);
            ps.setBlob(5, inputStream); 
            ps.setInt(6, p_u_id);

            int inserted = ps.executeUpdate();
            if(inserted > 0){
                response.sendRedirect("listProducts.jsp");
            }else{
                out.print("There is something wrong");
            }
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e){out.print(e);}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
