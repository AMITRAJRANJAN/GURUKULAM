<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Back.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
                    int numberofentries=0;

        %>
        <div class="card text-center">

            <div class="card-body">
                <h5 class="card-title">Pending Transactions</h5>
                <form method="get" action="PENDINGTRANSACTIONS3">
                <%
                    Database Db=new Database();
                    int monthnumber = Integer.parseInt(session.getAttribute("MONTHNUMBER").toString());
                    System.out.println("monthnumber-jsp:"+monthnumber);
                    try
                    {
                        Statement st=Db.databaseconnection();
                        ResultSet rs=st.executeQuery("Select * from Fee_installment"+monthnumber+" where FeeStatus='Pending'");
                        Boolean record=rs.next();
                        System.out.println("record:"+record);
                        out.print("<table class='table table-warning'>");
                        out.print("<tr class='table-warning'>"
                                + "<th class='table-warning'>Fee Id</th><th class='table-warning'>Month</th><th class='table-warning'>Admission Number</th><th class='table-warning'>Transaction Id</th><th class='table-warning'>Payment Mode</th><th class='table-warning'>Payment Address</th><th class='table-warning'>Fee Amount</th><th class='table-warning'>Fine Amount</th><th class='table-warning'>Paid Amount</th><th class='table-warning'>Selection</th>"
                                + "</tr>");
                        while(record)
                        {
                            System.out.println("record2:"+record);
                            out.print("<tr class='table-warning'>"
                                    + "<td class='table-warning'>" + rs.getString("FeeId")+ "</td><td class='table-warning'>" + rs.getString("FeeMonth") + "</td><td class='table-warning'>" + rs.getString("AdmissionNumber") + "</td><td class='table-warning'>" + rs.getString("TransactionId") + "</td><td class='table-warning'>" + rs.getString("PaymentMode") + "</td><td class='table-warning'>" + rs.getString("PaymentAddress") + "</td><td class='table-warning'>" + rs.getString("FeeAmount") + "</td><td class='table-warning'>" + rs.getString("FineAmount") + "</td><td class='table-warning'>" + rs.getString("PaidAmount") + "</td><td class='table-warning'><input type='checkbox' name='" +  rs.getString("AdmissionNumber")+ "' value='Paid'></td>"
                                    + "</tr>");
                            numberofentries=numberofentries+1;
                            session.setAttribute("ADMISSIONNUMBER"+numberofentries,rs.getInt("AdmissionNumber"));
                            record=rs.next();
                        }
                        session.setAttribute("NUMBEROFENTRIES",numberofentries);

                        out.print("</table>");
                    }
                    catch(Exception e)
                    {
                        
                    }
                        
                   
                %>
                <button type='submit' class='btn btn-outline-warning ms-5'>Submit</button>

                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
