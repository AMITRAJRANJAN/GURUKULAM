package FRONT;

import Back.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TEACHERLOGIN extends HttpServlet 
{
    Database Db=new Database();
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String username=request.getParameter("USERNAME");
        String password=request.getParameter("PASSWORD");
        
        try
        {
            Statement st=Db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from TEACHER_LOGIN where Username='"+username+"' AND Password='"+password+"'");
            Boolean record=rs.next();
            if(record==false)
            {
                response.sendRedirect("HOME.jsp");
            }
            else if(record==true)
            {
                HttpSession session=request.getSession();
                session.setAttribute("NAME", rs.getString("Name"));
                session.setAttribute("LEDGERNUMBER", rs.getInt("LedgerNumber"));
                session.setAttribute("USERNAME",username);
                response.sendRedirect("TEACHERPANEL.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
        
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
