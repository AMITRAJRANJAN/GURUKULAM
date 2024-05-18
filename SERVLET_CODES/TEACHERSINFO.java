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

public class TEACHERSINFO extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         HttpSession session=request.getSession();
         int applicationnumber=Integer.parseInt(request.getParameter("APPLICATIONNUMBER"));
         System.out.println(applicationnumber);
         try
        {
            Statement st=Db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from Teacher inner join TeacherMobile on Teacher.ApplicationNumber=TeacherMobile.ApplicationNumber inner join TeacherAddress on Teacher.ApplicationNumber=TeacherAddress.ApplicationNumber inner join TeacherEmail on Teacher.ApplicationNumber=TeacherEmail.ApplicationNumber  where Teacher.ApplicationNumber="+applicationnumber);
            Boolean record=rs.next();
            if(record)
            {
                session.setAttribute("TEACHERNAME", rs.getString("Name"));
                session.setAttribute("APPLICATIONNUMBER",rs.getInt("ApplicationNumber"));
                session.setAttribute("SUBJECT",rs.getString("Subject"));
                session.setAttribute("ADDRESS",rs.getString("Address"));
               session.setAttribute("MOBILE",rs.getString("Mobile"));
               session.setAttribute("EMAIL",rs.getString("Email"));

                RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                RD.include(request, response);
                RequestDispatcher RD2=request.getRequestDispatcher("TEACHERSINFO.jsp");
                RD2.include(request, response);
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
         
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
