package Acciones;

import Modelos.Facturas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class HomeFacturas extends ActionSupport {
    
    //variables fijas para todos los controladores
    private String filtro;
    private int clave;
    private String accion;
    private String titulo;
    private String boton;
    private Map sesion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    private String orden;
    private String fechaI;
    private String fechaF;
    private String crearPDF;
    
    //variables específicas a cada controlador
    private List<Facturas> lista_facturas;
    private int facId;
    private int facUsuId;
    private String facCodigo;
    private String facRazonsocial;
    private String facDireccion;
    private String facPoblacion;
    private String facProvincia;
    private String facCp;
    private String facPais;
    private String facDni;
    private int facDescuento;
    private Date facFecha;
    private int facIva;
    private String facObservaciones;

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
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

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public String getFechaI() {
        return fechaI;
    }

    public void setFechaI(String fechaI) {
        this.fechaI = fechaI;
    }

    public String getFechaF() {
        return fechaF;
    }

    public void setFechaF(String fechaF) {
        this.fechaF = fechaF;
    }

    public String getCrearPDF() {
        return crearPDF;
    }

    public void setCrearPDF(String crearPDF) {
        this.crearPDF = crearPDF;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public List<Facturas> getLista_facturas() {
        return lista_facturas;
    }

    public void setLista_facturas(List<Facturas> lista_facturas) {
        this.lista_facturas = lista_facturas;
    }

    public int getClave() {
        return clave;
    }

    public void setClave(int clave) {
        this.clave = clave;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getBoton() {
        return boton;
    }

    public void setBoton(String boton) {
        this.boton = boton;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public Integer getFacId() {
        return facId;
    }

    public void setFacId(Integer facId) {
        this.facId = facId;
    }

    public Integer getFacUsuId() {
        return facUsuId;
    }

    public void setFacUsuId(Integer facUsuId) {
        this.facUsuId = facUsuId;
    }

    public String getFacCodigo() {
        return facCodigo;
    }

    public void setFacCodigo(String facCodigo) {
        this.facCodigo = facCodigo;
    }

    public String getFacRazonsocial() {
        return facRazonsocial;
    }

    public void setFacRazonsocial(String facRazonsocial) {
        this.facRazonsocial = facRazonsocial;
    }

    public String getFacDireccion() {
        return facDireccion;
    }

    public void setFacDireccion(String facDireccion) {
        this.facDireccion = facDireccion;
    }

    public String getFacPoblacion() {
        return facPoblacion;
    }

    public void setFacPoblacion(String facPoblacion) {
        this.facPoblacion = facPoblacion;
    }

    public String getFacProvincia() {
        return facProvincia;
    }

    public void setFacProvincia(String facProvincia) {
        this.facProvincia = facProvincia;
    }

    public String getFacCp() {
        return facCp;
    }

    public void setFacCp(String facCp) {
        this.facCp = facCp;
    }

    public String getFacPais() {
        return facPais;
    }

    public void setFacPais(String facPais) {
        this.facPais = facPais;
    }

    public String getFacDni() {
        return facDni;
    }

    public void setFacDni(String facDni) {
        this.facDni = facDni;
    }

    public int getFacDescuento() {
        return facDescuento;
    }

    public void setFacDescuento(int facDescuento) {
        this.facDescuento = facDescuento;
    }

    public Date getFacFecha() {
        return facFecha;
    }

    public void setFacFecha(Date facFecha) {
        this.facFecha = facFecha;
    }

    public int getFacIva() {
        return facIva;
    }

    public void setFacIva(int facIva) {
        this.facIva = facIva;
    }

    public String getFacObservaciones() {
        return facObservaciones;
    }

    public void setFacObservaciones(String facObservaciones) {
        this.facObservaciones = facObservaciones;
    }
    
    
    @SkipValidation
    public String FacturasFiltro() throws Exception {
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        try{
            Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
            if(u.getUsuAdministrador()!=1){
                return INPUT;
            }
         }catch(Exception e){
            return INPUT;
         }
        if(filtro == null || filtro.equals("null")){
            filtro = "";
        }
        if(orden == null){
            orden = "";
        }
        if((fechaI == null) || (fechaF == null)){
            fechaI = "";
            fechaF = "";
        }
        lista_facturas = ControladoresDAO.cFacturas.RecuperaTodos(filtro,orden,fechaI,fechaF);
        return SUCCESS;
    }

    @SkipValidation
    public String FacturasForm() throws Exception {
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
        
        if(accion.equals("a")){
            facId = 0;
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Facturas p = ControladoresDAO.cFacturas.RecuperaPorId(clave);           
            facId = p.getFacId();
            facUsuId = p.getFacUsuId();
            facCodigo = p.getFacCodigo();
            facRazonsocial = p.getFacRazonsocial();
            facDireccion = p.getFacDireccion();
            facPoblacion = p.getFacPoblacion();
            facProvincia = p.getFacProvincia();
            facCp = p.getFacCp();
            facPais = p.getFacPais();
            facDni = p.getFacDni();
            facDescuento = p.getFacDescuento();
            facFecha = p.getFacFecha();
            facIva = p.getFacIva();
            facObservaciones = p.getFacObservaciones();

            if(accion.equals("m")){
                accionocul = "m";
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                accionocul = "e";
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
            
        }
        return SUCCESS;
    }
   
    
    

        public String CrudActionFacturas() throws Exception {         
        if (accionocul.equals("a")) {            
            Facturas t = new Facturas(facUsuId, facCodigo, facRazonsocial, facDireccion, facPoblacion, facProvincia, facCp, facPais, facDni, facDescuento, facFecha, facIva, facObservaciones);
            ControladoresDAO.cFacturas.Inserta(t);
        }
        if (accionocul.equals("m")) {
            Facturas t = new Facturas(facUsuId, facCodigo, facRazonsocial, facDireccion, facPoblacion, facProvincia, facCp, facPais, facDni, facDescuento, facFecha, facIva, facObservaciones); 
            t.setFacId(facId);
            ControladoresDAO.cFacturas.Modifica(t);
        }
        if (accionocul.equals("e")) {
            Facturas t = new Facturas(facUsuId, facCodigo, facRazonsocial, facDireccion, facPoblacion, facProvincia, facCp, facPais, facDni, facDescuento, facFecha, facIva, facObservaciones); 
            t.setFacId(facId);
            ControladoresDAO.cFacturas.Elimina(t);
        }        
        return SUCCESS;
    }
        
    @SkipValidation
    public String FacturaPDF() throws Exception {
        return SUCCESS;        
    }
}
