

import java.sql.*;

public class MysqlDemo {
    public static boolean validate(String id,String pass){  
        boolean status=false;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstorejava","root","");  

            PreparedStatement ps=con.prepareStatement("select * from admin where adminId=? and password=?");  
            ps.setString(1,id);  
            ps.setString(2,pass);  

            ResultSet rs=ps.executeQuery();  
            status=rs.next();  
            
        }catch(Exception e){System.out.println(e);}  
        return status;  
    }  
}


