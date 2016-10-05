package Acciones;

import Modelos.Tallas;
//import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
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
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    
    //variables específicas a cada controlador
    private ArrayList<Tallas> lista_tallas;
    private Integer tallaId;
    private String tallaDescripcion;

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

    public ArrayList<Tallas> getLista_tallas() {
        return lista_tallas;
    }

    public void setLista_tallas(ArrayList<Tallas> lista_tallas) {
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


       public String TallasForm() throws Exception {
        if(accion.equals("a")){
            tallaId = 0;
            tallaDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Tallas p = ControladoresDAO.cTallas.RecuperaPorId(clave);           
            tallaId = p.getTallaId();
            tallaDescripcion = p.getTallaDescripcion();

            if(accion.equals("m")){
                accionocul = "m";
                cabeceraocul = "Modificar";
                botonocul = "Modificar";  
            }else{
                accionocul = "e";
                cabeceraocul = "Eliminar";
                botonocul = "Eliminar";
            }
            
        }
        return SUCCESS;
    }
   
    
    

        public String CrudActionTallas() throws Exception {         
        if (accionocul.equals("a")) {            
           Tallas t = new Tallas(tallaDescripcion);
           t.setTallaId(tallaId);
            ControladoresDAO.cTallas.Inserta(t);
        }
        if (accionocul.equals("m")) {
            Tallas t = new Tallas(tallaDescripcion); 
             t.setTallaId(tallaId);
            ControladoresDAO.cTallas.Modifica(t);
        }
        if (accionocul.equals("e")) {
            Tallas t = new Tallas(tallaDescripcion); 
             t.setTallaId(tallaId);
            ControladoresDAO.cTallas.Elimina(t);
        }        
        return SUCCESS;
    }  
}
