package FRONT;

import Back.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NEWTEACHERREGISTRATION2 extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        PrintWriter PW=response.getWriter();
        
         int ledgernumber=Integer.parseInt(request.getParameter("LEDGERNUMBER"));
         String emailid=request.getParameter("EMAILID");
         
         String name=request.getParameter("NAME");
         String password=request.getParameter("PASSWORD");
         String confirmpassword=request.getParameter("CONFIRMPASSWORD");
         
         if(password.equals(confirmpassword))
         {
             try
            {
                Statement st=Db.databaseconnection();
                st.executeUpdate("Insert into teacher_login values("+ledgernumber+",'"+name+"','"+emailid+"','"+password+"')");
                response.sendRedirect("NEWTEACHERREGISTRATION1.jsp");
            }
             catch(Exception e)
            {
                System.out.println("Exception :"+e);
            }
        }
         else
         {
             response.sendRedirect("NEWTEACHERREGISTRATION1.jsp");
        
         }
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
