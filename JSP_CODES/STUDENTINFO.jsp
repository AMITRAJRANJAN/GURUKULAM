
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <div class="card text-center">

            <div class="card-body">
                <h5 class="card-title">Student Data</h5>
                
                <%
                    String S = session.getAttribute("S").toString();
                    if (S == "A") 
                    {
                        String studentname = session.getAttribute("STUDENTNAME").toString();
                        int admissionnumber = Integer.parseInt(session.getAttribute("ADMISSIONNUMBER").toString());
                        //int currentclass =Integer.parseInt(session.getAttribute("CURRENTCLASS").toString());
                        //int admissionfee = Integer.parseInt(session.getAttribute("ADMISSIONFEE").toString());
                        int admittedclass = Integer.parseInt(session.getAttribute("ADMITTEDCLASS").toString());
                        String fathername = session.getAttribute("FATHERNAME").toString();
                        String mothername = session.getAttribute("MOTHERNAME").toString();
                        String address =session.getAttribute("ADDRESS").toString();
                        String mobile =session.getAttribute("MOBILE").toString();
                        //String email =session.getAttribute("EMAIL").toString();

                        out.print("<table class='table table-warning'>");
                        out.print("<tr class='table-warning'>"
                                + "<td class='table-warning'>Name</td><td class='table-warning'>" + studentname + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Admission Number</td><td class='table-warning'>" + admissionnumber + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Current Class</td><td class='table-warning'>Current Class</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Admission Fee </td><td class='table-warning'>Admission Fee</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Admitted Class</td><td class='table-warning'>" + admittedclass + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Father Name</td><td class='table-warning'>" + fathername + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Mother name</td><td class='table-warning'>" + mothername + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Address</td><td class='table-warning'>" + address+ "</td>"
                                + "</tr>"
                                
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Mobile Number</td><td class='table-warning'>" + mobile + "</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Email</td><td class='table-warning'>Email</td>"
                                + "</tr>");
                        out.print("</table>");
                    } 
                    else if (S == "C") 
                    {
                        int count = Integer.parseInt(session.getAttribute("COUNT").toString());
                        String[] name = new String[count];
                        int[] admissionnumber = new int[count];
                        for (int i = 1; i <= count; i++) 
                        {
                            name[i - 1] = session.getAttribute("NAME" + i).toString();
                            admissionnumber[i - 1] = Integer.parseInt(session.getAttribute("ADMISSIONNUMBER" + i).toString());
                        }
                        out.print("<form>");
                        out.print("<table class='table table-warning'>");
                        out.print("<tr class='table-warning'>"
                                + "<th class='table-warning'>Name</th><th class='table-warning'>Admission Number</th><th class='table-warning'>Selection</th>"
                                + "</tr>");
                        for (int i = 0; i < count; i++)
                        {
                            out.print("<tr class='table-warning'>"
                                    + "<td class='table-warning'>" + name[i] + "</td><td class='table-warning'>" + admissionnumber[i] + "</td><td class='table-warning'><input type='radio' name='ADMISSIONNUMBER' value='" + admissionnumber[i] + "'</td>"
                                    + "</tr>");
                        }
                        out.print("</table>");
                        out.print("<button type='submit' class='btn btn-outline-warning ms-5'>Search the selected student</button>");
                    }
                %>
                </table>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
