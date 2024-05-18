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

public class LOGOUT extends HttpServlet 
{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         HttpSession session=request.getSession();
         session.invalidate();
         response.sendRedirect("LOGOUT.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
