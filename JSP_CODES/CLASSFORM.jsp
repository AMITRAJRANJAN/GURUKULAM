<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CLASSFORM.css">
    </head>
    <body>
        <%
            String clas = session.getAttribute("CLASS").toString();
            Database Db = new Database();
        %>

        <div class="container-fluid">
            <h3 class="text-center text-warning">
                <%
                    out.print("Enter the details for class " + clas);
                %>
            </h3>
            <form method="get" action="CLASSDATASUBMISSION">
<!--                <select class="form-select" name="SECTION" aria-label="Default select example">
                    <option selected>Select a section</option>
                    <option value="PREPRIMARY">Pre-Primary</option>
                    <option value="PRIMARY">Primary</option>
                    <option value="MIDDLE">Middle</option>
                    <option value="SECONDARY">Secondary</option>
                </select>-->
                <br>
                <select class="form-select" name="CLASSTEACHER" aria-label="Default select example">
                    <option selected>Select a class teacher</option>
                    <%
                        try 
                        {
                            Statement st = Db.databaseconnection();
                            ResultSet rs = st.executeQuery("Select * from teacher");
                            Boolean record = rs.next();
                            while (record == true)
                            {
                                out.print("<option value='" + rs.getString("Name") + "-" + rs.getString("ApplicationNumber") + "'>" + rs.getString("Name") + "-" + rs.getString("ApplicationNumber") + "</option>");
                                record = rs.next();
                            }
                        } 
                        catch (Exception e)
                        {
                            System.out.println("Exception :" + e);
                        }
                    %>
                </select>
            <br>
                <table class='table table-warning table-bordered'>       
                    <tr>
                        <th>Subject Name</th><th>Status</th><th>Subject Teacher</th>
                    </tr>
                    <%
                        try 
                        {
                            Statement st = Db.databaseconnection();
                            ResultSet rs = st.executeQuery("Select * from schoolsubject");
                            Boolean record = rs.next();
                            if (record == true)
                            {
                                while (record) 
                                {
                                    int status=rs.getInt("Class"+clas);
                                    if(status==1)
                                    {
                                        Statement st2 = Db.databaseconnection();
                                        ResultSet rs2=st2.executeQuery("Select * from teacher where Subject='"+rs.getString("Name")+"'");
                                        Boolean record2=rs2.next();
                                        if(record2==true)
                                        {
                                            out.print("<tr>"
                                            + "<td>" + rs.getString("Name") + "</td>"
                                            + "<td><input type='checkbox' name='"+rs.getInt("Code")+"' value='"+rs.getInt("Code")+"' checked></td>"
                                            + "<td>"
                                            + "<select name='"+rs.getString("Name")+"' class='form-select' aria-label='Default select example'>");
                                            while(record2)
                                            {
                                              out.print("<option value='"+rs2.getString("Name")+"-"+rs2.getString("ApplicationNumber")+"'>"+rs2.getString("Name")+"-"+rs2.getString("ApplicationNumber")+"</option>");
                                              record2=rs2.next();
                                            }     
                                            out.print("</select>"
                                            + "</td>" 
                                            + "</tr>");
                                        }
                                        else
                                        {
                                            out.print("<tr>"
                                            + "<td>" + rs.getString("Name") + "</td>"
                                            + "<td><input type='checkbox' name='"+rs.getInt("Code")+"' value='"+rs.getInt("Code")+"' checked></td>"
                                            + "<td>"
                                            + "<select name='"+rs.getString("Name")+"' class='form-select' aria-label='Default select example'>"
                                                    + "<option value='0'>No Teachers</option>"
                                            + "</select>"
                                            + "</td>" 
                                            + "</tr>");
                                        }
                                        
                                    }
                                    else if(status==0)
                                    {
                                        out.print("<tr>"
                                            + "<td>" + rs.getString("Name") + "</td>"
                                            + "<td><input type='checkbox' name='"+rs.getInt("Code")+"'  value='0'></td>" 
                                            + "<td>"
                                            + "<select name='"+rs.getString("Name")+"' class='form-select' aria-label='Default select example'>"
                                            + "<option value='0'>Subject Not Assigned</option>"
                                            + "</select>"
                                            + "</td>" 
                                            + "</tr>");
                                    }
                                    record = rs.next();
                                }
                            }
                        }
                        catch (Exception e) 
                        {
                            System.out.println("Exception :" + e);
                        }
                    %>
                </table>
                <div class="text-center">
                <button type="submit" class="btn btn-outline-warning">Submit</button>
                <button type="reset" class="btn btn-outline-light">Reset</button>
                </div>
                </form>

        </div>
    </body>
</html>
