package Acciones;

import Modelos.Color;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HomeColor extends ActionSupport {
    
         //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Color> Lista_Color;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int colorId;
    private String colorDescripcion;
    private String mensajeNoBorrar;
    
    //getters and setters
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

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getColorDescripcion() {
        return colorDescripcion;
    }

    public void setColorDescripcion(String colorDescripcion) {
        this.colorDescripcion = colorDescripcion;
    }

    public String getMensajeNoBorrar() {
        return mensajeNoBorrar;
    }

    public void setMensajeNoBorrar(String mensajeNoBorrar) {
        this.mensajeNoBorrar = mensajeNoBorrar;
    }

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

    public List<Color> getLista_Color() {
        return Lista_Color;
    }

    public void setLista_Color(List<Color> Lista_Color) {
        this.Lista_Color = Lista_Color;
    }

    public String ColorFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Color = ControladoresDAO.cColor.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String ColorForm() throws Exception {
        if(accion.equals("a")){
            colorId = 0;
            colorDescripcion = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Color p = ControladoresDAO.cColor.RecuperaPorId(clave);           
            colorId = p.getColorId();
            colorDescripcion = p.getColorDescripcion();

            if(accion.equals("m")){
                cabeceraocul = "Modificación";
                botonocul = "Modificar";  
            }else{
                cabeceraocul = "Eliminación";
                botonocul = "Eliminación";
            }
        }
        return SUCCESS;
    }
    
    public String CrudActionColor() throws Exception {         
        if (accion.equals("a")) {            
           Color p = new Color(colorDescripcion);
            ControladoresDAO.cColor.Inserta(p);
        }
        if (accion.equals("m")) {
            Color p = new Color(colorDescripcion); 
            p.setColorId(colorId);
            ControladoresDAO.cColor.Modifica(p);
        }
        if (accion.equals("e")) {
            Color p = ControladoresDAO.cColor.RecuperaPorId(colorId);
            ArrayList listaInactivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("color.colorId",colorId,0);
            ArrayList listaActivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("color.colorId",colorId,1);
            int cantidad = listaActivas.size() + listaInactivas.size();
            if(cantidad > 0){
                mensajeNoBorrar = "Hay "+listaActivas.size()+" ropa visible y "+listaInactivas.size()+" ropa no visible \r\nque utilizan este Color.";
                return INPUT;
            }else{
                ControladoresDAO.cColor.Elimina(p);
            }
        }        
        return SUCCESS;
    }
}