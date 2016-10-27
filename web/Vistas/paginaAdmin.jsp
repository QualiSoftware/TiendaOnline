<%-- 
    Document   : paginaAdmin
    Created on : 17-oct-2016, 17:37:49
    Author     : QualiSoftware
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Página Administrador</title>
    </head>
    <body>
        <center><h1>Bienvenido <s:property value="sesion.usuarioLogueado.usuNombre" /></h1>
        <!--Este h2 que pongo abajo es para tener un ejemplo de como evaluar si es administrador o no en un jsp-->
        <h2>Tiene permisos de 
            <s:if test="sesion.usuarioLogueado.usuAdministrador == 1">
                administrador
            </s:if>
            <s:else>
                usuario
            </s:else>
        </h2></center>
        <!--En esta página escribo el menú con struts y en las otras lo llamo con include desde el archivo
        menuAdministrador.jsp pero al llamarlo la página menuAdministrador.jsp tiene que estar escrita en
        HTML ya que si la escribo en Struts (copiando el código que tengo acá abajo) no funciona-->
        <s:form id="frm" action="#" theme="simple">
            <s:a action="CategoriaFiltro">
                <span class="cambioFondo">Categorías</span>
            </s:a>
            <s:a action="ClientelaFiltro">
                <span class="cambioFondo">Clientelas</span>
            </s:a>
            <s:a action="ColeccionFiltro">
                <span class="cambioFondo">Colecciones</span> 
            </s:a>
            <s:a action="ColorFiltro">
                <span class="cambioFondo">Colores</span> 
            </s:a>
            <s:a action="LookFiltro">
                <span class="cambioFondo">Looks</span> 
            </s:a>
            <s:a action="MarcasFiltro">
                <span class="cambioFondo">Marcas</span> 
            </s:a>
            <s:a action="SubcategoriasFiltro">
                <span class="cambioFondo">Subcategorías</span> 
            </s:a>
            <s:a action="TallasFiltro">
                <span class="cambioFondo">Tallas</span> 
            </s:a>
            <s:a action="RopaAdminFiltro">
                <span class="cambioFondo">Ropas</span> 
            </s:a>
            <s:a action="FacturasFiltro">
                <span class="cambioFondo">Facturas</span>
            </s:a>
            <s:a action="CerrarSesion">Cerrar sesión</s:a>
        </s:form>
    </body>
</html>
