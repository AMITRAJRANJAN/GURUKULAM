<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Database Db=new Database();
            float totalclasses;
            float totalattendance;
            float attendancepercentage;
            %>
            <%
                int admissionnumber=Integer.parseInt(session.getAttribute("USERNAME").toString());
                int clas=Integer.parseInt(session.getAttribute("CLASS").toString());
            %>
            
                    <div class="card text-center">
            <div class="card-body">
                 <h5 class="card-title">Attendance</h5>
                <%
                        try
                        {
                            Statement st=Db.databaseconnection();
                            ResultSet rs=st.executeQuery("Select * from Class"+clas+"Students where AdmissionNumber="+admissionnumber);
                            Boolean record=rs.next();
                            if(record==true)
                            {
                                totalclasses=rs.getInt("TotalClasses");
                                totalattendance=rs.getInt("Attendance");
                                attendancepercentage=(totalattendance/totalclasses)*100;
                            }
                               
                        }   
                        catch(Exception e)
                        {
                            System.out.println("Exception :"+e);
                        }
                    %>
                    
                    <table class='table table-warning'>
                        <tr><th  class='table table-warning'>Total Classes</th><td  class='table table-warning'><%=totalclasses%></td></tr>
                        <tr><th  class='table table-warning'>Total Present</th><td  class='table table-warning'><%=totalattendance%></td></tr>
                        <tr><th  class='table table-warning'>Attendance Percentage</th><td  class='table table-warning'><%=attendancepercentage%></td></tr>
                    </table>
            </div>
                     </div>
    </body>
</html>
