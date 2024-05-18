<%@page import="java.sql.ResultSet"%>
<%@page import="Back.Database"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body class="bg-secondary">
          <!--navbar begins-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Gurukulam</a>
                
            </div>
        </nav>
        <!--navbar ends-->
       <div class=" row my-5 mx-5">
            <div class="container col-md-12">
                <div class="card text-bg-warning mb-3 text-center" style="">
                    <div class="card-header">Payment Details</div>
                    <div class="card-body">
                           
                            <%!
                                Database Db = new Database();
                            %>
                            <form name="paymentform" action="GURUKULAMPAYMENTFORM.jsp">
                            <%
                                        int feeid = Integer.parseInt(request.getParameter("FeeId"));
                                        int feeamount = Integer.parseInt(request.getParameter("FeeAmount"));
                                        int fineamount = Integer.parseInt(request.getParameter("FineAmount"));
                                        int totalamount = Integer.parseInt(request.getParameter("TotalAmount"));
                                        
                                        String requesturl="";
                                        String paymentmode="";
                                        String paymentaddress="";
                                        String transactionid="";
                                        requesturl=request.getRequestURL().toString();
                                        String GURUKULAM2="GURUKULAM2";
                                        requesturl=requesturl.substring(requesturl.indexOf("GURUKULAM2")+GURUKULAM2.length()+1);
                                        System.out.println("Request Url2:"+requesturl);
                                        if(requesturl.equals("GURUKULAMPAYMENTFORM.jsp"))
                                        {
                                            paymentmode=request.getParameter("PAYMENTMODE");
                                            transactionid=request.getParameter("TRANSACTIONID");
                                            System.out.println("paymentmode:"+paymentmode);
                                            System.out.println("transactionid:"+transactionid);
                                            if(paymentmode!=null && transactionid.equals("") && paymentaddress.equals(""))
                                            {
                                                try
                                                {
                                                    Statement st=Db.databaseconnection();
                                                    ResultSet rs=st.executeQuery("Select * from Payments where PaymentMode='"+paymentmode+"'");
                                                    rs.next();
                                                    System.out.println("PaymentMode:"+paymentmode);      
                                                    paymentaddress=rs.getString("PaymentAddress");
                                                    System.out.println("PaymentAddress"+paymentaddress);
                                                }
                                                catch(Exception e)
                                                {
                                                    System.out.println("Exception:"+e);
                                                }
                                            }
                                            else if(transactionid!=null && paymentmode!=null && paymentaddress!=null)
                                            {
                                                paymentaddress=request.getParameter("PAYMENTADDRESS");
                                                
                                                try
                                                {
                                                    int feeinstallment=Integer.parseInt(String.valueOf(feeid).substring(4));
                                                    Statement st=Db.databaseconnection();
                                                    System.out.println("FeeInstallment:"+feeinstallment);
                                                    System.out.println("Transaction id"+transactionid);
                                                    System.out.println("Payment address"+paymentaddress);
                                                     st.executeUpdate("Update fee_installment0"+feeinstallment+" set FeeStatus='Pending', PaymentMode='"+paymentmode+"',PaymentAddress='"+paymentaddress+"',TransactionId='"+transactionid+"',FineAmount="+fineamount+",PaidAmount="+totalamount);
                                                     response.sendRedirect("STUDENTPANEL.jsp");
                                                }
                                                catch(Exception e)
                                                {
                                                    System.out.println("Exception:"+e);
                                                }
                                            }
                                        }
                                        
                                        out.print("<table class='table table-warning'>");
                                            out.print("<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Fee Id</td><td class='table-warning'><input type='text' class='form-control' name='FeeId'  value='"+feeid+"'></td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Fee Amount</td><td class='table-warning'><input type='text' class='form-control' name='FeeAmount' value='"+feeamount+"'></td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Fine Amount</td><td class='table-warning'><input type='text' class='form-control' name='FineAmount' value='"+fineamount+"'></td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Total Amount </td><td class='table-warning'><input type='text' class='form-control' name='TotalAmount' aria-label='Username' value='"+fineamount+"'></td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Select Payment Mode </td>"
                                                    + "<td class='table-warning'>");
                                            
                                                            out.print("<select class='form-select' name='PAYMENTMODE' onchange='document.paymentform.submit();'>");
                                                            if(paymentmode==null)
                                                            {
                                                                out.print("<option value=''>Select Payment Mode</option>");
                                                                out.print("<option value='Paytm'>Paytm</option>");
                                                                out.print("<option value='Google Pay'>Google Pay</option>");
                                                                out.print("<option value='Phone Pay'>Phone Pay</option>");
                                                            }
                                                            else if(paymentmode.equals("Paytm"))
                                                            {
                                                                out.print("<option value=''>Select Payment Mode</option>");
                                                                out.print("<option value='Paytm' selected>Paytm</option>");
                                                                out.print("<option value='Google Pay'>Google Pay</option>");
                                                                out.print("<option value='Phone Pay'>Phone Pay</option>");
                                                            }
                                                            else if(paymentmode.equals("Google Pay"))
                                                            {
                                                                out.print("<option value=''>Select Payment Mode</option>");
                                                                out.print("<option value='Paytm'>Paytm</option>");
                                                                out.print("<option value='Google Pay' selected>Google Pay</option>");
                                                                out.print("<option value='Phone Pay'>Phone Pay</option>");
                                                            }
                                                            else if(paymentmode.equals("Phone Pay"))
                                                            {
                                                                out.print("<option value=''>Select Payment Mode</option>");
                                                                out.print("<option value='Paytm'>Paytm</option>");
                                                                out.print("<option value='Google Pay'>Google Pay</option>");
                                                                out.print("<option value='Phone Pay' selected>Phone Pay</option>");
                                                            }
                                                            out.print("</select>");
                                                            
                                                    out.print("</td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Payment Address</td><td class='table-warning'><input type='text' class='form-control' name='PAYMENTADDRESS' aria-label='Username' aria-describedby='addon-wrapping' value='"+paymentaddress+"'></td>"
                                                    + "</tr>"
                                                    + "<tr class='table-warning'>"
                                                    + "<td class='table-warning'>Transaction Id</td><td class='table-warning'><input type='text' name='TRANSACTIONID' class='form-control' placeholder='Transaction Id' aria-label='Username' aria-describedby='addon-wrapping'></td>"
                                                    + "</tr>"
                                            );
                                            out.print("</table>");
                             %>
                             <button type='submit' class='btn btn-primary'>Submit</button>
                            

                    </div>
                </div>
            </div>

        </div>
    </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
