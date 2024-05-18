<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/43290fa92d.js' crossorigin='anonymous'></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = session.getAttribute("NAME").toString();
        %>
        <!--navbar begins-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="HOME.jsp">Gurukulam</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<!--                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="HOME.jsp">Home</a>
                        </li>-->
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample" aria-current="page" href="#"><i class="fa-solid fa-bars"></i></a>
                        </li>
                        <li class="nav-item" style="text-align: right;">
                            <span class="nav-link active" aria-current="page" href="#"><%out.print("Hello Mr. " + name);%></span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="LOGOUT">Logout</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <!--navbar ends-->
        

    </body>
</html>
