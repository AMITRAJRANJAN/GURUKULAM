<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="SYLLABUSFORM.css">
    </head>
    <body>
        <%
            String clas=session.getAttribute("CLASS").toString();
            Database Db=new Database();
            int subjectcount=0;
            %>
        <div class="container-fluid">
            <h3 class="text-center text-warning">
                    <% 
                        out.print("Create syllabus  for class: "+clas); 
                    %>
                </h3>
            <form method="get" action="SYLLABUSSUBMISSION">
                <table class='table table-warning table-bordered'>       
                    <tr>
                        <th>Subject</th><th>Syllabus</th>
                    </tr>
                             
                                   <%
                                        try
                                        {
                                                Statement st=Db.databaseconnection();
                                                ResultSet rs=st.executeQuery("Select * from class"+clas+"_subject where Status=1");
                                                Boolean record=rs.next();
                                                if(record==true)
                                                {
                                                    while(record)
                                                    {
                                                        out.print("<tr>"
                                                                + "<td>"+rs.getString("Subject")+"</td><td><input class='INPUTFIELDS' type='text' name='"+rs.getString("Subject")+"'></td>"
                                                                + "</tr>");
                                                        subjectcount=subjectcount+1;
                                                        session.setAttribute("SUBJECT"+subjectcount, rs.getString("Subject"));
                                                        record=rs.next();
                                                    }
                                                }
                                                session.setAttribute("SUBJECTCOUNT", subjectcount);
                                        }
                                        catch(Exception e)
                                        {
                                            System.out.println("Exception :"+e);
                                         }
                                        %>
                </table>
                <div class="text-center">
                <button type="submit" class="btn btn-outline-warning">Submit</button>
                <button type="reset" class="btn btn-outline-light">Reset</button>
                </div>
                </form>
                <p class="text-warning">Note:Please separate the syllabus topics by using comma(,) only.</p>

            </div>  

    </body>
</html>
