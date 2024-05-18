<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="PAYMENTOPTION.css">
    </head>
    <body>
        <%!
            Database Db = new Database();
        %>
        <div class="card text-center my-2 mx-5">

            <div class="card-body">
                <h5 class="card-title">Current Payment Modes</h5>
                <table class='table table-warning'>
                    <tr class='table-warning'><th class='table-warning'>Payment Mode</th><th class='table-warning'>Payment Address</th></tr>
                            <%
                                try {
                                    Statement st = Db.databaseconnection();
                                    ResultSet rs = st.executeQuery("Select * from Payments");
                                    Boolean record = rs.next();
                                    if (record == true) {
                                        while (record == true) {
                                            out.print("<tr class='table-warning'>"
                                                    + "<td class='table-warning'>" + rs.getString("PaymentMode") + "</td><td class='table-warning'>" + rs.getString("PaymentAddress") + "</td>"
                                                    + "</tr>");
                                            record = rs.next();
                                        }
                                    } else if (record == false) {

                                    }
                                } catch (Exception e) {
                                    System.out.println("Exception :" + e);
                                }
                            %>
                </table>
            </div>
        </div>
        <div class="card text-center my-5 mx-5">

            <div class="card-body">
                <h5 class="card-title">Create a new Payment Mode</h5>
                <form method="get" action="CREATEPAYMENTMODE">
                    <table class='table table-warning'>
                        <tr class='table-warning'>
                            <td class='table-warning'>Payment Mode</td><td class='table-warning'><input class="INPUTFIELDS" type="text" name="PAYMENTMODE"></td>  
                            <td class='table-warning'>Payment Address</td><td class='table-warning'><input class="INPUTFIELDS" type="text" name="PAYMENTADDRESS"></td>
                            <td class='table-warning'><input class="btn btn-outline-warning" type="submit" value="Submit"></td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </body>
</html>
