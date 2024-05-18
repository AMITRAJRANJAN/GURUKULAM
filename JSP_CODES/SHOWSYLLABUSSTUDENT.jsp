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
            Database Db = new Database();
        %>
        <%
            int clas = Integer.parseInt(session.getAttribute("CLASS").toString());
        %>

        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title">Syllabus</h5>
                <table class='table table-warning'>       
                    <%
                        try 
                        {
                            Statement st = Db.databaseconnection();
                            ResultSet rs = st.executeQuery("Select * from Class" + clas + "_Subject where Status=1");
                            Boolean record = rs.next();
                            while (record == true) 
                            {
                                out.println("<tr><td class='table table-warning'>" + rs.getString("Subject") + "</td></tr>");
                                record = rs.next();
                            }

                        }
                        catch (Exception e) 
                        {
                            System.out.println("Exception :" + e);
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
