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
        <%!
            Database Db = new Database();
        %>
        <div class=" row my-5 mx-5">
            <div class="container col-md-6">
                <div class="card text-bg-warning mb-3 text-center" style="max-width: 35rem;">
                    <div class="card-header">Current Notices</div>
                    <div class="card-body">

                        <%
                            try {
                                Statement st = Db.databaseconnection();
                                ResultSet rs = st.executeQuery("Select * from NOTICEBOARD");
                                Boolean record = rs.next();
                                if (record == true) {
                                    while (record == true) {
                                        out.print("<h5 class='card-title'>(" + rs.getString("Number") + ")&emsp;<a href=" + rs.getString("Link") + ">" + rs.getString("Notice") + "</a></h5>");
                                        record = rs.next();
                                    }
                                } else if (record == false) {
                                    out.print("<h5 class='card-title'><a href='#'>No Notice.</a></h5>");
                                }
                            } catch (Exception e) {
                                System.out.println("Exception :" + e);
                            }
                        %>

                    </div>
                </div>
            </div>
            
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>



    </body>
</html>
