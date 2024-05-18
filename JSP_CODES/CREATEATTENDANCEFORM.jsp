<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    </head>
    <body>
        <%!
            Database Db=new Database();
            int clas;
            int numberofstudent=0;
            %>
            <%
                String name=session.getAttribute("NAME").toString();
                String username=session.getAttribute("USERNAME").toString();
                int applicationnumber=Integer.parseInt(username);
                
                Statement st=Db.databaseconnection();
                ResultSet rs=st.executeQuery("Select Class from ClassTeacher where ApplicationNumber='"+applicationnumber+"'");
                Boolean record=rs.next();
                if(record==true)
                {
                    clas=rs.getInt("Class");;
                    session.setAttribute("CLASS",clas);
                }
                
                %>
        <div class="card text-center">
            <div class="card-body">
                 <h5 class="card-title">Create the attendance for class <%=clas%></h5>
            <form method="get" action="ATTENDANCESUBMISSION">
                <table class='table table-warning'>
                    <tr>
                        <th class='table-warning'>Student Name</th><th class='table-warning'>Ledger Number</th><th class='table-warning'>Present</th><th class='table-warning'>Absent</th>              
                    </tr>
                    <%
                        Statement st2=Db.databaseconnection();
                        ResultSet rs2=st2.executeQuery("Select * from Class"+clas+"Students");
                        Boolean record2=rs2.next();
                        if(record2==true)
                        {
                            while(record2)
                            {
                                out.print("<tr>"
                                                + "<td>"+rs2.getString("StudentName")+"</td>"
                                                + "<td>"+rs2.getInt("AdmissionNumber")+"</td>"
                                                + "<td><input type='radio' name='"+rs2.getInt("AdmissionNumber")+"' value='1'></td>"
                                                + "<td><input type='radio' name='"+rs2.getInt("AdmissionNumber")+"' value='0'></td>"
                                                + "</tr>");
                                numberofstudent=numberofstudent+1;
                                session.setAttribute("ADMISSIONNUMBER"+numberofstudent,rs2.getInt("AdmissionNumber"));
                                record2=rs2.next();
                            }
                        }
                        session.setAttribute("NUMBEROFSTUDENT",numberofstudent);
                        numberofstudent=0;
                        %>
                </table>
                <br>
                   <button type='submit' class='btn btn-outline-warning ms-5'>Submit</button>

            </form>
            </div>
            <BR>
            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
