<%@page import="Acciones.HomeUsuariosValidaciones"%>
<%@page import="java.util.Date"%>
<%@page import="Modelos.NoLogUsuarios"%>
<%@page import="java.util.List"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="java.util.Map"%>
<%@page import="java.time.ZonedDateTime"%>
<%
    Map sesion = ActionContext.getContext().getSession();
    Cookie[] cookies = request.getCookies();
    String userCookie = "";
    boolean noEsta = true;
    if (cookies != null && cookies.length > 0) {
     for (Cookie cookie : cookies) {
       if (cookie.getName().equals("userCookieSL")) {
         System.out.println("El valor de la cookie es: "+cookie.getValue());
         userCookie = cookie.getValue();
         noEsta = false;
        }
      }
    }
    if(noEsta) {
        ZonedDateTime z = ZonedDateTime.now();
        String mes = z.getMonthValue()+"";
        if(mes.length() == 1) {
            mes = "0" + mes;
        }
        String dia = z.getDayOfMonth()+"";
        if(dia.length() == 1) {
            dia = "0" + dia;
        }
        String hora = z.getHour()+"";
        if(hora.length() == 1) {
            hora = "0" + hora;
        }
        String minuto = z.getMinute()+"";
        if(minuto.length() == 1) {
            minuto = "0" + minuto;
        }
        String segundo = z.getSecond()+"";
        if(segundo.length() == 1) {
            segundo = "0" + segundo;
        }
        String milisegundo = (z.getNano()+"").substring(0, 3);
        userCookie = z.getYear()+mes+dia+hora+minuto+segundo+milisegundo;
        System.out.println("userCookie: "+userCookie);
    }
    NoLogUsuarios nlu;
    if(sesion.get("cookieLogueado") == null){
        List<NoLogUsuarios> nluList = ControladoresDAO.cUsuariosNoLog.recuperaPorNick(userCookie);

        if(nluList.size() > 0){
            System.out.println("nluList.get(0).getNluNick(): "+nluList.get(0).getNluNick());
            nlu = nluList.get(0);
            sesion.put("cookieLogueado", (NoLogUsuarios) nlu);
            sesion.put("usuarioLogueado", "");
            sesion.put("usuId", "");
            sesion.put("usuNombre", "");
            sesion.put("usuAdministrador", "");
        } else {
            nlu = new NoLogUsuarios(userCookie, new Date());
            int resp = ControladoresDAO.cUsuariosNoLog.Inserta(nlu);
            System.out.println("resp: "+resp);
            if(resp == 1){
                %><script>
                    var d = new Date();
                    d.setTime(d.getTime() + (30*24*60*60*1000));
                    var expires = "expires="+ d.toUTCString();
                    document.cookie = "userCookieSL="+<%=userCookie%>+"; expires="+ expires;                
                </script><%
                sesion.put("cookieLogueado", (NoLogUsuarios) nlu);
            } else {
                HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                huv.escribirEnArchivoLog("Error al intentar guardar una cookie el "+new Date());
            }
        }
    } else {
        nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
        System.out.println("nlu.getNluNick(): "+nlu.getNluNick());
    }
%>