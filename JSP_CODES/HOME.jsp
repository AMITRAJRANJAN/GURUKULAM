<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8,width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="HOME.css">
    </head>
    <body class="bg-secondary">
        <%
            Database Db = new Database();
        %>
        <%@include file="HEADER.jsp"%>
        
        <div class="row my-2 ms-5">
            <!--notice begins-->
            <div class="card col-md-4" style="width: 20rem;">
                <div class="card-body">
                    <h5 class="card-title">Notice</h5>
                    <%
                        try {
                            Statement st = Db.databaseconnection();
                            ResultSet rs = st.executeQuery("Select * from NoticeBoard");
                            Boolean record = rs.next();
                            if (record == true) {
                                while (record == true) {
                                    out.print("<p><a href=" + rs.getString("Link") + ">" + rs.getString("Notice") + "</a></p>");
                                    record = rs.next();
                                }
                            } else if (record == false) {
                                out.print("<p><a href='#'>No Notice.</a></p>");
                            }
                        } catch (Exception e) {
                            System.out.println("Exception :" + e);
                        }
                    %>
                </div>
            </div>
            <!--notice ends-->

            <!--slider begins-->
            <div id="carouselExampleDark" class="carousel carousel-dark slide col-md-4" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <img src="campus.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5 class="text-light">Clean and Green campus</h5>
                            <p class="text-light">Some representative placeholder content for the first slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="smartclass.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5 class="text-light">Neat and Clean classrooms</h5>
                            <p class="text-light">Some representative placeholder content for the second slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="canteen.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5 class="text-light">Healthy and Hygenic canteen</h5>
                            <p class="text-light">Some representative placeholder content for the third slide.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!--slider ends-->

            <!--important link begins-->
            <div class="card col-md-4" style="width: 20rem;">
                <div class="card-body">
                    <h5 class="card-title">Important Links</h5>
                    <h3 class="HEADINGS">Important Links</h3>
                    <h3 class="SUBHEADINGS">For Students :</h3>
                    <p><a href="#">Class link.</a></p>
                    <p><a href="#">Ask your doubt.</a></p>
                    <p><a href="#">Submmit Assignment.</a></p>
                    <p><a href="#">Fee Payment.</a></p>
                    <p><a href="#">Submmit an application.</a></p>
                    <h3 class="SUBHEADINGS">For Teachers :</h3>
                    <p><a href="#">Post class link.</a></p>
                    <p><a href="#">Post assignment.</a></p>
                    <p><a href="#">Submmit an application.</a></p>
                </div>
            </div>
            <!--important link ends-->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>
