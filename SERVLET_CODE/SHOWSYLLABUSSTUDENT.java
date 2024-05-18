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

public class SHOWSYLLABUSSTUDENT extends HttpServlet 
{
    Database Db=new Database();
    int clas;
    String subjects="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         HttpSession session=request.getSession();
         int admissionnumber=Integer.parseInt(session.getAttribute("USERNAME").toString());
         try
         {
            Statement st=Db.databaseconnection();
             ResultSet rs=st.executeQuery("Select * from Student where AdmissionNumber="+admissionnumber);
            Boolean record=rs.next();
            int clas=0;
            if(record==true)
            {
                       clas=rs.getInt("CurrentClass");
                       session.setAttribute("CLASS", clas);
            }
         }
         catch(Exception e)
         {
             
         }
           RequestDispatcher RD=request.getRequestDispatcher("STUDENTPANEL.jsp");
           RD.include(request, response);
           RequestDispatcher RD2=request.getRequestDispatcher("SHOWSYLLABUSSTUDENT.jsp");
           RD2.include(request, response);
         }
        
                 
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
