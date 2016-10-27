/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;


import Modelos.Clientela;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeClientela extends ActionSupport {
    
     //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Clientela> Lista_Clientela;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String accionocul;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int clientelaId;
    private  String clientelaDescripcion;
    
    
    
    
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

    public int getClientelaId() {
        return clientelaId;
    }

    public void setClientelaId(int clientelaId) {
        this.clientelaId = clientelaId;
    }

    public String getClientelaDescripcion() {
        return clientelaDescripcion;
    }

    
    public void setClientelaDescripcion(String clientelaDescripcion) {
        this.clientelaDescripcion = clientelaDescripcion;
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

    public List<Clientela> getLista_Clientela() {
        return Lista_Clientela;
    }
    public void setLista_Clientela(List<Clientela> Lista_Categorias) {
        this.Lista_Clientela = Lista_Clientela;
    }

    public String ClientelaFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
       
        Lista_Clientela = ControladoresDAO.cClientela.RecuperaTodos(filtro);
        return SUCCESS;
    }
    public String ClientelaForm() throws Exception {
        if(accion.equals("a")){
            clientelaId = 0;
            clientelaDescripcion = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Clientela p = ControladoresDAO.cClientela.RecuperaPorId(clave);           
            clientelaId = p.getClientelaId();
            clientelaDescripcion = p.getClientelaDescripcion();

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
    public String CrudActionClientela() throws Exception {
          
        if (accionocul.equals("a")) {
            
           Clientela p = new Clientela(clientelaDescripcion);
           p.setClientelaId(clientelaId);
            ControladoresDAO.cClientela.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Clientela p = new Clientela(clientelaDescripcion);
            p.setClientelaId(clientelaId);
            ControladoresDAO.cClientela.Modifica(p);
        }
        if (accionocul.equals("e")) {
             Clientela p = new Clientela(clientelaDescripcion);
           p.setClientelaId(clientelaId);
            ControladoresDAO.cClientela.Elimina(p);
        }
        
        return SUCCESS;
    }
    
}
