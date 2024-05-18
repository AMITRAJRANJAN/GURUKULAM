<%@page import="Back.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="SHOWSYLLABUS.css">
    </head>
    <body>

        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title">School Academics</h5>
                <p class="card-text"></p>
                <form action="ACADEMICS2">

                    <table class='table table-warning table-bordered'>
                        <thead>
                            <tr class='table-warning'>
                                <th class='table-warning' scope="col">Subject</th>
                                <th class='table-warning' scope="col">Syllabus</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                Database Db = new Database();
                                int clas = Integer.parseInt(session.getAttribute("CLASS").toString());
                                String subjects = session.getAttribute("SUBJECTS").toString();

                                String[] subject = subjects.split("-");

                                for (int i = 0; i < subject.length; i++)
                                {
                                    out.print("<tr class='table-warning'>"
                                            + "<td class='table-warning'>" + subject[i] + "</td>");
                                    Statement st = Db.databaseconnection();
                                    ResultSet rs = st.executeQuery("Select * from " + subject[i] + "_syllabus where Class" + clas + "=1 OR Class" + clas + "=100");
                                    out.print("<td class='table-warning'>");
                                    Boolean record = rs.next();
                                    while (record) 
                                    {
                                        if (rs.getInt("Class" + clas) == 1) 
                                        {
                                            out.print("<input disabled type='checkbox' >" + rs.getString("Topic"));
                                        }
                                        if (rs.getInt("Class" + clas) == 100) 
                                        {
                                            out.print("<input disabled checked type='checkbox' >" + rs.getString("Topic"));
                                        }
                                        record = rs.next();
                                    }
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            %>
                    </table>
                    <button type="button" class="btn btn-outline-warning" value="Show Complete Syllabus" onclick="showcompletesyllabus('C:\Users\mmani\Documents\NetBeansProjects\GURUKULAM\GURUKULAMCONTENT\C3.txt', 'DISPLAYSYLLABUS')">Show Complete Syllabus</button>
                </form>
            </div>
        </div>

<script src="SHOWCOMPLETESYLLABUS.js"></script>
</body>
</html>
