package Acciones;

import Modelos.Tallas;
import Modelos.Usuarios;
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
    private String clave;
    private char accion;
    private String titulo;
    private String boton;
    private Map sesion;
    
    //variables específicas a cada controlador
    private ArrayList<Tallas> lista_tallas;
    private Integer tallaId;
    private String tallaDescripcion;

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

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public char getAccion() {
        return accion;
    }

    public void setAccion(char accion) {
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
    public String CargoTallas() throws Exception {
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
        lista_tallas = ControladoresDAO.cTallas.Recupera_Todos(filtro);
        return SUCCESS;
    }
    
    @SkipValidation
    public String cambio() throws Exception{
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
        switch(accion){
            case 'a': 
                titulo = "Alta";
                tallaId = 0;
                tallaDescripcion = "";
                boton = "Alta";
                break;
            case 'm': 
                titulo = "Modificación";
                Tallas t = ControladoresDAO.cTallas.Recupera_Id(clave);
                tallaId = t.getTallaId();
                tallaDescripcion = t.getTallaDescripcion();
                boton = "Modificar";
                break;
            case 'e': 
                titulo = "Eliminación";
                Tallas ta = ControladoresDAO.cTallas.Recupera_Id(clave);
                tallaId = ta.getTallaId();
                tallaDescripcion = ta.getTallaDescripcion();
                boton = "Eliminar";
                break;
            default : 
                titulo = "Error en titulo";
            
        }
        return SUCCESS;
    }
    
    
    //@SkipValidation
    public String actuar(){
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        int respuesta;
        Tallas t = new Tallas(tallaDescripcion);
        t.setTallaId(tallaId);
        switch(accion){
            case 'a':
                respuesta = ControladoresDAO.cTallas.Inserta(t);
                break;
            case 'm': 
                respuesta = ControladoresDAO.cTallas.Modifica(t);
                break;
            case 'e':
                respuesta = ControladoresDAO.cTallas.Elimina(t);
                break;
            default : 
                boton = "Error en accion";
        }
        return SUCCESS;
    }
    
}
