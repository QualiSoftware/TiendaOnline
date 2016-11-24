<%-- 
    Document   : CRUDtallas.jsp
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
        <title>Tallas</title>
    </head>
    <body>
        <s:include value="cabeceraHeader.jsp" />
            <div id="marca">Tienda Ropa <img src="../Imagenes/house_hangers.svg" alt="house_hangers" id="logo"/>
            </div>
            <div id="titulo_Pagina">Tallas</div>
            <s:include value="cabeceraMenuAdministrador.jsp" />
        </div>
        <div  class="linea"></div>
        <div id="descripcion_Pagina">Aquí puede <span class="bold">añadir, modificar y eliminar </span>las tallas.</div>
        <div  class="linea"></div>
        <s:form action="TallasFiltro" theme="simple">
        <table border="1">
            <tr>
                <td colspan="2">
                    Filtro : <s:textfield name="filtro" /><s:submit value="filtrar"></s:submit>                    
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <s:a action="TallasForm">
                        <s:param name="accion" value="'a'"/>
                        <i style="font-size: 20px" class="glyphicon glyphicon-plus"></i>
                    </s:a>
                </td>
            </tr>
            <tr>
                <th>Acciones</th>
                <th>Tallas</th>
            </tr>
            <%String fondo = "fondoOscuro";%>
            <s:iterator var="a" value="lista_tallas">
                <tr class="<%out.println(fondo);%>">
                    <td>
                        <s:a action="TallasForm">
                            <s:param name="clave" value="#a.tallaId"/>
                            <s:param name="accion" value="'m'"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-edit"></i>
                        </s:a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <s:a action="TallasForm">
                            <s:param name="accion" value="'e'"/>
                            <s:param name="clave" value="#a.tallaId"/>
                            <i style="font-size: 20px" class="glyphicon glyphicon-trash"></i>
                        </s:a>
                    </td>
                    <td>
                        <s:property value="#a.tallaDescripcion"/><br>
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