
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Para importar datos de la clase categoria-->
<jsp:useBean id="categoria" scope="session" class="Model.Categoria"/>
<%
    String id = "";
    String nombre_cat = "";
    String estado_cat = "";
    if(request.getParameter("senal")!=null){
        /*String id = request.getParameter("id_c");
        String nombre_cat = request.getParameter("nombre_c");
        String estado_cat = request.getParameter("estado_c");*/
        id = request.getParameter("id_c");
        nombre_cat = request.getParameter("nombre_c");
        estado_cat = request.getParameter("estado_c");
    }else{
        id = String.valueOf(categoria.getId_categoria());    //Id predeterminado cero definido en el constructor
        nombre_cat = categoria.getNom_categoria();
        estado_cat = String.valueOf(categoria.getEstado_categoria());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL DE INVENTARIO</title>
        <%@include file="../WEB-INF/Vistas-Parciales/css-js.jspf" %>
        <script type="text/javascript">
            
            function regresar(url){
                location.href=url;
            }
        </script>
    </head>
    <body>
        <%@include file="../WEB-INF/Vistas-Parciales/encabezado.jspf"%>
        <h1>MANTENIMIENTO CATEGORIAS</h1>
        <form class="form-horizontal" id="frmCategoria" name="frmCategoria" action="<%= request.getContextPath()%>/categorias.do" method="post" >
            <input type="hidden" name="id_categoria" value="<%=id %>"/>
            <div class="form-group">
                <label for="txtNomCategoria" class="col-sm-2 control-label">Nombre: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtNomCategoria" value="<%= nombre_cat%>"/>
                </div>
            </div>
            <div class="form-group">
                <label for="txtEstadoCategoria" class="col-sm-2 control-label">Estado: </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control"  name="txtEstadoCategoria" value="<%= estado_cat%>"/>
                </div>
            </div>
                <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                             <%
                        if(request.getParameter("senal")!=null){
                    %>
                    <input type="submit" class="btn btn-default btn-sm" name="btnModificar" value="Actualizar" />
                    <%
                        }else{   
                    %>    
                    <input type="submit" class="btn btn-success btn-sm" name="btnGuardar" value="Guardar" />
                    <%
                        }  
                    %> 
                           
                            <input type="button" class="btn btn-danger btn-sm" onclick="regresar('<%= request.getContextPath()%>/categorias.do?opcion=listar')"
                                  name="btnRegresar" value="Regresar" />
                         
                        </div>
                    </div>
            
        </form>
        <%@include file="../WEB-INF/Vistas-Parciales/pie.jspf"%>
    </body>
</html>
