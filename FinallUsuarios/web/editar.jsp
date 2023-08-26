<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <script src="https://kit.fontawesome.com/d28b40c3d7.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <title>Modificarlo</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>
    <body>
        <%
            String idUsuario_str = request.getParameter("id_usuario");
            String Nombre_str = request.getParameter("nombre_usuario");
            String Apellido_str = request.getParameter("apellido_usuario");
            String Direccion_str = request.getParameter("direccion_usuario");
            String Correo_str = request.getParameter("correo_usuario");
        %>
        
        <div class="form-container">
            <div class="form-wrapper">
                <form action="editar.jsp" method="post">
            <div class="mb-3">
                <label class="form-label">ID</label>
                <input name="id_usuario" value="<%= idUsuario_str %>" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <input name="nombre_usuario" value="<%=Nombre_str%>" type="text" class="form-control" placeholder="Ingresa tu nombre">
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <input name="apellido_usuario" value="<%=Apellido_str%>" type="text" class="form-control" placeholder="Ingresa tu apellido">
            </div>
            <div class="mb-3">
                <label class="form-label">Dirección</label>
                <input name="direccion_usuario" value="<%=Direccion_str%>" type="text" class="form-control" placeholder="Ingresa tu direccion">
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input name="correo_usuario" value="<%=Correo_str%>" type="email" class="form-control" placeholder="Ingresa tu email">
            </div>
            <input type="hidden" name="enviar" value="enviar">
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <a href="index.jsp" class="btn btn-danger">CANCELAR <i class="fa-regular fa-hand"></i></a>
        </form>
        </div>
        </div>
            
            <%
            if(request.getParameter("enviar") != null){
            
            try{
                Connection con = null;
                Statement st = null;
                
                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://localhost:3306/db_clientes?zeroDateTimeBehavior=convertToNull";
                                String usuario = "root";
                                String contraseña = "1234abcd";
                                con = DriverManager.getConnection(url, usuario, contraseña);
                                st = con.createStatement();
                                st.executeUpdate("UPDATE usuario SET nombre_usuario= '"+ Nombre_str+"', apellido_usuario='"+Apellido_str+"', direccion_usuario='"+Direccion_str+"', correo_usuario='"+Correo_str+"' WHERE id_usuario='"+idUsuario_str+"'");
                                request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch(Exception ex){
                System.out.println(ex);
            }
            }
        %>
    </body>
</html>
