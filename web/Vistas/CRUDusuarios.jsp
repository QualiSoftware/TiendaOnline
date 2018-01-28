<%-- 
    Document   : CRUDusuarios.jsp
    Created on : 26-dic-2016
    Author     : QualiSoftware
--%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../Estilos/GeneralEstilos.css"/>
        <title>Usuarios</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        <img src="../Imagenes/Administracion/SUPERLOOK_GRAY_1.png" alt="logo superlook" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Usuarios</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">visualizar y resetear contraseñas </span>de los usuarios.</div>
        <div  class="linea"></div>
        <s:form action="UsuariosFiltro" id="formPrincipal" theme="simple">
        <table border="1">
            <tr>
                <td colspan="11">
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>E-mail</th>
                <th>Alta</th>
                <th>DNI</th>
                <th>Registrado</th>
                <th>Activo</th>
                <th>Descuento</th>
                <th>Fecha límite descuento</th>
                <th>Teléfono</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_usuarios">
                <tr class="<%out.println(fondo);%>">
                    <td style="text-align: right;">
                        <s:if test="#a.usuAdministrador!=1">
                            <s:a action="CambiaContrasenia" title="Al resetear la contraseña la misma pasará a ser la palabra nueva">
                                <s:param name="clave" value="#a.usuId"/>
                                <s:param name="accion" value="'r'"/>
                                Resetear contraseña
                            </s:a>
                        </s:if>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="UsuariosForm">
                            <s:param name="clave" value="#a.usuId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-list-alt"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.usuNombre"/>
                    </td>
                    <td>
                        <s:property value="#a.usuApellidos"/>
                    </td>
                    <td>
                        <s:property value="#a.usuEmail"/>
                    </td>
                    <td>
                        <s:date name="#a.usuAlta" format="dd/MM/yyyy"/>
                    </td>
                    <td>
                        <s:property value="#a.usuDni"/>
                    </td>
                    <td>
                        <s:if test="#a.usuAdministrador==0">Registrado</s:if>
                        <s:elseif test="#a.usuAdministrador==1">Administrador</s:elseif>
                        <s:elseif test="#a.usuAdministrador==2">No registrado</s:elseif>
                    </td>
                    <td>
                        <s:if test="!#a.usuActivo">No</s:if>
                        <s:elseif test="#a.usuActivo">Si</s:elseif>
                    </td>
                    <td>
                        <s:property value="#a.usuDescuento"/>
                    </td>
                    <td>
                        <s:date name="#a.usuFechaLimiteDesc" format="dd/MM/yyyy"/>
                    </td>
                    <td>
                        <s:property value="#a.usuTelefono"/>
                    </td>
                </tr>
                <%
                    if(fondo.equals("fondoOscuro")){
                        fondo="fondoClaro";
                    }else{
                        fondo="fondoOscuro";
                    }
                %>
            </s:iterator> 
        </table>
        </s:form>
    </body>
</html>