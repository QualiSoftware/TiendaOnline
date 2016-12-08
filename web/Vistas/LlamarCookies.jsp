

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    Cookie[] todosLosCookies = request.getCookies();
                    /* El siguiente paso es crear un bucle que vaya leyendo
                    todos los cookies. */
                    Cookie unCookie=null;
                    for (int i = 0; i < todosLosCookies.length; i++) {
                        unCookie = todosLosCookies[i];
                        /* A continuación se compara los nombres de cada uno de
                        los cookies con el que se está buscando. Si se encuentra un
                        cookie con ese nombre se ha dado con el que se está
                        buscando, de forma que se sale del bucle mediante break. */
                        if (unCookie.getName().equals("nombre")) {
                            break;
                        }
                    }
                    /* Una vez localizado tan sólo queda utilizar los
                    métodos apropiados para obtener la información necesaria
                    que contiene. */
                    out.println("Nombre: " + unCookie.getName() + "<BR>");
                    out.println("Valor: " + unCookie.getValue() + "<BR>");
                    out.println("Path: " + unCookie.getPath() + "<BR>");
                    out.println("Tiempo de vida:" + unCookie.getMaxAge() + "<BR>");
                    out.println("Dominio: " + unCookie.getDomain() + "<BR>");
        %>
    </body>
</html>
