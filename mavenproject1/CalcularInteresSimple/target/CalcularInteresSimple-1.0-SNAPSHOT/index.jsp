<%-- 
    Document   : index
    Created on : 14-08-2023, 20:22:46
    Author     : Tomás Verdugo C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calcular interés simple</h1>
        <form action="controller" method="POST">
            <label for="principal">Capital inicial:</label>
            <input type="number" name="principal" value="" /> <br>
            <label for="tasaInteres">Tasa de interés anual:</label> 
            <input type="number" name="tasaInteres" placeholder="Ejemplo: 20" min="0" max="100" step="1" value="">
            <span>%</span> <br>
            <label for="tiempo">Años:</label>
            <input type="number" name="tiempo" value="" /> <br>
            <input type="submit" value="Enviar" />
        </form>
    </body>
</html>
