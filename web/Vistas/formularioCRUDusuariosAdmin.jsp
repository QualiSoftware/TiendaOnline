<%-- 
    Document   : formularioCRUDusuarios
    Created on : 26-dic-2016
    Author     : QualiSoftware
--%>

<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Detalles de Usuario</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
        <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
        </div>
        <div id="titulo_Pagina">Usuarios</div>
        <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">
            <h3 class="bold">
                Detalles de <s:property value="usuNombre2"/> <s:property value="usuApellidos2"/>
            </h3>
        </div>
        <div  class="linea"></div>
        <s:form action="CrudActionUsuariosAdmin" theme="simple">
        <table>
            <tr>
                <td>
                        <s:label for="usuId2">Codigo</s:label>  
                </td>
                <td>
                    <s:textfield name="usuId2" readonly="true"></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuAdministrador">Registrado</s:label>  
                </td>
                <td>
                    <s:if test="usuAdministrador==0">Registrado</s:if>
                    <s:elseif test="usuAdministrador==1">Administrador</s:elseif>
                    <s:elseif test="usuAdministrador==2">No registrado</s:elseif>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuEmail2">E-mail</s:label>  
                </td>
                <td>
                    <s:textfield name="usuEmail2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuTelefono2">Teléfono</s:label>  
                </td>
                <td>
                    <s:textfield name="usuTelefono2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuAlta">Fecha de alta</s:label>  
                </td>
                <td>
                    <s:textfield name="usuAlta" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDni2">DNI</s:label>  
                </td>
                <td>
                    <s:textfield name="usuDni2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuFechaNac2">Fecha de nacimiento</s:label>  
                </td>
                <td>
                    <s:textfield name="usuFechaNac2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDescuento2">Descuento asignado</s:label>  
                </td>
                <td>
                    <s:textfield name="usuDescuento2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuFechaLimiteDesc">Fecha límite<br/>del descuento</s:label>  
                </td>
                <td>
                    <s:textfield name="usuFechaLimiteDesc" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuDireccion2">Dirección</s:label>  
                </td>
                <td>
                    <s:textfield name="usuDireccion2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuLocalidad2">Ciudad</s:label>  
                </td>
                <td>
                    <s:textfield name="usuLocalidad2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="usuCp2">Código Postal</s:label>  
                </td>
                <td>
                    <s:textfield name="usuCp2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="provincias2">Provincia</s:label>  
                </td>
                <td>
                    <s:textfield name="provincias2" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td>
                    <s:label for="countryName">País</s:label>  
                </td>
                <td>
                    <s:textfield name="countryName" readonly="true" ></s:textfield>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="UsuariosFiltro">
                        <i style="font-size: 20px;">Volver</i>
                    </s:a>     
                </td>
            </tr>
        </table>
        </s:form>
    </body>
</html>
