/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Clientela;
import Modelos.Coleccion;
import Modelos.Color;
import Modelos.Fotos;
import Modelos.Look;
import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.RopaCategoria;
import Modelos.RopaMaterial;
import Modelos.Tallas;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author LaPlaga
 */
public class HomeRopa extends ActionSupport {
    
     //variables fijas para todos los controladores
    private String filtro;
    private String clave;
    private char accion;
    private String titulo;
    private String boton;
    private Map sesion;
    
    //variables específicas a cada controlador
    private ArrayList<Ropa> lista_ropa;
    
    
    private Integer roId2;
     private Clientela clientela2;
     private Coleccion coleccion2;
     private Color color2;
     private Look look2;
     private Marcas marcas2;
     private Tallas tallas2;
     private String roDescripcion2;
     private double roPrecio2;
     private double roDescuento2;
     private String roCaracteristicas2;
     private byte roVisible2;
     private int roUnidades2;
     private String accionocul;
     private Date roFecha2;
     private Set<RopaCategoria> ropaCategorias2 = new HashSet<RopaCategoria>(0);
     private Set<RopaMaterial> ropaMaterials2 = new HashSet<RopaMaterial>(0);
     private Set<Fotos> fotoses2 = new HashSet<Fotos>(0);

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

    public ArrayList<Ropa> getLista_ropa() {
        return lista_ropa;
    }

    public void setLista_ropa(ArrayList<Ropa> lista_ropa) {
        this.lista_ropa = lista_ropa;
    }

    public Integer getRoId2() {
        return roId2;
    }

    public void setRoId2(Integer roId2) {
        this.roId2 = roId2;
    }

    public Clientela getClientela2() {
        return clientela2;
    }

    public void setClientela2(Clientela clientela2) {
        this.clientela2 = clientela2;
    }

    public Coleccion getColeccion2() {
        return coleccion2;
    }

    public void setColeccion2(Coleccion coleccion2) {
        this.coleccion2 = coleccion2;
    }

    public Color getColor2() {
        return color2;
    }

    public void setColor2(Color color2) {
        this.color2 = color2;
    }

    public Look getLook2() {
        return look2;
    }

    public void setLook2(Look look2) {
        this.look2 = look2;
    }

    public Marcas getMarcas2() {
        return marcas2;
    }

    public void setMarcas2(Marcas marcas2) {
        this.marcas2 = marcas2;
    }

    public Tallas getTallas2() {
        return tallas2;
    }

    public void setTallas2(Tallas tallas2) {
        this.tallas2 = tallas2;
    }

    public String getRoDescripcion2() {
        return roDescripcion2;
    }

    public void setRoDescripcion2(String roDescripcion2) {
        this.roDescripcion2 = roDescripcion2;
    }

    public double getRoPrecio2() {
        return roPrecio2;
    }

    public void setRoPrecio2(double roPrecio2) {
        this.roPrecio2 = roPrecio2;
    }

    public double getRoDescuento2() {
        return roDescuento2;
    }

    public void setRoDescuento2(double roDescuento2) {
        this.roDescuento2 = roDescuento2;
    }

    public String getRoCaracteristicas2() {
        return roCaracteristicas2;
    }

    public void setRoCaracteristicas2(String roCaracteristicas2) {
        this.roCaracteristicas2 = roCaracteristicas2;
    }

    public byte getRoVisible2() {
        return roVisible2;
    }

    public void setRoVisible2(byte roVisible2) {
        this.roVisible2 = roVisible2;
    }

    public int getRoUnidades2() {
        return roUnidades2;
    }

    public void setRoUnidades2(int roUnidades2) {
        this.roUnidades2 = roUnidades2;
    }

    public Date getRoFecha2() {
        return roFecha2;
    }

    public void setRoFecha2(Date roFecha2) {
        this.roFecha2 = roFecha2;
    }

    public Set<RopaCategoria> getRopaCategorias2() {
        return ropaCategorias2;
    }

    public void setRopaCategorias2(Set<RopaCategoria> ropaCategorias2) {
        this.ropaCategorias2 = ropaCategorias2;
    }

    public Set<RopaMaterial> getRopaMaterials2() {
        return ropaMaterials2;
    }

    public void setRopaMaterials2(Set<RopaMaterial> ropaMaterials2) {
        this.ropaMaterials2 = ropaMaterials2;
    }

    public Set<Fotos> getFotoses2() {
        return fotoses2;
    }

    public void setFotoses2(Set<Fotos> fotoses2) {
        this.fotoses2 = fotoses2;
    }

     
     
    
    
    @SkipValidation
    public String RopaFiltro() throws Exception {
      
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
        lista_ropa = ControladoresDAO.cRopa.Recupera_Todos(filtro);
       
        return SUCCESS;
    }
    
    @SkipValidation
    public String RopaForm() throws Exception{
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
                roId2 = 0;
                clientela2 = null;
                coleccion2 = null;
                color2 = null;
                look2 = null;
                marcas2 = null;
                tallas2 = null;
                roDescripcion2 = "";
                roPrecio2 = 0.0;
                roDescuento2 = 0.0;
                roCaracteristicas2 = "";
                roVisible2 = 0;
                roUnidades2 = 0;
                roFecha2 = null;
                boton = "Alta";
                break;
            case 'm': 
                titulo = "Modificación";
                Ropa t = ControladoresDAO.cRopa.Recupera_Id(clave);
                roId2 = 0;
                clientela2 = null;
                coleccion2 = null;
                color2 = null;
                look2 = null;
                marcas2 = null;
                tallas2 = null;
                roDescripcion2 = "";
                roPrecio2 = 0.0;
                roDescuento2 = 0.0;
                roCaracteristicas2 = "";
                roVisible2 = 0;
                roUnidades2 = 0;
                roFecha2 = null;
                boton = "Modificar";
                break;
            case 'e': 
                titulo = "Eliminación";
                Ropa ta = ControladoresDAO.cRopa.Recupera_Id(clave);
                roId2 = 0;
                clientela2 = null;
                coleccion2 = null;
                color2 = null;
                look2 = null;
                marcas2 = null;
                tallas2 = null;
                roDescripcion2 = "";
                roPrecio2 = 0.0;
                roDescuento2 = 0.0;
                roCaracteristicas2 = "";
                roVisible2 = 0;
                roUnidades2 = 0;
                roFecha2 = null;
                boton = "Eliminar";
                break;
            default : 
                titulo = "Error en titulo";
            
        }
        return SUCCESS;
    }
    
    
    //@SkipValidation
//     public String CrudActionRopa() throws Exception {         
//        if (accionocul.equals("a")) {            
//           Marcas p = new Ropa(clientela2, coleccion2, color2, look2, marcas2, tallas2, roDescripcion2, roPrecio, roDescuento, roCaracteristicas2, roVisible2, roUnidades, roFecha2, ropaCategorias2, ropaMaterials2, fotoses2);
//           p.setMarcaId(roId2);
//            ControladoresDAO.cMarcas.Inserta(p);
//        }
//        if (accionocul.equals("m")) {
//            Marcas p = new Marcas(roDescripcion2); 
//             p.setMarcaId(roId2);
//            ControladoresDAO.cMarcas.Modifica(p);
//        }
//        if (accionocul.equals("e")) {
//            Marcas p = new Marcas(roDescripcion2); 
//             p.setMarcaId(roId2);
//            ControladoresDAO.cMarcas.Elimina(p);
//        }        
//        return SUCCESS;
//    }    
    
}
