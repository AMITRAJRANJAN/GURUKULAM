<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="TEACHERSINFO.css">
    </head>
    <body>
        <div class="card text-center">

            <div class="card-body">
                <h5 class="card-title">Teachers Data</h5>
            <%
                
                String teachername=session.getAttribute("TEACHERNAME").toString();
              
                int applicationnumber=Integer.parseInt(session.getAttribute("APPLICATIONNUMBER").toString());
                  
                String subject=session.getAttribute("SUBJECT").toString();
                
                //String classteacher=session.getAttribute("CLASSTEACHER").toString();
                
                
                
                String address=session.getAttribute("ADDRESS").toString();
                String mobile=session.getAttribute("MOBILE").toString();
                String email=session.getAttribute("EMAIL").toString();
                System.out.println("success5");
                out.print("<table class='table table-warning'>");
                out.print("<tr class='table-warning'>"
                                + "<td class='table-warning'>Name</td><td class='table-warning'>"+teachername+"</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Ledger Number</td><td class='table-warning'>"+applicationnumber+"</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Subject</td><td class='table-warning'>"+subject+"</td>"
                                + "</tr>"
                                /*+ "<tr>"
                                + "<td>Class Teacher</td><td>"+classteacher+"</td>"
                                + "</tr>"*/
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Address1</td><td class='table-warning'>"+address+"</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Mobile Number</td><td class='table-warning'>"+mobile+"</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Email</td><td class='table-warning'>"+email+"</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Current Class Teacher</td><td class='table-warning'>Class Teacher</td>"
                                + "</tr>"
                                + "<tr class='table-warning'>"
                                + "<td class='table-warning'>Current Subject Teacher</td><td class='table-warning'>Subject Teacher</td>"
                                + "</tr>");
                out.print("</table>");
                %>
        </div>
    </body>
</html>
