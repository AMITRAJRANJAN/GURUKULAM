package FRONT;

import Back.Database;
import java.awt.Component;
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
import javax.swing.JOptionPane;

public class NEWTEACHERAPPLICATIONSUBMISSION extends HttpServlet 
{
    Database Db=new Database();
    String dateformatting(String date)
    {
        String dd=date.substring(0, 1);
        String mm=date.substring(3, 4);
        String yyyy=date.substring(6,9);
        String dateformatted=yyyy+"-"+mm+"-"+dd;
        return dateformatted; 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         String applicationnumber=request.getParameter("APPLICATIONNUMBER");
         String teachername=request.getParameter("TEACHERNAME");
         String dob=dateformatting(request.getParameter("DOB"));
         String subjectname=request.getParameter("SUBJECTNAME");
         String teachingsection=request.getParameter("TEACHINGSECTION");
         String address1=request.getParameter("ADDRESS1");
         String address2="abc";
         String mobile=request.getParameter("MOBILE");
         String emailid=request.getParameter("EMAILID");
         String doj=dateformatting(request.getParameter("DOJ"));
        
         try
        {
            Statement st=Db.databaseconnection();
            System.out.println("TESTING START");
/*
            st.executeUpdate("insert into teacher(ApplicationNumber,Name,DOB,Subject,Wing,DOJ) values('"+applicationnumber+"','"+teachername+"','"+dob+"','"+subjectname+"','"+teachingsection+"','"+doj+"')");
            System.out.println("teacher Success");
            st.executeUpdate("insert into teachermobile(ApplicationNumber,Mobile) values('"+applicationnumber+"','"+mobile+"')");
            System.out.println("teachermobile Success");
            st.executeUpdate("insert into teacheremail(ApplicationNumber,Email) values('"+applicationnumber+"','"+emailid+"')");
            System.out.println("teacheremail Success");
            st.executeUpdate("insert into teacheraddress(ApplicationNumber,Address) values('"+applicationnumber+"','"+address1+"')");
            System.out.println("teacheraddress Success");
            st.executeUpdate("Insert into USER(UserName,Password,Name,Profile,Status) values('" + applicationnumber + "','" + applicationnumber + "','" + teachername + "','TEACHER','1')");
            System.out.println("USER Success");*/
            st.executeUpdate("Insert into "+teachingsection+"wingteacher(ApplicationNumber,Name) values("+applicationnumber+",'"+teachername+"')");
            System.out.println(teachingsection+"wingteacher Success");

            JOptionPane.showMessageDialog(null, "Application Number for new teacher is :"+applicationnumber);
            
            RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
            RD.include(request, response);
            RequestDispatcher RD2=request.getRequestDispatcher("TEACHERAPPLICATIONFORM.jsp");
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
