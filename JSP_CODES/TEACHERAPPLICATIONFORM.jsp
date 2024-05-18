<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="ADMISSIONFORM.css">
    </head>
    <body>
        <%
            Database db=new Database();
            Statement st=db.databaseconnection();
            ResultSet rs=st.executeQuery("Select * from teacher");
            Boolean record=rs.next();
            int applicationnumber=0;
            if(record)
            {
                rs.last();
                applicationnumber=rs.getInt("ApplicationNumber")+1;
            }
            else
            {
                applicationnumber=1;
            }
            %>
        
        <div class="container my-2 mx-5 text-warning">
            <h3 class="text-center">Enter the details for new teacher</h3>
            <form method="get" action="NEWTEACHERAPPLICATIONSUBMISSION">
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Application Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="APPLICATIONNUMBER" value='<%=applicationnumber%>'>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Date of Joining</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control mt-2" id="inputPassword" name="DOJ">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Teacher Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="TEACHERNAME">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control mt-2" id="inputPassword" name="DOB">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Subject Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="SUBJECTNAME">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Select teaching section</label>
                    <div class="col-sm-9 mt-2">
                        <select class="form-select" aria-label="Default select example" name="TEACHINGSECTION">
                            <option value="0">Select a teaching section</option>
                            <option value="PRIMARY">Primary</option>
                            <option value="MIDDLE">Middle</option>
                            <option value="SECONDARY">Secondary</option>
                        </select>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="ADDRESS1">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Mobile No.</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="MOBILE">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Email id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword"name="EMAILID">
                    </div>
                </div>
                <label for="inputPassword" class="col-sm-3 col-form-label mt-2" name=""></label>

                <button type="submit" class="btn btn-outline-warning col-sm-6 ms-5 fs-5">Submit</button>
                <button type="reset" class="btn btn-outline-info col-sm-2 ms-3 fs-5">Reset</button>
            </form>  


        </div>
    </body>
</html>
