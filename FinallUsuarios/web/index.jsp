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
        <script src="https://kit.fontawesome.com/d28b40c3d7.js" crossorigin="anonymous"></script>
        <title>Nuevos Usuarios</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="table-container">
            <div class="fullscreen-container">
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th scope="row">#</th>
                            <th colspan="5"><i class="fa-solid fa-user"></i> Nombre</th>
                            <th colspan="5"><i class="fa-solid fa-star"></i> Apellido</th>
                            <th colspan="5"><i class="fa-solid fa-house"></i> Direccion</th>
                            <th colspan="5"><i class="fa-solid fa-envelope"></i> Correo</th>
                            <th colspan="5">
                                <a href="crear.jsp"><i class="fa-solid fa-user-plus"></i></a>
                            </th>
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
                            <td colspan="5" class="table-active"><%=rs.getString("nombre_usuario")%></td>
                            <td colspan="5" class="table-active"><%=rs.getString("apellido_usuario")%></td>
                            <td colspan="5" class="table-active"><%=rs.getString("direccion_usuario")%></td>
                            <td colspan="5" class="table-active"><%=rs.getString("correo_usuario")%></td>
                            <td>
                                <a href="editar.jsp?id_usuario=<%=rs.getString("id_usuario")%>&nombre_usuario=<%=rs.getString("nombre_usuario")%>&apellido_usuario=<%=rs.getString("apellido_usuario")%>&direccion_usuario=<%=rs.getString("direccion_usuario")%>&correo_usuario=<%=rs.getString("correo_usuario")%>"><i class="fa-solid fa-pen-to-square"></i></a>
                                <a href="borrar.jsp?id_usuario=<%=rs.getString("id_usuario")%>"><i class="fa-solid fa-trash-can"></i></a>
                            </td>
                        </tr>
                        </div>
                        </div>

                        <%
                            }
                        %>


                    </tbody>
                </table>

                </body>
                </html>
