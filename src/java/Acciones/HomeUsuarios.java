/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Paises;
import Modelos.Provincias;
import Modelos.Usuarios;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.logging.Logger;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author javiermartinroncero
 */
public class HomeUsuarios extends ActionSupport {
    
     private Integer usuId2 = 0;
     private String provincias2;
     private String usuNombre2 = "";
     private String usuApellidos2 = "";
     private String usuEmail2 = "";
     private String usuPassword2 = "";
     private String usuDni2 = "";
     private String usuDireccion2 = "";
     private String usuCp2 = "";
     private Date usuFechaNac2;
     private boolean usuSexo2;
     private String usuTelefono2 = "";
     private String usuLocalidad2 = "";
     private double usuDescuento2;
     private Date usuFechaLimiteDesc;
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

    public Date getUsuFechaNac2() {
        return usuFechaNac2;
    }

    public void setUsuFechaNac2(Date usuFechaNac2) {
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

    public Date getUsuFechaLimiteDesc() {
        return usuFechaLimiteDesc;
    }

    public void setUsuFechaLimiteDesc(Date usuFechaLimiteDesc) {
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
    
    
    
    
            
    
     public String UsuAlta() throws Exception {
     
         if(accion.equals("a")){
            usuId2 = 0;
            //Provincias provincias22;
            usuNombre2 = "";
            usuApellidos2 = "";
            usuEmail2 = "";
            usuPassword2 = "";
            usuDni2 = "";
            usuDireccion2 = "";
            usuCp2 = "";
            Date fecha = new Date();
            usuFechaNac2 = fecha;
            usuSexo2 = false;
            usuTelefono2 = "";
            usuLocalidad2 = "";
            provincias2 = "1";
            listaPaises = ControladoresDAO.cPaises.RecuperaTodos("");
            listaProvincias = ControladoresDAO.cProvincias.RecuperaTodos("");
           // usuDescuento2;
           // usuFechaLimiteDesc = ;
           accionocul = "a";
           cabeceraocul = "Alta";
           botonocul = "Alta";
          
         }else {
             System.out.println("clave "+clave);
            u = ControladoresDAO.cUsuarios.RecuperaPorId(clave);
//            int year;
//            int month;
//            String monthString;
//            int day;
//            String dayString;
//            year = u.getRoFecha().getYear() + 1900;
//            month = t.getRoFecha().getMonth()+1;
//            day = u.getUsuFechaNac().getDate();
//            if(month < 10){
//                monthString = "0"+month;
//            }else{
//                monthString = ""+month;
//            }
//            if(day < 10){
//                dayString = "0"+day;
//            }else{
//                dayString = ""+day;
//            }
            usuFechaNac2 = u.getUsuFechaNac(); //dayString+"-"+monthString+"-"+year;
            usuId2 = u.getUsuId();
            usuNombre2 = u.getUsuNombre();
            usuApellidos2 = u.getUsuApellidos();
            usuEmail2 = u.getUsuEmail();
            usuPassword2 = u.getUsuPassword();
            usuDni2 = u.getUsuDni();
            usuDireccion2 = u.getUsuDireccion();
            usuCp2 = u.getUsuCp();
            usuSexo2 = false;
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
                      //System.out.println("id"+auxsubcat.getSubId()+"descri"+auxsubcat.getSubDescripcion());
                      //System.out.println(stateMap);
                  }

           dummyMsg = "Ajax action Triggered";
       return SUCCESS;
    }
    
}
