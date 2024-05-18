<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <%
            Database Db = new Database();
        %>
        <div class="card text-center">

            <div class="card-body">
                <h5 class="card-title">Class Teachers</h5>
                <form action="#">
                    <table class='table table-warning' id="TEACHERSDISPLAYTABLE">
                        <tr>
                            <th class='table-warning'>Teacher</th><th class='table-warning'>Application Number</th><th class='table-warning'>Class Teacher</th>
                        </tr>
                        <%
                            try {
                                Statement st = Db.databaseconnection();
                                ResultSet rs = st.executeQuery("Select * from teacher");
                                Boolean record = rs.next();
                                if (record == true) {
                                    while (record) {
                                        out.print("<tr class='table-warning'>"
                                                + "<td class='table-warning'>" + rs.getString("Name") + "</td><td class='table-warning'>" + rs.getString("ApplicationNumber") + "</td><td class='table-warning'><input type='text' name='APPLICATIONNUMBER' value='CLASS 1'></td>"
                                                + "</tr>");
                                        record = rs.next();
                                    }
                                }

                            } catch (Exception e) {
                                System.out.println("Exception :" + e);
                            }
                        %>
                    </table>
                    <br>
                    <button type='submit' class='btn btn-outline-warning ms-5'>Search the selected teacher</button>
                    
                    <!--<input class="BUTTONS" type="submit" value="Search the selected teacher">-->
                </form>
            </div>                
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
