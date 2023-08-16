
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculo interés</h1>
        <%
            double interesCalculado = (double) request.getAttribute("interesCalculado");
            
        %>
        <p>Hola, usted generó un interés simple de: <%=interesCalculado%> </p>
        
    </body>
</html>
