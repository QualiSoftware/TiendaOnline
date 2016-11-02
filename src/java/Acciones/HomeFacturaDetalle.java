package Acciones;

import Modelos.FacturaDetalle;
import Modelos.Facturas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class HomeFacturaDetalle extends ActionSupport {
    
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
    
    //variables específicas a cada controlador
    private List<FacturaDetalle> lista_facturaDetalle;
    private Integer facdId;
    private String facCodigo;
     private Facturas facturas;
     private double facdDescuento;
     private double facdPrecio;
     private String facdTalla;
     private int facdCantidad;
     private String facdMarca;
     private String facdClientela;
     private String facdCategoria;
     private String facdSubcategoria;
     private String facdColor;
     private Double total;

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
    
    
    
    

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
    }

    public List<FacturaDetalle> getLista_facturaDetalle() {
        return lista_facturaDetalle;
    }

    public void setLista_facturaDetalle(List<FacturaDetalle> lista_facturaDetalle) {
        this.lista_facturaDetalle = lista_facturaDetalle;
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

    public Integer getFacdId() {
        return facdId;
    }

    public void setFacdId(Integer facdId) {
        this.facdId = facdId;
    }

    public String getFacCodigo() {
        return facCodigo;
    }

    public void setFacCodigo(String facCodigo) {
        this.facCodigo = facCodigo;
    }

    public Facturas getFacturas() {
        return facturas;
    }

    public void setFacturas(Facturas facturas) {
        this.facturas = facturas;
    }

    public double getFacdDescuento() {
        return facdDescuento;
    }

    public void setFacdDescuento(double facdDescuento) {
        this.facdDescuento = facdDescuento;
    }

    public double getFacdPrecio() {
        return facdPrecio;
    }

    public void setFacdPrecio(double facdPrecio) {
        this.facdPrecio = facdPrecio;
    }

    public String getFacdTalla() {
        return facdTalla;
    }

    public void setFacdTalla(String facdTalla) {
        this.facdTalla = facdTalla;
    }

    public int getFacdCantidad() {
        return facdCantidad;
    }

    public void setFacdCantidad(int facdCantidad) {
        this.facdCantidad = facdCantidad;
    }

    public String getFacdMarca() {
        return facdMarca;
    }

    public void setFacdMarca(String facdMarca) {
        this.facdMarca = facdMarca;
    }

    public String getFacdClientela() {
        return facdClientela;
    }

    public void setFacdClientela(String facdClientela) {
        this.facdClientela = facdClientela;
    }

    public String getFacdCategoria() {
        return facdCategoria;
    }

    public void setFacdCategoria(String facdCategoria) {
        this.facdCategoria = facdCategoria;
    }

    public String getFacdSubcategoria() {
        return facdSubcategoria;
    }

    public void setFacdSubcategoria(String facdSubcategoria) {
        this.facdSubcategoria = facdSubcategoria;
    }

    public String getFacdColor() {
        return facdColor;
    }

    public void setFacdColor(String facdColor) {
        this.facdColor = facdColor;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    
    @SkipValidation
    public String FacturaDetalleFiltro() throws Exception {
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
        /*
        if(filtro == null){
            filtro = "";
        }*/
        facturas = ControladoresDAO.cFacturas.RecuperaPorId(Integer.parseInt(facCodigo));
        total = 0.0;
        lista_facturaDetalle = ControladoresDAO.cFacturaDetalle.RecuperaTodos(""+clave);
        for(FacturaDetalle fd:lista_facturaDetalle){
            total += (fd.getFacdPrecio() - (fd.getFacdPrecio() * fd.getFacdDescuento() / 100)) * fd.getFacdCantidad();
        }
        
        return SUCCESS;
    }

    @SkipValidation
    public String FacturaDetalleForm() throws Exception {
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
            facdId = 0;
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }/*else{
            FacturaDetalle p = ControladoresDAO.cFacturaDetalle.RecuperaPorId(clave);           
            facdId = p.getFacdId();

            if(accion.equals("m")){
                accionocul = "m";
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                accionocul = "e";
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
            
        }*/
        return SUCCESS;
    }
   
    
    

        public String CrudActionFacturaDetalle() throws Exception {         
        if (accionocul.equals("a")) {            
           FacturaDetalle t = new FacturaDetalle(facturas, facdDescuento, facdPrecio, facdTalla, facdCantidad, facdMarca, facdClientela, facdCategoria, facdSubcategoria, facdColor);
           t.setFacdId(facdId);
            ControladoresDAO.cFacturaDetalle.Inserta(t);
        }
        /*
        if (accionocul.equals("m")) {
            FacturaDetalle t = new FacturaDetalle(facturas, facdDescuento, facdPrecio, facdTalla, facdCantidad, facdMarca, facdClientela, facdCategoria, facdSubcategoria, facdColor); 
             t.setFacdId(facdId);
            ControladoresDAO.cFacturaDetalle.Modifica(t);
        }
        if (accionocul.equals("e")) {
            FacturaDetalle t = new FacturaDetalle(facturas, facdDescuento, facdPrecio, facdTalla, facdCantidad, facdMarca, facdClientela, facdCategoria, facdSubcategoria, facdColor); 
             t.setFacdId(facdId);
            ControladoresDAO.cFacturaDetalle.Elimina(t);
        }
        */
        return SUCCESS;
    }  
}
