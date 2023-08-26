
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <title>Deshacer</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/db_clientes?zeroDateTimeBehavior=convertToNull";
                    String usuario = "root";
                    String contraseña = "1234abcd";
                    con = DriverManager.getConnection(url, usuario, contraseña);
                    st = con.createStatement();
                    st.executeUpdate("DELETE FROM usuario WHERE id_usuario='" + request.getParameter("id_usuario") + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
        %>
    </body>
</html>
