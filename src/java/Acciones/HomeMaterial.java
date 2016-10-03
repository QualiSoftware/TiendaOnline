package Acciones;

import Modelos.Material;
//import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.interceptor.validation.SkipValidation;

public class HomeMaterial extends ActionSupport {
    
    //variables fijas para todos los controladores
    private String filtro;
    private String clave;
    private char accion;
    private String titulo;
    private String boton;
    private Map sesion;
    
    //variables específicas a cada controlador
    private ArrayList<Material> lista_material;
    private Integer materialId;
    private String materialDescripcion;

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
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

    public ArrayList<Material> getLista_material() {
        return lista_material;
    }

    public void setLista_material(ArrayList<Material> lista_material) {
        this.lista_material = lista_material;
    }

    public Integer getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Integer materialId) {
        this.materialId = materialId;
    }

    public String getMaterialDescripcion() {
        return materialDescripcion;
    }

    public void setMaterialDescripcion(String materialDescripcion) {
        this.materialDescripcion = materialDescripcion;
    }
    
    
    @SkipValidation
    public String MaterialFiltro() throws Exception {
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
        lista_material = ControladoresDAO.cMaterial.Recupera_Todos(filtro);
        return SUCCESS;
    }
    
    @SkipValidation
    public String MaterialForm() throws Exception{
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
                materialId = 0;
                materialDescripcion = "";
                boton = "Alta";
                break;
            case 'm': 
                titulo = "Modificación";
                Material t = ControladoresDAO.cMaterial.Recupera_Id(clave);
                materialId = t.getMaterialId();
                materialDescripcion = t.getMaterialDescripcion();
                boton = "Modificar";
                break;
            case 'e': 
                titulo = "Eliminación";
                Material ta = ControladoresDAO.cMaterial.Recupera_Id(clave);
                materialId = ta.getMaterialId();
                materialDescripcion = ta.getMaterialDescripcion();
                boton = "Eliminar";
                break;
            default : 
                titulo = "Error en titulo";
            
        }
        return SUCCESS;
    }
    
    
    //@SkipValidation
    public String CrudActionMaterial(){
        if(sesion==null){
            sesion=ActionContext.getContext().getSession();
        }
        int respuesta;
        Material t = new Material(materialDescripcion);
        t.setMaterialId(materialId);
        switch(accion){
            case 'a':
                respuesta = ControladoresDAO.cMaterial.Inserta(t);
                break;
            case 'm': 
                respuesta = ControladoresDAO.cMaterial.Modifica(t);
                break;
            case 'e':
                respuesta = ControladoresDAO.cMaterial.Elimina(t);
                break;
            default : 
                boton = "Error en accion";
        }
        return SUCCESS;
    }
    
}
