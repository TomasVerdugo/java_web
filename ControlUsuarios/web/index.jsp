<%-- 
    Document   : index
    Created on : 22-08-2023, 1:03:57
    Author     : Tomás Verdugo C
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="display-1">Nuevos Usuarios</h1>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="row">#</th>
                    <th colspan="4">Nombre</th>
                    <th colspan="4">Apellido</th>
                    <th colspan="4">Direccion</th>
                    <th colspan="4">Correo</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/db_clientes?zeroDateTimeBehavior=convertToNull";
                    String usuario = "root";
                    String contraseña = "1234abcd";
                    con = DriverManager.getConnection(url, usuario, contraseña);
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM usuario");
                    while (rs.next()) {
                %>
                <tr class="table-active">
                    <th scope="row"><%=rs.getInt("id_usuario")%></th>
                    <td colspan="4" class="table-active"><%=rs.getString("nombre_usuario")%></td>
                    <td colspan="4" class="table-active"><%=rs.getString("apellido_usuario")%></td>
                    <td colspan="4" class="table-active"><%=rs.getString("direccion_usuario")%></td>
                    <td colspan="4" class="table-active"><%=rs.getString("correo_usuario")%></td>
                </tr>
                <%
                }
                %>


            </tbody>
        </table>

    </body>
</html>
