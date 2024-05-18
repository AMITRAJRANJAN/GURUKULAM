<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="HEADER.css">
    </head>
    <body>
        <!--navbar begins-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="HOME.jsp">Gurukulam</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="HOME.jsp">Home</a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="#">Academics</a>
                        </li>

                        
                    <form class="d-flex" role="search">
                        
                        <a href="LOGIN.jsp" class="btn btn-outline-light" type="submit">Login </a>

                    </form>
                </div>
            </div>
        </nav>
        <!--navbar ends-->
    </body>
</html>
