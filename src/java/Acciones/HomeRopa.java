/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Categoria;
import Modelos.Clientela;
import Modelos.Coleccion;
import Modelos.Color;
import Modelos.Fotos;
import Modelos.Look;
import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.Subcategoria;
import Modelos.Tallas;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
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
    private int clave;
    private String accion;
    private String titulo;
    private String boton;
    private Map sesion;
    private String cabeceraocul;
    private String botonocul;
    private Ropa t;

    //variables específicas a cada controlador
    private ArrayList<Ropa> lista_ropa;
    private List<Categoria> lista_categoria;
    private List<Marcas> lista_marca;
    private List<Clientela> lista_clientela;
    private List<Look> lista_look;
    private List<Tallas> lista_tallas;
    private List<Color> lista_colores;
    private List<Coleccion> lista_colecciones;
    private List<Subcategoria> lista_subcategoria;

    private Integer roId2;
    private String clientela2;
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
    private Set<Fotos> fotoses2 = new HashSet<Fotos>(0);

    public Ropa getT() {
        return t;
    }

    public void setT(Ropa t) {
        this.t = t;
    }

    public List<Subcategoria> getLista_subcategoria() {
        return lista_subcategoria;
    }

    public void setLista_subcategoria(List<Subcategoria> lista_subcategoria) {
        this.lista_subcategoria = lista_subcategoria;
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

    public List<Categoria> getLista_categoria() {
        return lista_categoria;
    }

    public void setLista_categoria(List<Categoria> lista_categoria) {
        this.lista_categoria = lista_categoria;
    }

    public List<Marcas> getLista_marca() {
        return lista_marca;
    }

    public void setLista_marca(List<Marcas> lista_marca) {
        this.lista_marca = lista_marca;
    }

    public List<Clientela> getLista_clientela() {
        return lista_clientela;
    }

    public void setLista_clientela(List<Clientela> lista_clientela) {
        this.lista_clientela = lista_clientela;
    }

    public List<Look> getLista_look() {
        return lista_look;
    }

    public void setLista_look(List<Look> lista_look) {
        this.lista_look = lista_look;
    }

    public List<Tallas> getLista_tallas() {
        return lista_tallas;
    }

    public void setLista_tallas(List<Tallas> lista_tallas) {
        this.lista_tallas = lista_tallas;
    }

    public List<Color> getLista_colores() {
        return lista_colores;
    }

    public void setLista_colores(List<Color> lista_colores) {
        this.lista_colores = lista_colores;
    }

    public List<Coleccion> getLista_colecciones() {
        return lista_colecciones;
    }

    public void setLista_colecciones(List<Coleccion> lista_colecciones) {
        this.lista_colecciones = lista_colecciones;
    }

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
    }

    public String getFiltro() {
        return filtro;
    }

    public void setFiltro(String filtro) {
        this.filtro = filtro;
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

    public String getClientela2() {
        return clientela2;
    }

    public void setClientela2(String clientela2) {
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

    public Set<Fotos> getFotoses2() {
        return fotoses2;
    }

    public void setFotoses2(Set<Fotos> fotoses2) {
        this.fotoses2 = fotoses2;
    }

    @SkipValidation
    public String RopaFiltro() throws Exception {

        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        /* para cuando tengamos sesión de usuario
         try{
         Usuarios u = (Usuarios) sesion.get("usuarioLogueado");
         }catch(Exception e){
         return INPUT;
         }
         */
        if (filtro == null) {
            filtro = "";
        }
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro);

        return SUCCESS;
    }

    @SkipValidation
    public String RopaForm() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
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
        lista_marca = ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_clientela = ControladoresDAO.cClientela.RecuperaTodos("");
        lista_look = ControladoresDAO.cLook.RecuperaTodos("");
        lista_tallas = ControladoresDAO.cTallas.RecuperaTodos("");
        lista_colores = ControladoresDAO.cColor.RecuperaTodos("");
        lista_colecciones = ControladoresDAO.cColeccion.RecuperaTodos("");
        lista_categoria = ControladoresDAO.cCategorias.RecuperaTodos("");
        lista_subcategoria = ControladoresDAO.cSubcategorias.RecuperaTodos("");
        if (accion.equals("a")) {
            titulo = "Alta";
            roId2 = 0;
            roDescripcion2 = "";
            roPrecio2 = 0.0;
            roDescuento2 = 0.0;
            roCaracteristicas2 = "";
            roVisible2 = 0;
            roUnidades2 = 0;
            roFecha2 = null;
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        }else{
            t = ControladoresDAO.cRopa.RecuperaPorId(clave);
            roId2 = t.getRoId();
            roDescripcion2 = t.getRoDescripcion();
            roPrecio2 = t.getRoPrecio();
            roDescuento2 = t.getRoDescuento();
            roCaracteristicas2 = t.getRoCaracteristicas();
            roVisible2 = t.getRoVisible();
            roUnidades2 = t.getRoUnidades();
            roFecha2 = t.getRoFecha();
        }
        if (accion.equals("m")) {
            accionocul = "m";
            cabeceraocul = "Modificar";
            botonocul = "Modificar";
        }
        if (accion.equals("e")) {
            accionocul = "e";
            cabeceraocul = "Eliminar";
            botonocul = "Eliminar";
        }

            
         return SUCCESS;
    }

   /* @SkipValidation
     public String CrudActionRopa() throws Exception {         
        if (accionocul.equals("a")) {            
           Ropa p = new Ropa(null, coleccion2, color2, look2, marcas2, tallas2, roDescripcion2, roPrecio2, roDescuento2, roCaracteristicas2, roVisible2, roUnidades2, roFecha2);
           p.setRoId(roId2);
            ControladoresDAO.cRopa.Inserta(p);
        }
        if (accionocul.equals("m")) {
            Marcas p = new Marcas(roDescripcion2); 
             p.setMarcaId(roId2);
            ControladoresDAO.cMarcas.Modifica(p);
        }
        if (accionocul.equals("e")) {
            Marcas p = new Marcas(roDescripcion2); 
             p.setMarcaId(roId2);
            ControladoresDAO.cMarcas.Elimina(p);
        }        
        return SUCCESS;
    } */   
}
