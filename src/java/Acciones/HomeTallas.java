package Acciones;

import Modelos.Tallas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class HomeTallas extends ActionSupport {
    
    //variables fijas para todos los controladores
    private String filtro;
    private int clave;
    private String accion;
    private String titulo;
    private String boton;
    private Map sesion;
    private String cabeceraocul;
    private String botonocul;
    
    //variables específicas a cada controlador
    private List<Tallas> lista_tallas;
    private Integer tallaId;
    private String tallaDescripcion;
    private String mensajeNoBorrar;

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

    public List<Tallas> getLista_tallas() {
        return lista_tallas;
    }

    public void setLista_tallas(List<Tallas> lista_tallas) {
        this.lista_tallas = lista_tallas;
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

    public Integer getTallaId() {
        return tallaId;
    }

    public void setTallaId(Integer tallaId) {
        this.tallaId = tallaId;
    }

    public String getTallaDescripcion() {
        return tallaDescripcion;
    }

    public void setTallaDescripcion(String tallaDescripcion) {
        this.tallaDescripcion = tallaDescripcion;
    }

    public String getMensajeNoBorrar() {
        return mensajeNoBorrar;
    }

    public void setMensajeNoBorrar(String mensajeNoBorrar) {
        this.mensajeNoBorrar = mensajeNoBorrar;
    }
    
    @SkipValidation
    public String TallasFiltro() throws Exception {
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
        lista_tallas = ControladoresDAO.cTallas.RecuperaTodos(filtro);
        return SUCCESS;
    }

    @SkipValidation
    public String TallasForm() throws Exception {
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
            tallaId = 0;
            tallaDescripcion = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Tallas p = ControladoresDAO.cTallas.RecuperaPorId(clave);           
            tallaId = p.getTallaId();
            tallaDescripcion = p.getTallaDescripcion();
            if(accion.equals("m")){
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                cabeceraocul = "Eliminación";
                botonocul = "Eliminar";
            }
        }
        return SUCCESS;
    }

    public String CrudActionTallas() throws Exception {         
        if (accion.equals("a")) {            
           Tallas t = new Tallas(tallaDescripcion);
            ControladoresDAO.cTallas.Inserta(t);
        }
        if (accion.equals("m")) {
            Tallas t = new Tallas(tallaDescripcion); 
             t.setTallaId(tallaId);
            ControladoresDAO.cTallas.Modifica(t);
        }
        if (accion.equals("e")) {
            List cantidad = ControladoresDAO.cRopaStock.RecuperaPorTalla(tallaId);
            if(cantidad.size() > 0){
                mensajeNoBorrar = "Hay "+cantidad.size()+" prendas que utilizan esta Talla.";
                return INPUT;
            }else{
                Tallas t = ControladoresDAO.cTallas.RecuperaPorId(tallaId);
                ControladoresDAO.cTallas.Elimina(t);
            }
        }        
        return SUCCESS;
    }  
}
