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

public class ACADEMICS2 extends HttpServlet
{

    Database Db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        processRequest(request, response);
        PrintWriter PW = response.getWriter();
        HttpSession session = request.getSession();
        int clas = Integer.parseInt(request.getParameter("CLASS"));
        session.setAttribute("CLASS", clas);
        try 
        {
            Statement st = Db.databaseconnection();
            ResultSet rs= st.executeQuery("Select * from classteacher where class="+clas);
            Boolean record=rs.next();
            Statement st2 = Db.databaseconnection();
            ResultSet rs2 = st2.executeQuery("Select * from class"+clas+"subjects");
            Boolean record2 = rs2.next();
            
                if (record == true && record2==true)
                {
                    RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                    RD.include(request, response);
                    
                    
                    PW.print("<div class='card'>"
                            + "<div class='card-body'>"
                            + "<h3>Class " + clas + " data</h3>");
                            PW.print("<table class='table table-warning table-bordered'>"
                                    + "<tr class='table-warning'><th class=table-warning>Class Teacher</th><th class=table-warning>Application Number</th></tr>");
                            while(record)
                            {
                                PW.print("<tr class='table-warning'>"
                                        + "<td class='table-warning'>"+rs.getString("Name")+"</td>"
                                                + "<td class='table-warning'>"+rs.getString("ApplicationNumber")+"</td>"
                                                        + "</tr>");
                                record=rs.next();
                            }
                           PW.print( "</table>");

                             PW.print("<table class='table table-warning table-bordered'>"     
                            +"<tr class='table-warning'><th class='table-warning'>Subject Code</th><th class='table-warning'>Subject</th><th class='table-warning'>Teacher</th><th class='table-warning'>Application Number</th></tr>");
                            while(record2)
                            {
                                        PW.print("<tr class='table-warning'>"
                                        + "<td class='table-warning'>" + rs2.getInt("SubjectCode") + "</td>"
                                        + "<td class='table-warning'>" + rs2.getString("Subject") + "</td>"
                                        + "<td class='table-warning'>" + rs2.getString("Teacher") + "</td>"
                                        + "<td class='table-warning'>" + rs2.getInt("ApplicationNumber") + "</td>"
                                        + "</tr>");
                                        record2=rs2.next();
                            }
                            
                            PW.print( "</table>"
                            + "  </div>"
                            + "</div>");
                            /*
                            + "<div class='card'>"
                            + "  <div class='card-body'>"
                            + "<h3>Class " + clas + " subjects</h3>");
                    PW.print("<table class='table table-warning table-bordered'>");
                    while (record2) 
                    {
                        PW.print("<tr table-warning><td table-warning>" + rs2.getString("Subject") + "</td></tr>");
                        record2 = rs2.next();
                    }
                    PW.print("</table>"
                            + "<div class='text-center'>"
                            + "<a href='SHOWSYLLABUS'><button type='button' class='btn btn-outline-info'>Show Syllabus</button></a>"
                            + "  </div>"
                            + "</div>"
                            + "</div>");
                    //RequestDispatcher RD2 = request.getRequestDispatcher("ACADEMICS.jsp");
                    //RD2.include(request, response);
                    */
                    
                    } 
                
                else 
                {
                    RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                    RD.include(request, response);
                    //RequestDispatcher RD2 = request.getRequestDispatcher("ACADEMICS.jsp");
                    //RD2.include(request, response);
                
                    PW.print("<br>"
                            + "<div style='width:750px;margin-left:auto;margin-right:auto;'>"
                                        + "<div class='card text-bg-warning text-center'>"
                                        +" <div class='card-body'>" 
                                        +" <h5 class='card-title'>No any class data found.</h5>" 
                                        +"  <a href='ACADEMICS3' class='btn btn-outline-primary'>Create data for class " + clas + "</a>" 
                                        +"  </div>" 
                                        +"</div>"
                                        + "</div>");
                }
            } 
            catch (Exception e) 
            {
                System.out.println("Exception :" + e);
            }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
