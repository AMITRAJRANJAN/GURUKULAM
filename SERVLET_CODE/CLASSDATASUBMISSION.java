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

public class CLASSDATASUBMISSION extends HttpServlet 
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
         String classteachername=request.getParameter("CLASSTEACHER").substring(0, request.getParameter("CLASSTEACHER").indexOf("-"));
         String classteacherapplicationnumber=request.getParameter("CLASSTEACHER").substring(request.getParameter("CLASSTEACHER").indexOf("-")+1);
        
         try
        {
            Statement st=Db.databaseconnection();
                       System.out.println("Classteacher updation start");

            st.executeUpdate("Update classteacher set Name='"+classteachername+"', ApplicationNumber='"+classteacherapplicationnumber+"' where Class="+clas);
           System.out.println("Classteacher updation success");
            ResultSet rs=st.executeQuery("Select * from schoolsubject where Class"+clas+"=1");

            Boolean record=rs.next();
            while(record)
            {
                String subjectteachername=request.getParameter(rs.getString("Name")).substring(0,request.getParameter(rs.getString("Name")).indexOf("-"));
                String subjectteacherapplicationnumber=request.getParameter(rs.getString("Name")).substring(request.getParameter(rs.getString("Name")).indexOf("-")+1);
                           System.out.println("subjectteacher updation start");
                           System.out.println("subjectteachername :"+subjectteachername);
                           System.out.println("subjectteacherapplicationnumber :"+subjectteacherapplicationnumber);
                st.executeUpdate("Insert into Class"+clas+"subjects(SubjectCode,Subject,Teacher,ApplicationNumber) values("+rs.getInt("Code")+",'"+rs.getString("Name")+"','"+subjectteachername+"',"+subjectteacherapplicationnumber+")");
                           System.out.println("subjectteacher updation success");

                record=rs.next();
            }
            /*for(int i=1;i<=totalclasssubject;i++)
            {
                st.executeUpdate("Update class"+clas+"_subject set Status=1 where Subject='"+classsubject[i-1]+"'");
            }*/
            RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
            RD.include(request, response);
            
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
