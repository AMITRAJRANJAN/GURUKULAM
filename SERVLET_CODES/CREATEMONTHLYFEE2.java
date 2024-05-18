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

public class CREATEMONTHLYFEE2 extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         processRequest(request, response);
         PrintWriter PW=response.getWriter();
         
         
         String month=request.getParameter("MONTH");
         int monthnumber=Integer.parseInt(month.substring(0,2));
         String monthname=month.substring(2);
         int clas=Integer.parseInt(request.getParameter("CLASS"));
         int feeamount=Integer.parseInt(request.getParameter("FEEAMOUNT"));
         int countstudents=0;
         
         try
        {
            Statement st=Db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from Class"+clas+"Students");
            Boolean record=rs.next();
            if(record==true)
            {
                while(record)
                {
                    countstudents=countstudents+1;
                    record=rs.next();
                }
            }
            else
            {
                
            }
            rs.beforeFirst();
            rs.next();
            int[] admissionnumber=new int[countstudents];
            for(int i=0;i<countstudents;i++)
            {
                admissionnumber[i]=rs.getInt("AdmissionNumber");
                if(i==countstudents-1)
                {
                    break;
                }
                else
                {
                    rs.next();
                }
            }
            for(int i=0;i<countstudents;i++)
            {
                st.executeUpdate("Insert into Feeinstallment"+monthnumber+"(FeeId,AdmissionNumber,Month,Amount,Status) values("+(monthnumber+admissionnumber[i])+","+admissionnumber[i]+",'"+monthname+"',"+feeamount+",'Not Paid')");
                System.out.println("hello");
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
         
         RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
         RD.include(request, response);
         RequestDispatcher RD2=request.getRequestDispatcher("CREATEMONTHLYFEE.jsp");
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
