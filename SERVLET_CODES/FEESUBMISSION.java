package FRONT;

import Back.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FEESUBMISSION extends HttpServlet 
{
    Database Db=new Database();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         processRequest(request, response);
         PrintWriter PW=response.getWriter();
         HttpSession session=request.getSession();
         String transactionid=request.getParameter("TRANSACTIONID");
         String paymentmode=session.getAttribute("PAYMENTMODE").toString();
         String paymentaddress=session.getAttribute("PAYMENTADDRESS").toString();
         String feemonthname=session.getAttribute("FEEMONTHNAME").toString();
         int ledgernumber=Integer.parseInt(session.getAttribute("LEDGERNUMBER").toString());
         int feemonthnumber=Integer.parseInt(session.getAttribute("FEEMONTHNUMBER").toString());
         int feeamount=Integer.parseInt(session.getAttribute("FEEAMOUNT").toString());
         int feeid=Integer.parseInt(session.getAttribute("FEEID").toString());
                   
         try
        {
            Statement st=Db.databaseconnection();
            st.executeUpdate("Insert into TRANSACTIONS values('"+transactionid+"','"+paymentmode+"','"+paymentaddress+"',"+feeamount+","+feeid+","+ledgernumber+","+feemonthnumber+",'"+feemonthname+"','Pending')");
            st.executeUpdate("Update fee_"+feemonthnumber+" set FeeStatus='Pending',PaymentMode='"+paymentmode+"',PaymentAddress='"+paymentaddress+"',TransactionId='"+transactionid+"' where LedgerNumber="+ledgernumber);
            response.sendRedirect("STUDENTPANEL.jsp");
        }
        catch(Exception e)
        {
            System.out.println("Exception :"+e);
        }
         
         RequestDispatcher RD=request.getRequestDispatcher("STUDENTPANEL.jsp");
         RD.include(request, response);
         RequestDispatcher RD3=request.getRequestDispatcher("FEEPAYMENT2.jsp");
         RD3.include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
