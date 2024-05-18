<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
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
            <div class="container col-md-6">
                <div style="max-width: 35rem;">
                    <div class="card text-center bg-warning">
                        <div class="card-header">
                            <ul class="nav nav-pills card-header-pills">
                                <li class="nav-item">
                                    <h3 href="#">New Notice</h3>
                                </li>
                            </ul>
                        </div>
                        <form action="NOTICESUBMISSION">
                            <div class="mb-3 my-2 row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Notice</label>
                                <div class="col-sm-8 mx-5">
                                    <input type="text" class="form-control" id="" name="NOTICE">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPassword" class="col-sm-2 col-form-label">Link</label>
                                <div class="col-sm-8 mx-5">
                                    <input type="text" class="form-control" id="" name="LINK">
                                </div>
                            </div>

                            <div class="d-grid gap-2 my-2 mx-2">
                                <button class="btn btn-outline-primary" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>



    </body>
</html>