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

public class NEWTEACHERREGISTRATION1 extends HttpServlet 
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
         int ledgernumber=Integer.parseInt(request.getParameter("LEDGERNUMBER"));
         String emailid=request.getParameter("EMAILID");
         try
        {
            Statement st=Db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from teacher where LedgerNumber="+ledgernumber+" AND Email='"+emailid+"'");
            Boolean record=rs.next();
            if(record==true)
            {
                HttpSession session=request.getSession();
                session.setAttribute("LEDGERNUMBER",ledgernumber);
                session.setAttribute("EMAILID",emailid);
                session.setAttribute("NAME",rs.getString("TeacherName"));
                response.sendRedirect("NEWTEACHERREGISTRATION2.jsp");
            }
            else
            {
                response.sendRedirect("HOME.jsp");
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
