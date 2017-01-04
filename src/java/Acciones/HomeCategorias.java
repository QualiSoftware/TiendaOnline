/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Categoria;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LaPlaga
 */
public class HomeCategorias extends ActionSupport {
    //sesion
    private Map sesion;
        //Filtro
    private String filtro;
        //Creamos la lista
    private  List<Categoria> Lista_Categorias;
    //fijos para la carga del formulario
    private int clave;
    private String accion;
    private String cabeceraocul;
    private String botonocul;
    //variables de carga del formulario
    private int catId;
    private String catDescripcion;
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

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatDescripcion() {
        return catDescripcion;
    }

    
    public void setCatDescripcion(String catDescripcion) {
        this.catDescripcion = catDescripcion;
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

    public List<Categoria> getLista_Categorias() {
        return Lista_Categorias;
    }
    public void setLista_Categorias(List<Categoria> Lista_Categorias) {
        this.Lista_Categorias = Lista_Categorias;
    }

    public String CategoriaFiltro() throws Exception {
        if (sesion==null) {
            sesion=ActionContext.getContext().getSession();
        }
        if(filtro == null){
            filtro="";
        }
        Lista_Categorias = ControladoresDAO.cCategorias.RecuperaTodos(filtro);
        return SUCCESS;
    }
    
    public String CategoriasForm() throws Exception {
        if(accion.equals("a")){
            catId = 0;
            catDescripcion = "";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            Categoria p = ControladoresDAO.cCategorias.RecuperaPorId(clave);           
            catId = p.getCatId();
            catDescripcion = p.getCatDescripcion();
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

    public String CrudActionCategorias() throws Exception {
        if (accion.equals("a")) {
           Categoria p = new Categoria(catDescripcion);
            ControladoresDAO.cCategorias.Inserta(p);
        }
        if (accion.equals("m")) {
            Categoria p = new Categoria(catDescripcion);
            p.setCatId(catId);
            ControladoresDAO.cCategorias.Modifica(p);
        }
        if (accion.equals("e")) {
            Categoria p = ControladoresDAO.cCategorias.RecuperaPorId(catId);
            ArrayList listaInactivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("categoria.catId",catId,0);
            ArrayList listaActivas = ControladoresDAO.cRopa.RecuperaTodoPorAlgo("categoria.catId",catId,1);
            int cantidad = listaActivas.size() + listaInactivas.size();
            if(cantidad > 0){
                mensajeNoBorrar = "Hay "+listaActivas.size()+" ropa visible y "+listaInactivas.size()+" ropa no visible \r\nque utilizan esta Categoría.";
                return INPUT;
            }else{
                ControladoresDAO.cCategorias.Elimina(p);
            }
        }
        return SUCCESS;
    }
}