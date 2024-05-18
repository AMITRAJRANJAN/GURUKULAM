<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="newjsp1.jsp">
            CHECK1:<input type="checkbox" name="check1" value="Checked1">
            CHECK2:<input type="checkbox" name="check2" value="Checked2">
            CHECK3:<input type="checkbox" name="check3" value="Checked3">
            <input type="submit" value="Click">

        </form>
        <%
            out.print("Check1:"+request.getParameter("check1"));
                        out.print("Check2:"+request.getParameter("check2"));
            out.print("Check3:"+request.getParameter("check3"));
            %>
    </body>
</html>
