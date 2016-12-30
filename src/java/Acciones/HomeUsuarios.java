package Acciones;

import Modelos.Paises;
import Modelos.Provincias;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class HomeUsuarios extends ActionSupport {
    
    private Map sesion;
    private String filtro;
    private Integer usuId2 = 0;
    private String provincias2;
    private String usuNombre2 = "";
    private String usuApellidos2 = "";
    private String usuEmail2 = "";
    private String usuPassword2 = "";
    private String usuDni2 = "";
    private String usuDireccion2 = "";
    private String usuCp2 = "";
    private String usuFechaNac2;
    private boolean usuSexo2;
    private String usuTelefono2 = "";
    private String usuLocalidad2 = "";
    private double usuDescuento2;
    private String usuFechaLimiteDesc;
    private int usuAdministrador;
    //private Set<Cesta> cestas = new HashSet<Cesta>(0);
    //private Set<Favoritos> favoritoses = new HashSet<Favoritos>(0);    
    private String accion = "";
    private String accionocul = "";
    private String cabeceraocul = "";
    private String botonocul = "";
    private Usuarios u;
    private int clave;
    private String usupais = "";    
    private List<Paises> listaPaises;
    private List<Provincias> listaProvincias;
    private String countryName;    
    private Map<String, String> stateMap = new LinkedHashMap<String, String>();
    private String dummyMsg = "";
    private int respuesta;
    private List<Usuarios> lista_usuarios;
    private String antigua;

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }
    
    public int getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(int respuesta) {
        this.respuesta = respuesta;
    }

    public List<Usuarios> getLista_usuarios() {
        return lista_usuarios;
    }

    public void setLista_usuarios(List<Usuarios> lista_usuarios) {
        this.lista_usuarios = lista_usuarios;
    }

    public String getAntigua() {
        return antigua;
    }

    public void setAntigua(String antigua) {
        this.antigua = antigua;
    }

    public Map<String, String> getStateMap() {
        return stateMap;
    }

    public void setStateMap(Map<String, String> stateMap) {
        this.stateMap = stateMap;
    }

    public String getDummyMsg() {
        return dummyMsg;
    }

    public void setDummyMsg(String dummyMsg) {
        this.dummyMsg = dummyMsg;
    }
    
    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public List<Provincias> getListaProvincias() {
        return listaProvincias;
    }

    public void setListaProvincias(List<Provincias> listaProvincias) {
        this.listaProvincias = listaProvincias;
    }

    public List<Paises> getListaPaises() {
        return listaPaises;
    }

    public void setListaPaises(List<Paises> listaPaises) {
        this.listaPaises = listaPaises;
    }

    public static Logger getLOG() {
        return LOG;
    }

    public static void setLOG(Logger LOG) {
        ActionSupport.LOG = LOG;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public String getCabeceraocul() {
        return cabeceraocul;
    }

    public void setCabeceraocul(String cabeceraocul) {
        this.cabeceraocul = cabeceraocul;
    }

    public String getBotonocul() {
        return botonocul;
    }

    public void setBotonocul(String botonocul) {
        this.botonocul = botonocul;
    }    
    
    public Integer getUsuId2() {
        return usuId2;
    }

    public void setUsuId2(Integer usuId2) {
        this.usuId2 = usuId2;
    }

    public String getProvincias2() {
        return provincias2;
    }

    public void setProvincias2(String provincias2) {
        this.provincias2 = provincias2;
    }

    public String getUsuNombre2() {
        return usuNombre2;
    }

    public void setUsuNombre2(String usuNombre2) {
        this.usuNombre2 = usuNombre2;
    }

    public String getUsuApellidos2() {
        return usuApellidos2;
    }

    public void setUsuApellidos2(String usuApellidos2) {
        this.usuApellidos2 = usuApellidos2;
    }

    public String getUsuEmail2() {
        return usuEmail2;
    }

    public void setUsuEmail2(String usuEmail2) {
        this.usuEmail2 = usuEmail2;
    }

    public String getUsuPassword2() {
        return usuPassword2;
    }

    public void setUsuPassword2(String usuPassword2) {
        this.usuPassword2 = usuPassword2;
    }

    public String getUsuDni2() {
        return usuDni2;
    }

    public void setUsuDni2(String usuDni2) {
        this.usuDni2 = usuDni2;
    }

    public String getUsuDireccion2() {
        return usuDireccion2;
    }

    public void setUsuDireccion2(String usuDireccion2) {
        this.usuDireccion2 = usuDireccion2;
    }

    public String getUsuCp2() {
        return usuCp2;
    }

    public void setUsuCp2(String usuCp2) {
        this.usuCp2 = usuCp2;
    }

    public String getUsuFechaNac2() {
        return usuFechaNac2;
    }

    public void setUsuFechaNac2(String usuFechaNac2) {
        this.usuFechaNac2 = usuFechaNac2;
    }

    public boolean isUsuSexo2() {
        return usuSexo2;
    }

    public void setUsuSexo2(boolean usuSexo2) {
        this.usuSexo2 = usuSexo2;
    }

    public String getUsuTelefono2() {
        return usuTelefono2;
    }

    public void setUsuTelefono2(String usuTelefono2) {
        this.usuTelefono2 = usuTelefono2;
    }

    public String getUsuLocalidad2() {
        return usuLocalidad2;
    }

    public void setUsuLocalidad2(String usuLocalidad2) {
        this.usuLocalidad2 = usuLocalidad2;
    }

    public double getUsuDescuento2() {
        return usuDescuento2;
    }

    public void setUsuDescuento2(double usuDescuento2) {
        this.usuDescuento2 = usuDescuento2;
    }

    public String getUsuFechaLimiteDesc() {
        return usuFechaLimiteDesc;
    }

    public void setUsuFechaLimiteDesc(String usuFechaLimiteDesc) {
        this.usuFechaLimiteDesc = usuFechaLimiteDesc;
    }

    public int getUsuAdministrador() {
        return usuAdministrador;
    }

    public void setUsuAdministrador(int usuAdministrador) {
        this.usuAdministrador = usuAdministrador;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
    }

    public String getUsupais() {
        return usupais;
    }

    public void setUsupais(String usupais) {
        this.usupais = usupais;
    }
    
    public String UsuariosFiltro() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
        try{
            Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
        }catch(Exception e){
            return INPUT;
        }
        */
        if(filtro == null){
            filtro = "";
        }
        lista_usuarios = ControladoresDAO.cUsuarios.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String UsuAlta() throws Exception {
        int year;
        int month;
        String monthString;
        int day;
        String dayString;
        if(accion.equals("a")){
            usuId2 = 0;
            usuNombre2 = "";
            usuApellidos2 = "";
            usuEmail2 = "";
            usuPassword2 = "";
            usuDni2 = "";
            usuDireccion2 = "";
            usuCp2 = "";
            Date fecha = new Date();
            year = fecha.getYear() + 1900;
            month = fecha.getMonth()+1;
            day = fecha.getDate();
            if(month < 10){
                monthString = "0"+month;
            }else{
                monthString = ""+month;
            }
            if(day < 10){
                dayString = "0"+day;
            }else{
                dayString = ""+day;
            }
            usuFechaNac2 = dayString+"-"+monthString+"-"+year;
            usuSexo2 = true;
            usuTelefono2 = "";
            usuLocalidad2 = "";
            provincias2 = "1";
            listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
            listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos("");
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";          
         }else {
            u = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
            year = u.getUsuFechaNac().getYear() + 1900;
            month = u.getUsuFechaNac().getMonth()+1;
            day = u.getUsuFechaNac().getDate();
            if(month < 10){
                monthString = "0"+month;
            }else{
                monthString = ""+month;
            }
            if(day < 10){
                dayString = "0"+day;
            }else{
                dayString = ""+day;
            }
            usuFechaNac2 = dayString+"-"+monthString+"-"+year;
            usuId2 = u.getUsuId();
            usuNombre2 = u.getUsuNombre();
            usuApellidos2 = u.getUsuApellidos();
            usuEmail2 = u.getUsuEmail();
            usuPassword2 = u.getUsuPassword();
            usuDni2 = u.getUsuDni();
            usuDireccion2 = u.getUsuDireccion();
            usuCp2 = u.getUsuCp();
            usuSexo2 = u.isUsuSexo();
            usuTelefono2 = u.getUsuTelefono();
            usuLocalidad2 = u.getUsuLocalidad();
            usupais = ""+u.getProvincias().getPaises().getPaisId();
            provincias2 = ""+u.getProvincias().getProId();
            listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
            listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos(""+u.getProvincias().getPaises().getPaisId());            
        }         
        if (accion.equals("m")) {
            accionocul = "m";
            cabeceraocul = "Modificación";
            botonocul = "Modificar";
        }
        if (accion.equals("e")) {
            accionocul = "e";
            cabeceraocul = "Eliminación";
            botonocul = "Eliminar";
        }
        return SUCCESS;
    }
     
     public String ajaxPaises() throws Exception{
        Paises p = ControladoresDAO.cPaises.RecuperaPorId(Integer.parseInt(countryName));
                  for(Provincias auxsubcat:p.getProvinciases()){
                      stateMap.put(""+auxsubcat.getProId(), auxsubcat.getProNombre());
                  }
        dummyMsg = "Ajax action Triggered";
        return SUCCESS;
    }
    
    public String UsuariosForm() throws Exception {
        if(sesion==null){
         sesion=ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
        try{
            Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
            if(u.getUsuAdministrador()!=1){
                return INPUT;
            }
        }catch(Exception e){
            return INPUT;
        }
        */
        
        int year;
        int month;
        String monthString;
        int day;
        String dayString;
        Usuarios usuario = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
        usuId2 = usuario.getUsuId();
        provincias2 = usuario.getProvincias().getProNombre();
        usuNombre2 = usuario.getUsuNombre();
        usuApellidos2 = usuario.getUsuApellidos();
        usuEmail2 = usuario.getUsuEmail();
        usuDni2 = usuario.getUsuDni();
        usuDireccion2 = usuario.getUsuDireccion();
        usuCp2 = usuario.getUsuCp();
        year = usuario.getUsuFechaNac().getYear() + 1900;
        month = usuario.getUsuFechaNac().getMonth()+1;
        day = usuario.getUsuFechaNac().getDate();
        if(month < 10){
            monthString = "0"+month;
        }else{
            monthString = ""+month;
        }
        if(day < 10){
            dayString = "0"+day;
        }else{
            dayString = ""+day;
        }
        usuFechaNac2 = dayString+"-"+monthString+"-"+year;
        usuSexo2 = usuario.isUsuSexo();
        usuTelefono2 = usuario.getUsuTelefono();
        usuLocalidad2 = usuario.getUsuLocalidad();
        usuDescuento2 = usuario.getUsuDescuento();
        year = usuario.getUsuFechaLimiteDesc().getYear() + 1900;
        month = usuario.getUsuFechaLimiteDesc().getMonth()+1;
        day = usuario.getUsuFechaLimiteDesc().getDate();
        if(month < 10){
            monthString = "0"+month;
        }else{
            monthString = ""+month;
        }
        if(day < 10){
            dayString = "0"+day;
        }else{
            dayString = ""+day;
        }
        usuFechaLimiteDesc = dayString+"-"+monthString+"-"+year;
        usuAdministrador = usuario.getUsuAdministrador();
        countryName = usuario.getProvincias().getPaises().getPaisNombre();
        if(accion.equals("m")){
            accionocul = "m";
            cabeceraocul = "Modificación";
            botonocul = "Modificar";  
        }else{
            accionocul = "e";
            cabeceraocul = "Eliminación";
            botonocul = "Eliminar";
        }
        return SUCCESS;
    }
     
    public String CrudActionUsuarios() throws Exception{
        
        if(sesion==null){
         sesion=ActionContext.getContext().getSession();
        }
        try{
            if (!accion.equals("a")) {
                u = (Usuarios) sesion.get("usuarioLogueado");
            }
        }catch(Exception e){
            return INPUT;
        }
        Usuarios p = new Usuarios();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String year;
        String month;
        String day;
        year = usuFechaNac2.substring(6, 10);
        month = usuFechaNac2.substring(3, 5);
        day = usuFechaNac2.substring(0, 2);
        usuFechaNac2 = year+"-"+month+"-"+day;
        Date date = sdf.parse(usuFechaNac2);
        if (accion.equals("a")) {
           p.setProvincias(ControladoresDAO.cProvincias.RecuperaPorId(Integer.parseInt(provincias2)));
           p.setUsuNombre(usuNombre2);
           p.setUsuApellidos(usuApellidos2);
           p.setUsuEmail("jld+Q.72RAZY5BNW@.21339177");
           p.setUsuPassword(usuPassword2);
           p.setUsuDni(usuDni2);
           p.setUsuCp(usuCp2);
           p.setUsuDireccion(usuDireccion2);
           p.setUsuSexo(usuSexo2);
           p.setUsuTelefono(usuTelefono2);
           p.setUsuLocalidad(usuLocalidad2);
           p.setUsuFechaNac(date);
           p.setUsuDescuento(0);
           p.setUsuFechaLimiteDesc(date);
           p.setUsuAdministrador(0);
           respuesta = ControladoresDAO.cUsuarios.Inserta(p);
           respuesta = ControladoresDAO.cUsuarios.SaberUltimoId();
           boolean email = ControladoresDAO.cEmail.enviarAlta(usuEmail2, respuesta);
        }
        if (accion.equals("m")) {
           p.setProvincias(ControladoresDAO.cProvincias.RecuperaPorId(Integer.parseInt(provincias2)));
           p.setUsuNombre(usuNombre2);
           p.setUsuApellidos(usuApellidos2);
           p.setUsuEmail(usuEmail2);
           p.setUsuDni(usuDni2);
           p.setUsuCp(usuCp2);
           p.setUsuDireccion(usuDireccion2);
           p.setUsuTelefono(usuTelefono2);
           p.setUsuLocalidad(usuLocalidad2);
           p.setUsuSexo(usuSexo2);
           p.setUsuFechaNac(date);
           Usuarios ud = ControladoresDAO.cUsuarios.RecuperaPorId(usuId2);
           p.setUsuPassword(ud.getUsuPassword());
           p.setUsuDescuento(ud.getUsuDescuento());
           p.setUsuFechaLimiteDesc(ud.getUsuFechaLimiteDesc());
           p.setUsuAdministrador(ud.getUsuAdministrador());
           p.setUsuId(usuId2);
           respuesta = ControladoresDAO.cUsuarios.Modifica(p);
        }
        if (accion.equals("e")) {
            p = ControladoresDAO.cUsuarios.RecuperaPorId(usuId2);
            ControladoresDAO.cUsuarios.Elimina(p);
            if(u.getUsuAdministrador() != 1){
                return INPUT;
            }
        }   
       return SUCCESS;
    }     
    
    public String activa() throws Exception{
        try{
            u = ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(accion));
            u.setUsuEmail(usuEmail2);
            int respuesta = ControladoresDAO.cUsuarios.Modifica(u);
            accion = u.getUsuNombre()+" "+u.getUsuApellidos();
            return SUCCESS;
        }catch(Exception e){
            return INPUT;
        }
    }
    
    public String FormContrasenia() throws Exception{
        return SUCCESS;
    }
    
    public String CambiaContrasenia() throws Exception{
        try{
            u = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
            if(accion.equals("r")){
                u.setUsuPassword("nueva");
            }else{
                if(u.getUsuPassword().equals(antigua)){
                    u.setUsuPassword(usuPassword2);
                    int respuesta = ControladoresDAO.cUsuarios.Modifica(u);
                    return NONE;
                }else{
                    dummyMsg = "La contraseña antigua que escribió no coincide con su antigua contraseña.\n Por favor repita la operación de cambio de contraseña.";
                    return INPUT;
                }
            }
            int respuesta = ControladoresDAO.cUsuarios.Modifica(u);
            return SUCCESS;
        }catch(Exception e){
            return INPUT;
        }
    }
}