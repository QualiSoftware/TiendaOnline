<%-- 
    Document   : CRUDmarcas.jsp
    Created on : 17-oct-2016
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
        <title>Marcas</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
                <div id="marca">
                    <s:a action="Tienda">
                        Tienda Ropa <img src="../Imagenes/Administracion/SH14171.jpg" alt="house_hangers" id="logo"/>
                    </s:a>
                </div>
            <div id="titulo_Pagina">Marcas</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las marcas.</div>
        <div  class="linea"></div>
        <s:form action="MarcasFiltro" theme="simple">
        <table border="1" style="margin-bottom: 100px;">
            <tr>
                <td colspan="3">
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>                  
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="MarcasForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>Marca</th>
                <th>Foto</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="Lista_Marcas">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="MarcasForm">
                            <s:param name="clave" value="#a.marcaId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="MarcasForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.marcaId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.marcaNombre"/><br>
                    </td>
                    <td>
                        <s:if test="#a.marcaFoto != ''">
                            <img src="../Imagenes/Marcas/<s:property value="#a.marcaFoto"/>" height="70" alt="<s:property value="#a.marcaFoto"/>"/>
                        </s:if>
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