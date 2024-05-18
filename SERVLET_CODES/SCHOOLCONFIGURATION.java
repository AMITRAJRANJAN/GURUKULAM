package FRONT;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SCHOOLCONFIGURATION extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
            response.setContentType("text/html;charset=UTF-8");
            
        
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
        PrintWriter PW=response.getWriter();
         RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
         RD.include(request, response);
         RequestDispatcher RD2=request.getRequestDispatcher("SCHOOLCONFIGURATION.jsp");
         RD2.include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    
    public String getServletInfo() 
    {
        return "Short description";
    }

}
