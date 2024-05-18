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
import javax.swing.JOptionPane;

public class ADMISSIONFORMSUBMISSION extends HttpServlet
{

    Database Db = new Database();
    String dateformatting(String date)
    {
        String dd=date.substring(0, 1);
        String mm=date.substring(3, 4);
        String yyyy=date.substring(6,9);
        String dateformatted=yyyy+"-"+mm+"-"+dd;
        return dateformatted; 
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter PW = response.getWriter();
          
        int admissionnumber = Integer.parseInt(request.getParameter("ADMISSIONNUMBER"));
        String studentname = request.getParameter("STUDENTNAME");
        int admittedclas = Integer.parseInt(request.getParameter("ADMITTEDCLASS"));
        String fathername = request.getParameter("FATHERNAME");
        String mothername = request.getParameter("MOTHERNAME");
        String address = request.getParameter("ADDRESS");
        String address2 = "abcd";
        String mobile = request.getParameter("MOBILE");
        String emailid = request.getParameter("EMAILID");
        int admissionfee = Integer.parseInt(request.getParameter("ADMISSIONFEE"));
        String dob=dateformatting(request.getParameter("DOB"));
        String doa=dateformatting(request.getParameter("DOA"));
        try
        {
            Statement st = Db.databaseconnection();
            //ResultSet rs=st.executeQuery("Select * from Student");
            //rs.last();
            //Statement st = Db.databaseconnection();
            st.executeUpdate("Insert into STUDENT(AdmissionNumber,Name,AdmittedClass,FatherName,MotherName,DOB,DOA) values('" + admissionnumber + "','" + studentname + "'," + admittedclas + ",'" + fathername + "','" + mothername + "','"+dob+"','"+doa+"')");
            System.out.println("STUDENT pass");
            
            st.executeUpdate("Insert into STUDENTMOBILE(AdmissionNumber,Mobile) values('" + admissionnumber + "','" + mobile + "')");
            System.out.println("STUDENTMOBILE pass");

            st.executeUpdate("Insert into STUDENTADDRESS(AdmissionNumber,Address) values('" + admissionnumber + "','" + address + "')");
            System.out.println("STUDENTADDRESS pass");

            st.executeUpdate("Insert into ADMISSIONFEE(AdmissionNumber,AdmissionFee) values('" + admissionnumber + "'," + admissionfee + ")");
            System.out.println("ADMISSIONFEE pass");

            st.executeUpdate("Insert into USER(UserName,Password,Name,Profile,Status) values('" + admissionnumber + "','" + admissionnumber + "','" + studentname + "','STUDENT','1')");
            System.out.println("USER pass");

            st.executeUpdate("Insert into Class"+admittedclas+"Students(AdmissionNumber,StudentName) values('" + admissionnumber + "','" + studentname + "')");
            System.out.println("Class_Students pass");

            //ResultSet rs2 = st.executeQuery("Select LedgerNumber from student where AdmissionFormNumber=" + admissionnumber);
            //Boolean record = rs2.next();
            //int ledgernumber = rs2.getInt("LedgerNumber");
            //st.executeUpdate("Insert into STUDENT_ATTENDANCE(LedgerNumber) values(" + ledgernumber + ")");
            //JOptionPane.showMessageDialog(null,"Student admission success");
            
            
            RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
            RD.include(request, response);
            RequestDispatcher RD2 = request.getRequestDispatcher("ADMISSIONFORM.jsp");
            RD2.include(request, response);
        
        } 
        catch (Exception e) 
        {
            System.out.println("Exception :" + e);
        }
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
    }
    
    public String getServletInfo()
    {
        return "Short description";
    }
    
}
