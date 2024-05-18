<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="SUBJECTS.css">
    </head>
    <body>
        <%
            Database Db = new Database();
        %>
        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title">School Subjects</h5>
                <p class="card-text"></p>
                <table class='table table-warning table-bordered'>
                    <thead>
                        <tr class='table-warning'>
                            <th class='table-warning' scope="col">Subject Name</th><th class='table-warning' scope="col">Subject Code</th><th class='table-warning' scope="col">Applicable Classes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Statement st = Db.databaseconnection();
                                ResultSet rs = st.executeQuery("Select * from schoolsubject");
                                Boolean record = rs.next();
                                if (record == true) {
                                    while (record) {
                                        out.print("<tr class='table-warning'>"
                                                + "<td class='table-warning'>" + rs.getString("Name") + "</td><td class='table-warning'>" + rs.getString("Code") + "</td>"
                                                + "</tr>");
                                        record = rs.next();
                                    }
                                }

                            } catch (Exception e) {
                                System.out.println("Exception :" + e);
                            }
                        %>
                </table>
            </div>
        </div>

        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title">Add a new subject</h5>
                <form method="get" action="NEWSUBJECT">
                    <table class='table table-warning table-bordered'>
                        <tr class='table-warning'>
                            <td class='table-warning'>Enter subject name</td><td><input type="text" class="form-control" id="inputPassword" name="SUBJECTNAME"></td>
                        </tr>
                        <tr>
                            <td class='table-warning'>Enter subject code</td><td><input type="text" class="form-control" id="inputPassword" name="SUBJECTCODE"></td>
                        </tr>
                        <tr>
                            <td class='table-warning'>Applicable Classes</td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                    <input type="checkbox" class="btn-check" id="1" name="1" value="1" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="1">1</label>

                                    <input type="checkbox" class="btn-check" id="2" name="2" value="2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="2">2</label>

                                    <input type="checkbox" class="btn-check" id="3" name="3" value="3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="3">3</label>
                                    
                                    <input type="checkbox" class="btn-check" id="4" name="4" value="4" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="4">4</label>

                                    <input type="checkbox" class="btn-check" id="5" name="5" value="5" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="5">5</label>

                                    <input type="checkbox" class="btn-check" id="6" name="6" value="6" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="6">6</label>
                                    
                                    <input type="checkbox" class="btn-check" id="7" name="7" value="7" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="7">7</label>

                                    <input type="checkbox" class="btn-check" id="8" name="8" value="8" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="8">8</label>

                                    <input type="checkbox" class="btn-check" id="9" name="9" value="9" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="9">9</label>
                                    
                                    <input type="checkbox" class="btn-check" id="10" name="10" value="10" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="10">10</label>

                                    
                                    
                                </div>
                            </td>
                            <!--<td>
                                Class 1<input type="checkbox" name="1" value="1">
                                <br>
                                Class 2<input type="checkbox" name="2" value="2">
                                <br>
                                Class 3<input type="checkbox" name="3" value="3">
                                <br>
                                Class 4<input type="checkbox" name="4" value="4">
                                <br>
                                Class 5<input type="checkbox" name="5" value="5">
                                <br>
                                Class 6<input type="checkbox" name="6" value="6">
                                <br>
                                Class 7<input type="checkbox" name="7" value="7">
                                <br>
                                Class 8<input type="checkbox" name="8" value="8">
                                <br>
                                Class 9<input type="checkbox" name="9" value="9">
                                <br>
                                Class 10<input type="checkbox" name="10" value="10">
                                </div>
                            </td>-->
                        </tr>
                    </table>
                    <button class="btn btn-outline-warning" type="submit">Add Subject</button>
                </form>
            </div>    
        </div>
    </body>
</html>
