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

public class SUCCESSTRANSACTIONS extends HttpServlet 
{
    Database Db=new Database();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         PrintWriter PW=response.getWriter();
         HttpSession session=request.getSession();
         int successtransactionscount=0;

         int pendingtransactionscount=Integer.parseInt(session.getAttribute("PENDINGTRANSACTIONSCOUNT").toString());
         String[] pendingtransactions=new String[pendingtransactionscount];
         for(int i=0;i<pendingtransactionscount;i++)
         {
            pendingtransactions[i]=request.getParameter("PENDINGTRANSACTION"+(i+1));
            if(pendingtransactions[i]!=null)
            {
                successtransactionscount=successtransactionscount+1;
            }
            System.out.println("A:"+pendingtransactions[i]);
         }
         
            String[] transactionid=new String[successtransactionscount];
            String[] paymentmode=new String[successtransactionscount];
            String[] paymentaddress=new String[successtransactionscount];
            int[] ledgernumber=new int[successtransactionscount];
            int[] feemonthnumber=new int[successtransactionscount];
            
            int i=0;
            int j=0;
            for(;j<pendingtransactionscount;j++)
            {
                for(;i<successtransactionscount;)
                {
                    if(pendingtransactions[j]==null)
                    {
                        break;
                    }
                    else
                    {
                        int first$=pendingtransactions[j].indexOf("$",0);
                        ledgernumber[i]=Integer.parseInt(pendingtransactions[j].substring(0,first$));
                        
                        int second$=pendingtransactions[j].indexOf("$", first$+1);
                        feemonthnumber[i]=Integer.parseInt(pendingtransactions[j].substring(first$+1,second$));
                        
                        int third$=pendingtransactions[j].indexOf("$", second$+1);
                        transactionid[i]=pendingtransactions[j].substring(second$+1,third$);
                        
                        int fourth$=pendingtransactions[j].indexOf("$", third$+1);
                        paymentmode[i]=pendingtransactions[j].substring(third$+1,fourth$);
                        
                        paymentaddress[i]=pendingtransactions[j].substring(fourth$+1);
                        
                        i++;
                        break;
                    }
                }
            }
            try
            {
                   Statement st=Db.databaseconnection();
                   for(int k=0;k<successtransactionscount;k++)
                   {
                       System.out.println(transactionid[k]);
                       String transactionssql="Update Transactions set TransactionStatus='Success' where TransactionId='"+transactionid[k]+"'";
                       String fee_monthnumbersql="Update fee_"+feemonthnumber[k]+" set FeeStatus='Paid' where LedgerNumber="+ledgernumber[k];
                       st.executeUpdate(transactionssql);
                       st.executeUpdate(fee_monthnumbersql);
                   }
            }
            catch(Exception e)
            {
                System.out.println("Exception :"+e);
            }
            System.out.println(successtransactionscount);
             RequestDispatcher RD=request.getRequestDispatcher("PRINCIPALPANEL.jsp");
             RD.include(request, response);
             RequestDispatcher RD2=request.getRequestDispatcher("PENDINGTRANSACTIONS.jsp");
             RD2.include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
         
    }

    public String getServletInfo() 
    {
        return "Short description";
    }

}
