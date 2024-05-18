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

public class UPDATESYLLABUS extends HttpServlet
{

    Database Db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");

    }

    int subjectcode(String subject)
    {
        int code=0;
        int l=subject.length();
        code=Integer.parseInt(subject.substring((l-2)));
        return code;
    }
    String subjectname(String subject)
    {
        String name="";
        int l=subject.length();
        name=subject.substring(0, (l-2));
        return name;
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        processRequest(request, response);
        PrintWriter PW = response.getWriter();
        HttpSession session = request.getSession();
        int clas=Integer.parseInt(session.getAttribute("CLASS").toString());
        String subject=request.getParameter("SUBJECT");
        String topic=request.getParameter("TOPIC");
        
        int subjectcode=subjectcode(subject);
        String subjectname=subjectname(subject);
        System.out.println("Class"+clas);
        System.out.println("Topic"+topic);
        System.out.println("Subject"+subject);
        
        System.out.println("subject name :"+subjectname(subject));
        System.out.println("subject code :"+subjectcode(subject));
        
        try
        {
            Statement st=Db.databaseconnection();
            st.executeUpdate("Insert into "+subject+"(Topics,Class"+clas+") values('"+topic+"',1)");
            System.out.println("topic updated success");
             RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
             RD.include(request, response);
                    
             RequestDispatcher RD2 = request.getRequestDispatcher("SYLLABUS.jsp");
             RD2.include(request, response);
            
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
