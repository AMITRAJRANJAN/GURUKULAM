<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="PRINCIPALERROR.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8,width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            .menus
            {
                font-size: 20px;
                text-decoration: none;
                background-color: grey;
            }
            .menu-button
            {
                margin-left: 0px;
                width:100%;
                text-align: left;
            }
            .menu-list
            {
                background-color: grey;
                text-decoration: none;
                list-style-type: none;
            }
        </style>
    </head>
    <body class="bg-secondary">
        <%@include file="USERHEADER.jsp"%>

        <!-- side menu start        -->


        <div class="offcanvas offcanvas-start" style="width:300px;" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header" style="background-color: black; color: white;">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Gurukulam</h5>
                <button type="button" class="btn-close" style="background-color: white;" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" style="background-color: grey;">

                <ul class="menu-list">
                    <li>
                        <a class="menus text-warning" href="NOTICE" ><button class="menu-button btn btn-dark">Notice Board</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="ADMISSION"><button class="menu-button btn btn-dark">New Admission</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="NEWTEACHERAPPLICATION"><button class="menu-button btn btn-dark">New Teacher Application</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="SUBJECTS"><button class="menu-button btn btn-dark">Subjects</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="ACADEMICS"><button class="menu-button btn btn-dark">Academics</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="STUDENTS"><button class="menu-button btn btn-dark">Students</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="TEACHERS"><button class="menu-button btn btn-dark">Teachers</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="CREATEMONTHLYFEE"><button class="menu-button btn btn-dark">Create Monthly Fee</button></a>
                    </li>
                    <li class="">
                        <a class="menus  text-warning" href="FEEDEPOSIT.jsp?ADMISSIONNUMBER=null&MONTH=null&FEESTATUS=null"><button class="menu-button btn btn-dark">Fee Deposit</button></a>
                    </li>
                    <!--li class="">
                        <a class="menus  text-warning" href="PAYMENTOPTION">Payment Options</a>
                    </li-->
                    <!--li class="">
                        <a class="menus  text-warning" href="PENDINGTRANSACTIONS">Pending Transactions</a>
                    </li-->
                    <!--li class="">
                        <a class="menus  text-warning" href="CLASSTEACHERS">Class Teachers</a>
                    </li-->
                    <li class="">
                        <a class="menus  text-warning" href="SYLLABUS"><button class="menu-button btn btn-dark">Syllabus</button></a>
                    </li>
                </ul>

            </div>
        </div>
        <!-- side menu ends    -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
