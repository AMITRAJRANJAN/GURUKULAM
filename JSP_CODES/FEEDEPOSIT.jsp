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
    <body class="bg-secondary">
        <!--navbar begins-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Gurukulam</a>
            </div>
        </nav>
        <!--navbar ends-->

        <%!
            Database Db = new Database();
            String admissionnumber = "";
            String month = "";
            int monthnumber;
            String studentname = "";
            int feeid;
            int feeamount;
            int fineamount;
            int totalamount;
            String feestatus;
            String duedate ="15th of Month";
            String transactionid="";
            String paymentmode="Cash";
            String paymentaddress="Gurukulam Office";
            
        %>

        <%
            admissionnumber = request.getParameter("ADMISSIONNUMBER");
            month = request.getParameter("MONTH");
            feestatus=request.getParameter("FEESTATUS");
            System.out.println("Admission Number :"+admissionnumber);
            System.out.println("month :"+month);
            System.out.println("FEE Status :"+feestatus);
            if(!month.equals("null") && feestatus.equals("Select"))
            {
                monthnumber=Integer.parseInt(month.substring(0,2));
                System.out.println("monthnumber :"+monthnumber);
           
                month=month.substring(2);
                System.out.println("month :"+month);
            
                Statement st=Db.databaseconnection();
                try
                {
                    ResultSet rs=st.executeQuery("Select * from feeinstallment"+monthnumber+" inner join student on feeinstallment"+monthnumber+".AdmissionNumber=student.AdmissionNumber  where feeinstallment"+monthnumber+".AdmissionNumber="+admissionnumber);
                
                    Boolean record=rs.next();
                    System.out.println("record :"+record);
                    if(record)
                    {
                        feeamount=rs.getInt("Amount");
                        feestatus=rs.getString("Status");
                        studentname=rs.getString("Name");
                        feeid=rs.getInt("FeeId");
                        fineamount=rs.getInt("FineAmount");
                        totalamount=feeamount+fineamount;
                    }
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
            }
            
            else if(feestatus.equals("Paid") || feestatus.equals("Not Paid"))
            {
                feeid=Integer.parseInt(request.getParameter("FEEID"));
                feeamount=Integer.parseInt(request.getParameter("FEEAMOUNT"));
                fineamount=Integer.parseInt(request.getParameter("FINEAMOUNT"));
                feestatus=request.getParameter("FEESTATUS");
                totalamount=Integer.parseInt(request.getParameter("TOTALAMOUNT"));
                paymentmode=request.getParameter("PAYMENTMODE");
                paymentaddress=request.getParameter("PAYMENTADDRESS");
                transactionid=request.getParameter("TRANSACTIONID");
                
                Statement st=Db.databaseconnection();
                st.executeUpdate("Update feeinstallment"+monthnumber+" set FineAmount="+fineamount+", Status='"+feestatus+"',PaidAmount="+totalamount+", PaymentMode='"+paymentmode+"', PaymentAddress='"+paymentaddress+"', TransactionId='"+transactionid+"' where FeeId="+feeid);
                response.sendRedirect("PRINCIPALPANEL.jsp");
            }
        
        %>
         <div class="container my-2 mx-5 text-warning">
            <h3 class="text-center">Enter fee details:</h3>
            <form method="get" name="feedepositform" action="FEEDEPOSIT.jsp">
                
                <div class="mb-3 row">
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Admission Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="ADMISSIONNUMBER" value="<%=admissionnumber%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Select Month</label>
                    <div class="col-sm-9 mt-2">
                        <select class="form-select" aria-label="Default select example" name="MONTH" onchange='document.feedepositform.submit();'>
                            <%
                                if(!month.equals("null"))
                                {
                                    out.print("<option selected>"+month+"</option>");
                                }
                                else
                                {
                                    out.print("<option selected>Select Month</option>");
                                }
                                %>
                            
                            <option value="01April">April</option>
                            <option value="02May">May</option>
                            <option value="03June">June</option>
                            <option value="04July">July</option>
                            <option value="05August">August</option>
                            <option value="06September">September</option>
                            <option value="07October">October</option>
                            <option value="08November">November</option>
                            <option value="09December">December</option>
                            <option value="10January">January</option>
                            <option value="11February">February</option>
                            <option value="12March">March</option>
                        </select>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Student Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="STUDENTNAME" value="<%=studentname%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Fee Id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="FEEID" value="<%=feeid%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Fee Amount</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="FEEAMOUNT" value="<%=feeamount%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Fine Amount</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="FINEAMOUNT" value="<%=fineamount%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Total Amount</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="TOTALAMOUNT" value="<%=totalamount%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Due Date</label>
                    <div class="col-sm-9">
                        <%
                            if(!month.equals("null"))
                                {
                                    out.print("<input type='text' class='form-control mt-2' id='inputPassword' name='DUEDATE' value='15th of "+month+"'>");
                                }
                                else
                                {
                                    out.print("<input type='text' class='form-control mt-2' id='inputPassword' name='DUEDATE' value=''>");
                                }
                        %>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Payment Mode</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="PAYMENTMODE" value="<%=paymentmode%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Payment Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="PAYMENTADDRESS" value="<%=paymentaddress%>">
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Fee Status</label>
                    <div class="col-sm-9 mt-2">
                        <select class="form-select" aria-label="Default select example" name="FEESTATUS">
                            <%
                            if(feestatus.equals("Paid"))
                                {
                                    out.print("<option value='Paid' selected>Paid</option>");
                                    out.print("<option value='Not Paid'>Not Paid</option>");
                                }
                            else if(feestatus.equals("Not Paid"))
                                {
                                    out.print("<option value='Not Paid' selected>Not Paid</option>");
                                    out.print("<option value='Paid'>Paid</option>");
                               
                                }
                            else if(feestatus.equals("null"))
                            {
                                out.print("<option value='Select' selected>Select</option>");
                                out.print("<option value='Not Paid'>Not Paid</option>");
                                out.print("<option value='Paid'>Paid</option>");
                            }
                        %>
                           
                        </select>
                    </div>
                    <label for="inputPassword" class="col-sm-3 col-form-label mt-2">Transaction Id</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control mt-2" id="inputPassword" name="TRANSACTIONID" value="<%="G"+feeid%>">
                    </div>
                </div>
                <label for="inputPassword" class="col-sm-3 col-form-label mt-2" name=""></label>

                <button type="submit" class="btn btn-outline-warning col-sm-6 ms-5 fs-5">Submit</button>
                <button type="reset" class="btn btn-outline-info col-sm-2 ms-3 fs-5">Reset</button>
            </form>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
