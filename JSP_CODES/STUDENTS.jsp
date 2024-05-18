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
        <link rel="stylesheet" href="STUDENTS.css">
    </head>
    <body>
        <%
            Database Db = new Database();
        %>

        <div class="card bg-secondary text-warning mx-auto my-2 text-center" style="width: 20rem;">
            <div class="card-body">
                <div class="form-check mx-auto">
                    <input id="SEARCHALL" class="form-check-input" type="radio" name="SEARCHSTUDENT" value="SEARCHALLSTUDENTS" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Search students class wise
                    </label>
                </div>
                <div class="form-check">
                    <input id="SEARCHSINGLE" class="form-check-input" type="radio" name="SEARCHSTUDENT" value="SEARCHSTUDENT" id="flexRadioDefault2">
                    <label class="form-check-label" for="flexRadioDefault2">
                        Search student individually
                    </label>
                </div>
            </div>
        </div>


        <div id="TASK1FORM" class="TASK1FORMVISIBLE text-warning">
            <form method="get" action="SEARCHSTUDENTS">
                <select class="form-select mx-5" aria-label="Default select example" name="CLASS" style="width: 75rem;">
                    <option value="" selected>Select a class</option>
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
                <button type="submit" class="btn btn-outline-warning mx-5 my-2">Search Students</button>
        </div>  

        <div id="TASK2FORM" class="TASK2FORMVISIBLE text-warning">
            <form method="get" action="SEARCHSTUDENTS">
                <div class="form-floating mb-3 mx-5">
                    <input type="text" class="form-control" id="floatingInput" name="ADMISSIONNUMBER"  placeholder="name@example.com">
                    <label for="floatingInput">Enter Admission Number</label>
                </div>
                <button type="submit" class="btn btn-outline-warning mx-5">Search Student</button>
            </form>
        </div> 
        <!--<button type="submit" class="btn btn-outline-warning">Warning</button>-->
        <!--<input id="BUTTON" class="BUTTONVISIBLE btn-outline-warning" type="submit" value="Search student">-->

    </div>
    <script src="SEARCHSTUDENTS.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
