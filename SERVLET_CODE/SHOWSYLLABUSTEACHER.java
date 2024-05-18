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

public class SHOWSYLLABUSTEACHER extends HttpServlet 
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
         String name=session.getAttribute("NAME").toString();
         int ledgernumber=Integer.parseInt(session.getAttribute("LEDGERNUMBER").toString());
           
         try
         {
             Statement st=Db.databaseconnection();
             ResultSet rs=st.executeQuery("Select Class from class where ClassTeacherName='"+name+"' AND ClassTeacherLedgerNumber="+ledgernumber);
             Boolean record=rs.next();
             if(record==true)
            {
                clas=rs.getInt("Class");
                session.setAttribute("CLASS",clas);
            }
           //Statement st=Db.databaseconnection();
           Statement st2=Db.databaseconnection();
           ResultSet rs2=st2.executeQuery("Select * from class"+clas+"_subject where status=1");
           Boolean record2=rs2.next();
           while(record2)
           {
               subjects=subjects+rs2.getString("Subject")+"-";
               record2=rs2.next();
           }
           session.setAttribute("SUBJECTS",subjects);
           RequestDispatcher RD=request.getRequestDispatcher("TEACHERPANEL.jsp");
           RD.include(request, response);
           RequestDispatcher RD2=request.getRequestDispatcher("SHOWSYLLABUSTEACHER.jsp");
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
