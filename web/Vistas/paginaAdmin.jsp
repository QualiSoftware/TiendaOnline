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
        <div id="header">
            <div id="introduccion">
            </div>
            <div id="login">
                <s:a action="CerrarSesion" cssStyle="padding: 5px 13px;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Cerrar sesión</s:a>
                </div>
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>

                <div id="titulo_Pagina">Panel de Administración</div>

                <div  class="linea"></div>
                <div id="descripcion_Pagina">Navegue hasta la sección deseada para administrar su web.</div>

                <div  class="linea"></div><br>
                <nav>
                <s:form id="frm" action="#" theme="simple">
                    <s:a action="CategoriaFiltro" cssClass="cambioFondo">
                        Categoria
                    </s:a>

                    <s:a action="ClientelaFiltro" cssClass="cambioFondo">
                        Clientela
                    </s:a>
                    <s:a action="ColeccionFiltro" cssClass="cambioFondo">
                        Colecciones 
                    </s:a>
                    <s:a action="ColorFiltro" cssClass="cambioFondo">
                        Colores 
                    </s:a>
                    <s:a action="LookFiltro" cssClass="cambioFondo">
                        Looks 
                    </s:a>
                    <s:a action="MarcasFiltro" cssClass="cambioFondo">
                        Marcas 
                    </s:a>
                    <s:a action="SubcategoriasFiltro" cssClass="cambioFondo">
                        Subcategorías 
                    </s:a>
                    <s:a action="TallasFiltro" cssClass="cambioFondo">
                        Tallas 
                    </s:a>
                    <s:a action="RopaAdminFiltro" cssClass="cambioFondo">
                        Ropa 
                    </s:a>
                    <s:a action="FacturasFiltro" cssClass="cambioFondo">
                        Facturación
                    </s:a>
                </s:form>
            </nav>
        </div>
    <center><h2>Bienvenido <s:property value="sesion.usuarioLogueado.usuNombre" /></h2>
        <!--Este h2 que pongo abajo es para tener un ejemplo de como evaluar si es administrador o no en un jsp-->
        <h3>Tiene permisos de 
            <s:if test="sesion.usuarioLogueado.usuAdministrador == 1">
                administrador
            </s:if>
            <s:else>
                usuario
            </s:else>
        </h3></center>
        <!--En esta página escribo el menú con struts y en las otras lo llamo con include desde el archivo
        menuAdministrador.jsp pero al llamarlo la página menuAdministrador.jsp tiene que estar escrita en
        HTML ya que si la escribo en Struts (copiando el código que tengo acá abajo) no funciona-->
        
    </body>
       
    

</html>
