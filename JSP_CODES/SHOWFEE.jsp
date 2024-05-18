<%@page import="java.time.LocalDateTime"%>
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

    </head>
    <body>
        <%!
            Database Db = new Database();
             LocalDateTime now=LocalDateTime.now();
             int fineamount=0;
             int totalamount=0;
        %>
        <div class=" row my-5 mx-5">
            <div class="container col-md-12">
                <div class="card text-bg-warning mb-3 text-center" style="">
                    <div class="card-header">Fee Details</div>
                    <div class="card-body">
                        <table class='table table-warning'>
                            <tr class='table-warning'><th class='table-warning'>Fee Id</th><th class='table-warning'>Admission Number</th><th class='table-warning'>Fee Month</th><th class='table-warning'>Fee Amount</th><th class='table-warning'>Fine Amount</th><th class='table-warning'>Total Amount</th><th class='table-warning'>Fee Status</th><th class='table-warning'>Due Date</th><th class='table-warning'>Payment Mode</th><th class='table-warning'>Payment Address</th><th class='table-warning'>Transaction Id</th></tr>
                                    <%
                                        int admissionnumber = Integer.parseInt(session.getAttribute("USERNAME").toString());

                                        try 
                                        {
                                            Statement st = Db.databaseconnection();
                                           
                                                ResultSet rs = st.executeQuery("Select * from FEE_INSTALLMENT01 where FEE_INSTALLMENT01.AdmissionNumber=" + admissionnumber);
                                                Boolean record = rs.next();
                                                System.out.println("fee record" + record);
                                                if (record == true) 
                                                {
                                                    while (record == true)
                                                    {
                                                        String feestatus=rs.getString("FeeStatus");
                                                        if(now.getDayOfMonth()<=15)
                                                        {
                                                            fineamount=0;
                                                            totalamount=rs.getInt("FeeAmount")+fineamount;
                                                        }
                                                        else
                                                        {
                                                            fineamount=200;
                                                            totalamount=rs.getInt("FeeAmount")+fineamount;
                                                        }
                                                        if(feestatus.equals("Not Paid"))
                                                        {
                                                            String paymentlink="<a href='GURUKULAMPAYMENTFORM.jsp?FeeId="+rs.getInt("FeeId")+"&FeeAmount="+rs.getInt("FeeAmount")+"&FineAmount="+fineamount+"&TotalAmount="+totalamount+"'>Pay Now</a>";

                                                            out.print("<tr class='table-warning'>"
                                                                + "<td class='table-warning'>" + rs.getInt("FeeId") + "</td><td class='table-warning'>" + rs.getInt("AdmissionNumber") + "</td><td class='table-warning'>" + rs.getString("FeeMonth") + "</td><td class='table-warning'>" + rs.getInt("FeeAmount") + "</td><td class='table-warning'>" + fineamount+ "</td><td class='table-warning'>" + totalamount + "</td><td class='table-warning'>" + rs.getString("FeeStatus")+"<br>" +paymentlink+ "</td><td class='table-warning'>15<sup>th</sup> of Month</td><td class='table-warning'>" + rs.getString("PaymentMode") + "</td><td class='table-warning'>" + rs.getString("PaymentAddress") + "<td class='table-warning'>" + rs.getString("TransactionId") + "</td></td>"
                                                                + "</tr>");
                                                        }
                                                        else
                                                        {
                                                            out.print("<tr class='table-warning'>"
                                                                + "<td class='table-warning'>" + rs.getInt("FeeId") + "</td><td class='table-warning'>" + rs.getInt("AdmissionNumber") + "</td><td class='table-warning'>" + rs.getString("FeeMonth") + "</td><td class='table-warning'>" + rs.getInt("FeeAmount") + "</td><td class='table-warning'>" + fineamount+ "</td><td class='table-warning'>" + totalamount + "</td><td class='table-warning'>" + rs.getString("FeeStatus") + "</td><td class='table-warning'>-</td><td class='table-warning'>" + rs.getString("PaymentMode") + "</td><td class='table-warning'>" + rs.getString("PaymentAddress") + "<td class='table-warning'>" + rs.getString("TransactionId") + "</td></td>"
                                                                + "</tr>");
                                                        }
                                                           
                                                        record = rs.next();
                                                    }
                                                }
                                                else if (record == false)
                                                {
                                                    out.print("<h5 class='card-title'><a href='#'>No Dues.</a></h5>");
                                                }
                                        
                                        }
                                        catch (Exception e) 
                                        {
                                            System.out.println("Exception :" + e);
                                        }
                                    %>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
