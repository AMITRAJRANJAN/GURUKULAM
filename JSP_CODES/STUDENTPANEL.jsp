<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body class="bg-secondary">
        <%@include file="USERHEADER.jsp"%>
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link text-warning" href="SHOWATTENDANCE" >Attendance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-warning" href="SHOWSYLLABUSSTUDENT">Syllabus</a>
            </li>
           <li class="nav-item">
                <a class="nav-link  text-warning" href="SHOWEXAMINATIONPERFORMANCE">Show Examination Performance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-warning" href="SHOWFEE">Show Fee</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-warning" href="SHOWNOTICE">Show Notice</a>
            </li>
            
            
        </ul>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
