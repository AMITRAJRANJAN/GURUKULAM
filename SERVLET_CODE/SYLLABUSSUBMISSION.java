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

public class SYLLABUSSUBMISSION extends HttpServlet 
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
         int subjectcount=Integer.parseInt(session.getAttribute("SUBJECTCOUNT").toString());
         String[] subject=new String[subjectcount];
         for(int i=0;i<subjectcount;i++)
         {
             subject[i]=session.getAttribute("SUBJECT"+(i+1)).toString();
         }
       
         try
        {
            Statement st=Db.databaseconnection();
            for(int i=0;i<subjectcount;i++)
            {
                String syllabus=request.getParameter(subject[i]);
                 String[] topics=syllabus.split(",");
                 for(int j=0;j<topics.length;j++)
                 {
                     st.executeUpdate("Insert into "+subject[i]+"_syllabus (Topic,Class"+clas+") values('"+topics[j]+"',1)");
                 }
            }
            RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
            RD.include(request, response);
            RequestDispatcher RD2=request.getRequestDispatcher("ACADEMICS.jsp");
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
