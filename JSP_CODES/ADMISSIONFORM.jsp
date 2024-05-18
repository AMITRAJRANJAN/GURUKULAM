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
            ResultSet rs=st.executeQuery("Select * from student");
            Boolean record=rs.next();
            int admissionnumber=0;
            if(record)
            {
                rs.last();
                admissionnumber=rs.getInt("AdmissionNumber")+1;
            }
            else
            {
                admissionnumber=1;
            }
            %>
        <div class="container my-2 mx-5 text-warning">
            <h3 class="text-center">Enter the details for new admission.</h3>
            <form method="get" action="ADMISSIONFORMSUBMISSION">
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Admission Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="ADMISSIONNUMBER" value='<%=admissionnumber%>'>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Date of Admission</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control mt-2" id="inputPassword" name="DOA">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Student Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="STUDENTNAME">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Select class for new admission</label>
                    <div class="col-sm-9 mt-2">
                        <select class="form-select" aria-label="Default select example" name="ADMITTEDCLASS">
                            <option selected>Select class for new admission</option>
                            <option value="1">Class 1</option>
                            <option value="2">Class 2</option>
                            <option value="3">Class 3</option>
                            <option value="4">Class 4</option>
                            <option value="5">Class 5</option>
                            <option value="6">Class 6</option>
                            <option value="7">Class 7</option>
                            <option value="8">Class 8</option>
                            <option value="9">Class 9</option>
                            <option value="10">Class 10</option>
                        </select>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Father's Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="FATHERNAME">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Mother's Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="MOTHERNAME">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control mt-2" id="inputPassword" name="DOB">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="ADDRESS">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Mobile No.</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="MOBILE">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Email id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword"name="EMAILID">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Admission Fee</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword"name="ADMISSIONFEE">
                    </div>
                </div>
                <label for="inputPassword" class="col-sm-3 col-form-label mt-2" name=""></label>

                <button type="submit" class="btn btn-outline-warning col-sm-6 ms-5 fs-5">Submit</button>
                <button type="reset" class="btn btn-outline-info col-sm-2 ms-3 fs-5">Reset</button>
            </form>   
    </body>
</html>
