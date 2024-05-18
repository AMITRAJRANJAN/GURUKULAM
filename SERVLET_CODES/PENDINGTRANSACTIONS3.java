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

public class PENDINGTRANSACTIONS3 extends HttpServlet 
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
         int monthnumber = Integer.parseInt(session.getAttribute("MONTHNUMBER").toString());
         int numberoffeeentries=Integer.parseInt(session.getAttribute("NUMBEROFENTRIES").toString());
         int[] admissionnumber=new int[numberoffeeentries];
         String[] paid=new String[numberoffeeentries];

         for(int i=0;i<numberoffeeentries;i++)
         {
             admissionnumber[i]=Integer.parseInt(session.getAttribute("ADMISSIONNUMBER"+(i+1)).toString());
             System.out.println("AdmissionNumber"+admissionnumber[i]);
             paid[i]=request.getParameter(String.valueOf(admissionnumber[i]));
             System.out.println("Paid:"+paid[i]);
         }
         try
        {
            Statement st=Db.databaseconnection();
            for(int i=0;i<numberoffeeentries;i++)
            {
                System.out.println("Month Number:"+monthnumber);
                System.out.println("AdmissionNumber :"+admissionnumber[i]+"\t Paid :"+paid[i]);
                    //ResultSet rs=st.executeQuery("Select * from Class"+clas+"Students where AdmissionNumber="+admissionnumber[i]);
                    //rs.next();
                    //int totalattendance=rs.getInt("Attendance");
                    //int totalclasses=rs.getInt("TotalClasses");
                    if(paid[i].equals("Paid"))
                    {
                        st.executeUpdate("Update fee_installment"+monthnumber+" set FeeStatus='Paid' where AdmissionNumber="+admissionnumber[i]);            
                    }
                    else
                    {
                        st.executeUpdate("Update fee_installment"+monthnumber+" set FeeStatus='Pending' where AdmissionNumber="+admissionnumber[i]);            

                    }
             
            }
            
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
         RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
         RD.include(request, response);
         RequestDispatcher RD2=request.getRequestDispatcher("PENDINGTRANSACTIONS2.jsp");
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
