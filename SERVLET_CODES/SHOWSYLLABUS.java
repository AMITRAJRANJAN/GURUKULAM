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

public class SHOWSYLLABUS extends HttpServlet 
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
         int clas=Integer.parseInt(session.getAttribute("CLASS").toString());
         String subjects="";
         
        try
       {
           Statement st=Db.databaseconnection();
           ResultSet rs=st.executeQuery("Select * from class"+clas+"_subject where status=1");
           Boolean record=rs.next();
           while(record)
           {
               subjects=subjects+rs.getString("Subject")+"-";
               record=rs.next();
           }
           session.setAttribute("SUBJECTS",subjects);
           RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
           RD.include(request, response);
           RequestDispatcher RD2=request.getRequestDispatcher("SHOWSYLLABUS.jsp");
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
