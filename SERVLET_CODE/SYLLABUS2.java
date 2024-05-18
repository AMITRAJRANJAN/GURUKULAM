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

public class SYLLABUS2 extends HttpServlet
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
            ResultSet rs= st.executeQuery("Select * from class"+clas+"subjects");
            Boolean record=rs.next();
            if(record)
            {               
                RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                RD.include(request, response);
                
                PW.print("<div class='card'>"
                            + "<div class='card-body'>"
                            + "<h3>Class " + clas + " syllabus</h3>");
                            PW.print("<table class='table table-warning table-bordered'>"
                                    + "<tr class='table-warning'><th class=table-warning>Subject Code</th><th class=table-warning>Subject</th><th class=table-warning>Topics</th></tr>");
                
                 int count=0;
                 String[] subjects;
            
                 while(record)
                {
                    count=count+1;
                    record=rs.next();
                }
                    record=rs.first();
                    subjects=new String[count];
                    for(int i=0;i<count;i++)
                    {
                        subjects[i]=rs.getString("Subject")+String.valueOf(rs.getInt("SubjectCode"));
                        rs.next();
                    }
            
                    Statement st2 = Db.databaseconnection();
                    for(int i=0;i<count;i++)
                    {
                        PW.print("<tr class='table-warning'>"
                                            + "<td class='table-warning'>"+subjects[i]+"</td>"
                                             + "<td class='table-warning'>"+subjects[i]+"</td>"
                                             + "<td class='table-warning'>");
                        ResultSet rs2 = st2.executeQuery("Select * from "+subjects[i]+" where Class"+clas+"=1");
                        Boolean record2 = rs2.next();
                        while(record2)
                        {
                            PW.print(rs2.getString("Topics"));
                            PW.print(", ");
                            record2=rs2.next();
                        }
                        rs2.close();
                        PW.print("</td>"
                                + "</tr>");
                    }
                    PW.print( "</table>"
                            + "</div>"
                            + "</div>");
                    
                    
                    
                    PW.print("<div class='card'>"
                            + "<h3>Add New Topics</h3>"
                            + "<form action='UPDATESYLLABUS' method='get'>"
                            + "<div class='card-body'>"
                            + "<div class='row'>");//row start
                    PW.print("<div class='col-sm-3'>"//select start
                            + "<select class='form-select' aria-label='Default select example' name='SUBJECT'>"
                                       +"<option selected>Select subject</option>");
                    for(int i=0;i<count;i++)
                    {
                        PW.print("<option value='"+subjects[i]+"'>"+subjects[i]+"</option>");
                    }
                    PW.print("</select>"
                            + "</div>"//select ernd
                            + "<div class='col-sm-7'>"//input start
                            +"<input type='text' class='form-control' id='inputPassword' placeholder='Enter new topic here...' name='TOPIC'>"
                            +"</div>"//input end
                            + "<div class='col-sm-2'>"//input start
                            +"<button type='submit' class='btn btn-outline-warning'>Submit</button>"
                            +"</div>"//input end
                            + "</div>"//row end
                            + "</div>"
                            + "</form>"
                            + "</div>");
                            
            }
                            
                else 
                {
                    RequestDispatcher RD = request.getRequestDispatcher("PRINCIPALPANEL.jsp");
                    RD.include(request, response);
                    /*
                    RequestDispatcher RD2 = request.getRequestDispatcher("ACADEMICS.jsp");
                    RD2.include(request, response);
                
                    PW.print("<br>"
                            + "<div style='width:750px;margin-left:auto;margin-right:auto;'>"
                                        + "<div class='card text-bg-warning text-center'>"
                                        +" <div class='card-body'>" 
                                        +" <h5 class='card-title'>No any class data found.</h5>" 
                                        +"  <a href='ACADEMICS3' class='btn btn-outline-primary'>Create data for class " + clas + "</a>" 
                                        +"  </div>" 
                                        +"</div>"
                                        + "</div>");
                
                       */ 
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
