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

public class SEARCHSTUDENTS extends HttpServlet 
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
         String clas=request.getParameter("CLASS");
         String admissionnumber=request.getParameter("ADMISSIONNUMBER");
         String S="";   
         System.out.println("Admissionnnumber:"+admissionnumber);
         System.out.println("Class:"+clas);
         if(admissionnumber!="")
         {
             System.out.println("admissionnumber"+admissionnumber);
             S="A";
             session.setAttribute("S", S);
         }
         else if(clas!="")
         {
             System.out.println("class"+clas);
             S="C";
             session.setAttribute("S", S);
         }
         
         try
        {
            Statement st=Db.databaseconnection();
            switch(S)
            {
                case "A":
                    ResultSet rs=st.executeQuery("Select * from student inner join studentmobile on student.AdmissionNumber=studentmobile.AdmissionNumber inner join studentaddress on student.AdmissionNumber=studentaddress.Admissionnumber where student.AdmissionNumber="+Integer.parseInt(admissionnumber));
                    Boolean record=rs.next();
                    
                   
                    if(record==true)
                    {

                        session.setAttribute("STUDENTNAME",rs.getString("Name"));
                        session.setAttribute("ADMISSIONNUMBER", rs.getInt("AdmissionNumber"));
                        //session.setAttribute("CURRENTCLASS",rs.getString("CurrentClass"));
                        session.setAttribute("ADMITTEDCLASS", rs.getInt("AdmittedClass"));
                        //session.setAttribute("ADMISSIONFEE", rs.getInt("AdmissionFee"));
                        session.setAttribute("FATHERNAME",rs.getString("FatherName"));
                        session.setAttribute("MOTHERNAME",rs.getString("MotherName"));
                        session.setAttribute("MOBILE", rs.getString("Mobile"));
                        session.setAttribute("ADDRESS",rs.getString("Address"));
                        //session.setAttribute("EMAIL",rs.getString("Email"));
                           
                               
                        RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                        RD.include(request, response);
                        RequestDispatcher RD2=request.getRequestDispatcher("STUDENTINFO.jsp");
                        RD2.include(request, response);
                    }
                    else
                    {
                        session.setAttribute("MESSAGE","No data found");
                    }
                    break;
                    
                    case "C":
                    ResultSet rs5=st.executeQuery("Select * from Class"+clas+"students");
                    Boolean record5=rs5.next();
                    if(record5==true)
                    {
                        int count=0;
                        while(record5)
                        {
                            count=count+1;
                            session.setAttribute("NAME"+count, rs5.getString("StudentName"));
                            session.setAttribute("ADMISSIONNUMBER"+count, rs5.getString("AdmissionNumber"));
                            record5=rs5.next();
                        }
                        session.setAttribute("COUNT", count);
                        RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                        RD.include(request, response);
                        RequestDispatcher RD2=request.getRequestDispatcher("STUDENTINFO.jsp");
                        RD2.include(request, response);
                    }   
                    else
                    {
                        session.setAttribute("MESSAGE","No data found");
                    }
                    break;
            }
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
