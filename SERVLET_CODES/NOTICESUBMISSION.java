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

public class NOTICESUBMISSION extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         String notice=request.getParameter("NOTICE");
         String link=request.getParameter("LINK");
         try
        {
            Statement st=Db.databaseconnection();
            st.executeUpdate("Insert into NOTICEBOARD(Notice,Link) values('"+notice+"','"+link+"')");
            RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
            RD.include(request, response);
            RequestDispatcher RD2=request.getRequestDispatcher("NOTICEFORM.jsp");
            RD2.include(request, response);
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
