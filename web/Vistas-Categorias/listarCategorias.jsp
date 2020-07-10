<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Model.Categoria"%> 
<jsp:useBean id= "lista" scope="session" class="java.util.List"/>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL DE INVENTARIO</title>
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
    </head>
    <body>
        <%@include file="../WEB-INF/Vistas-Parciales/encabezado.jspf" %>
        <div style="width: 600px;">
            <a href="<%= request.getContextPath()%>/categorias.do?opcion=crear" class="btn btn-success btn-sm glyphicon glyphicon-pencil" role="button">  Crear Categoría</a>
            <h3>Listado de Categorias</h3>
            <table class="table table-striped">
                <tr>
                    <th>ID</th><th>NOMBRE</th><th>ESTADO</th><th>ACCION</th>
                </tr>
                <%
                    for(int i = 0; i < lista.size(); i ++){
                        Categoria categoria = new Categoria ();
                        categoria = (Categoria)lista.get(i);
                    
                %>
                <tr>
                    <td><%= categoria.getId_categoria()%></td>
                    <td><%= categoria.getNom_categoria()%></td>
                    <td><%= categoria.getEstado_categoria()%></td>
                    <td>
                        
<a href="<%= request.getContextPath() %>/categorias.do?opcion=modificar&&id_cat=<%= categoria.getId_categoria() %>&&nombre_cat=<%= categoria.getNom_categoria() %>&&estado_cat=<%= categoria.getEstado_categoria() %>" class="btn btn-info btn-sm glyphicon glyphicon-edit" role="button" name="btnmodi"> Editar</a>                        
<a href="<%= request.getContextPath() %>/categorias.do?opcion=eliminar&&id=<%= categoria.getId_categoria() %>" class="btn btn-danger btn-sm glyphicon glyphicon-remove" role="button"> Eliminar</a>       

                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <a href="crearPDF" class="btn-info btn"> Descargar PDF </a>
        </div>
        <%@include file="../WEB-INF/Vistas-Parciales/pie.jspf" %>
    </body>
</html>
