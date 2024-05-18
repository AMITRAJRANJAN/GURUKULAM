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

public class NEWSUBJECT extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         String subjectname=request.getParameter("SUBJECTNAME");
         String subjectcode=request.getParameter("SUBJECTCODE");
         String[] clas=new String[10];
         int[] clas2=new int[10];
         try
         {
             for(int i=1;i<=10;i++)
             {
                 clas[i-1]=request.getParameter(String.valueOf(i));
             }
             for(int i=1;i<=10;i++)
             {
                 System.out.println("Clas :"+clas[i-1]);
                 
                 if(clas[i-1]==null)
                 {
                     clas2[i-1]=0;
                 }
                 else
                 {
                     clas2[i-1]=1;
                 }
             }
             
                 try
                     {
                        Statement st=Db.databaseconnection();
                        st.executeUpdate("Insert into schoolsubject(Code,Name) values("+subjectcode+",'"+subjectname+"')");
                        
                        for(int i=1;i<=10;i++)
                        {
                            st.executeUpdate("Update schoolsubject set Class"+i+"="+clas2[i-1]+" where Code="+subjectcode);
                        }
                        
                        st.execute("Create table "+subjectname+subjectcode+"(Topics varchar(50),Class1 int,Class2 int,Class3 int,Class4 int,Class5 int,Class6 int,Class7 int,Class8 int,Class9 int,Class10 int)");
                        System.out.println("subject table Success");
                        
                     }
                     catch(Exception e)
                     {
                         System.out.println(e);
                     }
            
             
             
         }
         catch(Exception e)
         {
             System.out.println("Exception :"+e);
         }
         
/*
         try
         {
             Statement st=Db.databaseconnection();
             st.executeUpdate("Insert into schoolsubject(Code,Name) values("+subjectcode+",'"+subjectname+"')");
             for(int i=1;i<=10;i++)
             {
                   st.executeUpdate("Update schoolsubject set class"+i+"=0 where Code="+subjectcode);
             }
             for(int i=1;i<=10;i++)
             {
                st.executeUpdate("Insert into class"+i+"_subject(Subject,Status) values('"+subjectname+"',0)");
             }
             //st.execute("Create table "+subjectname+"_Syllabus (Topic varchar(50),Class1 int Default 0,Class2 int Default 0,Class3 int Default 0,Class4 int Default 0,Class5 int Default 0,Class6 int Default 0,Class7 int Default 0,Class8 int Default 0,Class9 int Default 0,Class10 int Default 0)");
             RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
             RD.include(request, response);
             RequestDispatcher RD2=request.getRequestDispatcher("SUBJECTS.jsp");
             RD2.include(request, response);
         }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
        */
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
