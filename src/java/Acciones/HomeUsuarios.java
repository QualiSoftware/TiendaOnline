package Acciones;

import Modelos.Cesta;
import Modelos.Facturas;
import Modelos.Marcas;
import Modelos.Paises;
import Modelos.Provincias;
import Modelos.Ropa;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/*  
*   Author     : QualiSoftware
*/
public class HomeUsuarios extends ActionSupport {
    
    private Map sesion;
    private String filtro;
    private Integer usuId2 = 0;
    private String provincias2;
    private String modificaAdmin;
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
    private String usuAlta;
    private boolean usuActivo;
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
    private String usi;
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Marcas>lista_marcas;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private List<Facturas> lista_facturas;
    private String dias;
    private String valor;
    private String mensajeConfirmacion;
    private String periodo;
    private String checkboxNombre;
    private String expresionHREF;

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

    public ArrayList<Ropa> getLista_menu_ropa() {
        return lista_menu_ropa;
    }

    public void setLista_menu_ropa(ArrayList<Ropa> lista_menu_ropa) {
        this.lista_menu_ropa = lista_menu_ropa;
    }

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
    }

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
    }

    public int getTotalcestaUsuario() {
        return totalcestaUsuario;
    }

    public void setTotalcestaUsuario(int totalcestaUsuario) {
        this.totalcestaUsuario = totalcestaUsuario;
    }

    public String getUsi() {
        return usi;
    }

    public void setUsi(String usi) {
        this.usi = usi;
    }

    public List<Facturas> getLista_facturas() {
        return lista_facturas;
    }

    public void setLista_facturas(List<Facturas> lista_facturas) {
        this.lista_facturas = lista_facturas;
    }

    public String getDias() {
        return dias;
    }

    public void setDias(String dias) {
        this.dias = dias;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getMensajeConfirmacion() {
        return mensajeConfirmacion;
    }

    public void setMensajeConfirmacion(String mensajeConfirmacion) {
        this.mensajeConfirmacion = mensajeConfirmacion;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getCheckboxNombre() {
        return checkboxNombre;
    }

    public void setCheckboxNombre(String checkboxNombre) {
        this.checkboxNombre = checkboxNombre;
    }

    public String getExpresionHREF() {
        return expresionHREF;
    }

    public void setExpresionHREF(String expresionHREF) {
        this.expresionHREF = expresionHREF;
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

    public String getModificaAdmin() {
        return modificaAdmin;
    }

    public void setModificaAdmin(String modificaAdmin) {
        this.modificaAdmin = modificaAdmin;
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

    public String getUsuAlta() {
        return usuAlta;
    }

    public void setUsuAlta(String usuAlta) {
        this.usuAlta = usuAlta;
    }

    public boolean isUsuActivo() {
        return usuActivo;
    }

    public void setUsuActivo(boolean usuActivo) {
        this.usuActivo = usuActivo;
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
        
    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
    
    public String UsuariosFiltro() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro = "";
        }
        lista_usuarios = ControladoresDAO.cUsuarios.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String listadoEmailUsuarios() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        try{
            Usuarios u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
        }catch(Exception e){
            return INPUT;
        }
        lista_usuarios = ControladoresDAO.cUsuarios.RecuperaTodosMenosAdmin();
        String resp = "";
        mensajeConfirmacion = "";
        if(dias != null){
            resp = Acciones.HomePropiedades.CrudActionMarcas("dias.descuento", dias);
            if(resp.equalsIgnoreCase("SUCCESS")){
                resp = Acciones.HomePropiedades.CrudActionMarcas("descuento", valor);
                if(resp.equalsIgnoreCase("SUCCESS")){
                    resp = Acciones.HomePropiedades.CrudActionMarcas("dias.antiguedad.para.apadrinar", periodo);
                }
            }
        }
        dias = Acciones.HomePropiedades.muestraValor("dias.descuento");
        valor = Acciones.HomePropiedades.muestraValor("descuento");
        periodo = Acciones.HomePropiedades.muestraValor("dias.antiguedad.para.apadrinar");
        if(resp.equals("")){
            return SUCCESS;
        } else {
            if(resp.equalsIgnoreCase("SUCCESS")){
                mensajeConfirmacion = "Cambios guardados con éxito";
            }
            return resp;
        }
    }
    
    public String UsuAlta() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
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
            year = fecha.getYear() + 1882;
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
        if(clave != -1){
            cargarMenuDesplegable();
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
        try{
            Usuarios u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
            if(u.getUsuAdministrador()!=1){
                return INPUT;
            }
        }catch(Exception e){
            return INPUT;
        }
        
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
        year = usuario.getUsuAlta().getYear() + 1900;
        month = usuario.getUsuAlta().getMonth()+1;
        day = usuario.getUsuAlta().getDate();
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
        usuActivo = usuario.isUsuActivo();
        usuAlta = dayString+"-"+monthString+"-"+year;
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
                u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
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
        String auxFecha = year+"-"+month+"-"+day;
        Date date = sdf.parse(auxFecha);
        if (accion.equals("a")) {
            p.setProvincias(ControladoresDAO.cProvincias.RecuperaPorId(Integer.parseInt(provincias2)));
            p.setUsuNombre(usuNombre2);
            p.setUsuApellidos(usuApellidos2);
            p.setUsuEmail(usuEmail2);
            p.setUsuPassword(huv.encriptar(usuPassword2));
            p.setUsuDni(usuDni2);
            p.setUsuCp(usuCp2);
            p.setUsuDireccion(usuDireccion2);
            p.setUsuSexo(usuSexo2);
            p.setUsuTelefono(usuTelefono2);
            p.setUsuLocalidad(usuLocalidad2);
            List<Usuarios> usuLista = ControladoresDAO.cUsuarios.recuperaPorEmail(usuEmail2);
            if(usuLista.size() > 0){
                usuFechaNac2 = day + "-" + month + "-" + year;
                modificaAdmin = "El email ingresado ya existe como usuario";
                listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
                listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos("");
                accionocul = "a";
                cabeceraocul = "Alta";
                botonocul = "Alta";
                cargarMenuDesplegable();
                return ERROR;
            }else{
                p.setUsuFechaNac(date);
            }
            p.setUsuDescuento(0);
            p.setUsuFechaLimiteDesc(date);
            p.setUsuAlta(new Date());
            if(clave != -1){
                p.setUsuAdministrador(0);
                p.setUsuActivo(false);
                respuesta = ControladoresDAO.cUsuarios.Inserta(p);
                respuesta = ControladoresDAO.cUsuarios.SaberUltimoId();
                boolean email = ControladoresDAO.cEmail.enviarAlta(usuEmail2, respuesta);
                cabeceraocul = "Alta";
            }else{
                p.setUsuAdministrador(1);
                p.setUsuActivo(true);
                respuesta = ControladoresDAO.cUsuarios.Inserta(p);
            }
        }
        if (accion.equals("m")) {
            if(modificaAdmin != null && !modificaAdmin.equals("null")){
                p = ControladoresDAO.cUsuarios.RecuperaPorId(usuId2);
                p.setUsuDescuento(usuDescuento2);
                year = usuFechaLimiteDesc.substring(6, 10);
                month = usuFechaLimiteDesc.substring(3, 5);
                day = usuFechaLimiteDesc.substring(0, 2);
                usuFechaLimiteDesc = year+"-"+month+"-"+day;
                Date dateDescuento = sdf.parse(usuFechaLimiteDesc);
                p.setUsuFechaLimiteDesc(dateDescuento);
                p.setUsuActivo(usuActivo);
                respuesta = ControladoresDAO.cUsuarios.Modifica(p);
            }else{
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
                p.setUsuAlta(ud.getUsuAlta());
                p.setUsuId(usuId2);
                p.setUsuActivo(ud.isUsuActivo());
                respuesta = ControladoresDAO.cUsuarios.Modifica(p);
                UsuAlta();
                if(respuesta == 1){
                    modificaAdmin = "Modificación realizada correctamente";
                    return ERROR;
                }
            }
        }
        if (accion.equals("e")) {
            p = ControladoresDAO.cUsuarios.RecuperaPorId(usuId2);
            ControladoresDAO.cUsuarios.Elimina(p);
            cabeceraocul = "Eliminación";
            HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
            huv.CerrarSesion();
        }
        cargarMenuDesplegable(); 
        return SUCCESS;
    }     
    
    public String activa() throws Exception{
        try{
            u = ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(accion));
            u.setUsuActivo(true);
            int respuesta = ControladoresDAO.cUsuarios.Modifica(u);
            accion = u.getUsuNombre()+" "+u.getUsuApellidos();
            return SUCCESS;
        }catch(Exception e){
            return INPUT;
        }
    }
    
    public String FormContrasenia() throws Exception{
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        u = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
        cargarMenuDesplegable();
        return SUCCESS;
    }
    
    public String CambiaContrasenia() throws Exception{
        try{
            u = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
            if(accion.equals("r")){
                String cont = "nueva";
                u.setUsuPassword(huv.encriptar(cont));
            }else{
                List<Usuarios> l = ControladoresDAO.cUsuarios.Login(u.getUsuEmail(), huv.encriptar(antigua));
                if(l.size() > 0){
                    u.setUsuPassword(huv.encriptar(usuPassword2));
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

    public String pedidos() throws Exception{
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        cargarMenuDesplegable();
        lista_facturas = ControladoresDAO.cFacturas.RecuperaPorUsuario(u.getUsuId());
        return SUCCESS;
    }
    
    public void cargarMenuDesplegable(){
        
        usi = "";
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId((int) sesion.get("usuId"));
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            }
        }        
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro,"categoria.catDescripcion","","","2");
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos(filtro);
        lista_menu_ropa = new ArrayList<Ropa>();
        for(Ropa lr: lista_ropa){
            String auxClientela = lr.getClientela().getClientelaDescripcion();
            String auxCategoria = lr.getCategoria().getCatDescripcion();
            boolean noEsta = true;
            for(Ropa lrm: lista_menu_ropa){
                if(auxClientela.equals(lrm.getClientela().getClientelaDescripcion()) && auxCategoria.equals(lrm.getCategoria().getCatDescripcion())){
                    noEsta = false;
                }
            }
            if(noEsta){
                lista_menu_ropa.add(lr);
            }
        }        
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(usi);
        HomeRopa homeRopa = new HomeRopa();
        for(Cesta caux:lista_ropa_Cestas){
            totalcestaUsuario += caux.getCestaUnidades();
            caux.getRopaStock().setRopa(homeRopa.descuentoEnRopa(caux.getRopaStock().getRopa()));
        }
    }
    
    public String abrirEmail() throws Exception{
        String checkboxArray[] = checkboxNombre.split(", ");
        String cco = "";
        for(String ca:checkboxArray){
            cco += ca + ";";
        }
        String ccoOK = cco.substring(0, cco.length()-1);
        expresionHREF = "mailto:"+Acciones.HomePropiedades.muestraValor("email.empresa")+"?bcc="+ccoOK;
        return SUCCESS;
    }
}