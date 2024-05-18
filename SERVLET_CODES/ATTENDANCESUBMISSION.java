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

public class ATTENDANCESUBMISSION extends HttpServlet 
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
         int numberofstudent=Integer.parseInt(session.getAttribute("NUMBEROFSTUDENT").toString());
         int[] admissionnumber=new int[numberofstudent];
         int[] attendance=new int[numberofstudent];
         System.out.println(numberofstudent);
         for(int i=0;i<numberofstudent;i++)
         {
             admissionnumber[i]=Integer.parseInt(session.getAttribute("ADMISSIONNUMBER"+(i+1)).toString());
             attendance[i]=Integer.parseInt(request.getParameter(String.valueOf(admissionnumber[i])));
         }
         try
        {
            Statement st=Db.databaseconnection();
            for(int i=0;i<numberofstudent;i++)
            {
                ResultSet rs=st.executeQuery("Select * from Class"+clas+"Students where AdmissionNumber="+admissionnumber[i]);
                    rs.next();
                    int totalattendance=rs.getInt("Attendance");
                    int totalclasses=rs.getInt("TotalClasses");
                    st.executeUpdate("Update Class"+clas+"Students set Attendance="+(totalattendance+attendance[i])+", TotalClasses="+(totalclasses+1)+" where AdmissionNumber="+admissionnumber[i]);            
             
            }
            
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
         RequestDispatcher RD=request.getRequestDispatcher("TEACHERPANEL.jsp");
         RD.include(request, response);
         RequestDispatcher RD2=request.getRequestDispatcher("CREATEATTENDANCEFORM.jsp");
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
