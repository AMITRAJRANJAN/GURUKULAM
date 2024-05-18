package FRONT;

import Back.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LOGIN extends HttpServlet 
{
        Database Db=new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String username=request.getParameter("USERNAME");
        String password=request.getParameter("PASSWORD");
        try
        {
            Statement st=Db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from USER where Username='"+username+"' AND Password='"+password+"'");
            Boolean record=rs.next();
            if(record==false)
            {
                response.sendRedirect("HOME.jsp");
            }
            else if(record==true)
            {
                int status=rs.getInt("Status");
                if(status==1)
                {
                    String profile=rs.getString("Profile");
                    HttpSession session=request.getSession();
                    System.out.println("profile :"+profile);
                    switch(profile)
                    {
                        case "PRINCIPAL":
                            System.out.println("principal");
                            session.setAttribute("NAME", rs.getString("Name"));
                            session.setAttribute("USERNAME",username);
                            response.sendRedirect("PRINCIPALPANEL.jsp");
                        break;
                        
                        case "TEACHER":
                            System.out.println("teacher");
                            session.setAttribute("NAME", rs.getString("Name"));
                            session.setAttribute("USERNAME",username);
                            response.sendRedirect("TEACHERPANEL.jsp");
                        break;
                        
                        case "STUDENT":
                            System.out.println("student");
                            session.setAttribute("NAME", rs.getString("Name"));
                            session.setAttribute("USERNAME",username);
                            response.sendRedirect("STUDENTPANEL.jsp");
                        break;
                            
                    }
                }
                
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }

    }

    public String getServletInfo() 
    {
                return "Short description";
    }

}
