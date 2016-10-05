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
import Modelos.Material;
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
    private String clave;
    private char accion;
    private String titulo;
    private String boton;
    private Map sesion;
    private String cabeceraocul;
    private String botonocul;
    
    //variables específicas a cada controlador
    private ArrayList<Ropa> lista_ropa;
    private List<Categoria> lista_categoria;
    private List<Marcas> lista_marca;
    private List<Clientela> lista_clientela;
    private List<Look> lista_look;
    private List<Tallas> lista_tallas;
    private List<Material> lista_materiales;
    private List<Color> lista_colores;
    private List<Coleccion> lista_colecciones;
    
    
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
     
     //lista de combos
     private List<String> lista_combo_categorias;
     private List<String> lista_combo_marcas;
     private List<String> lista_combo_clientela;
     private List<String> lista_combo_look;
     private List<String> lista_combo_tallas;
     private List<String> lista_combo_material;
     private List<String> lista_combo_color;
     private List<String> lista_combo_coleccion;

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

    public List<Material> getLista_materiales() {
        return lista_materiales;
    }

    public void setLista_materiales(List<Material> lista_materiales) {
        this.lista_materiales = lista_materiales;
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

    public List<String> getLista_combo_categorias() {
        return lista_combo_categorias;
    }

    public void setLista_combo_categorias(List<String> lista_combo_categorias) {
        this.lista_combo_categorias = lista_combo_categorias;
    }

    public List<String> getLista_combo_marcas() {
        return lista_combo_marcas;
    }

    public void setLista_combo_marcas(List<String> lista_combo_marcas) {
        this.lista_combo_marcas = lista_combo_marcas;
    }

    public List<String> getLista_combo_clientela() {
        return lista_combo_clientela;
    }

    public void setLista_combo_clientela(List<String> lista_combo_clientela) {
        this.lista_combo_clientela = lista_combo_clientela;
    }

    public List<String> getLista_combo_look() {
        return lista_combo_look;
    }

    public void setLista_combo_look(List<String> lista_combo_look) {
        this.lista_combo_look = lista_combo_look;
    }

    public List<String> getLista_combo_tallas() {
        return lista_combo_tallas;
    }

    public void setLista_combo_tallas(List<String> lista_combo_tallas) {
        this.lista_combo_tallas = lista_combo_tallas;
    }

    public List<String> getLista_combo_material() {
        return lista_combo_material;
    }

    public void setLista_combo_material(List<String> lista_combo_material) {
        this.lista_combo_material = lista_combo_material;
    }

    public List<String> getLista_combo_color() {
        return lista_combo_color;
    }

    public void setLista_combo_color(List<String> lista_combo_color) {
        this.lista_combo_color = lista_combo_color;
    }

    public List<String> getLista_combo_coleccion() {
        return lista_combo_coleccion;
    }

    public void setLista_combo_coleccion(List<String> lista_combo_coleccion) {
        this.lista_combo_coleccion = lista_combo_coleccion;
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
        
//             private List<String> lista_combo_categorias;
//     private List<String> lista_combo_marcas;
//     private List<String> lista_combo_clientela;
//     private List<String> lista_combo_look;
//     private List<String> lista_combo_tallas;
//     private List<String> lista_combo_material;
//     private List<String> lista_combo_color;
//     private List<String> lista_combo_coleccion;
        switch(accion){
            case 'a': 
                titulo = "Alta";
                roId2 = 0;
                lista_marca = ControladoresDAO.cMarcas.RecuperaTodos("");
                lista_combo_marcas = new ArrayList<String>();
                for (Marcas Lm : lista_marca) {
                    lista_combo_marcas.add(Lm.getMarcaNombre());
                }
                lista_clientela = ControladoresDAO.cClientela.RecuperaTodos("");
                lista_combo_clientela = new ArrayList<String>();
                for (Clientela Lcl : lista_clientela) {
                    lista_combo_clientela.add(Lcl.getClientelaDescripcion());
                }
                roDescripcion2 = "";
                lista_look = ControladoresDAO.cLook.RecuperaTodos("");
                lista_combo_look = new ArrayList<String>();
                for (Look Loo : lista_look) {
                    lista_combo_look.add(Loo.getLookDescripcion());
                }
                lista_tallas = ControladoresDAO.cTallas.Recupera_Todos("");
                lista_combo_tallas = new ArrayList<String>();
                for (Tallas ta : lista_tallas) {
                    lista_combo_tallas.add(ta.getTallaDescripcion());
                }
                roPrecio2 = 0.0;
                roDescuento2 = 0.0;
                lista_colores = ControladoresDAO.cColor.RecuperaTodos("");
                lista_combo_color = new ArrayList<String>();
                for (Color co : lista_colores) {
                    lista_combo_color.add(co.getColorDescripcion());
                }
                lista_colecciones = ControladoresDAO.cColeccion.RecuperaTodos("");
                lista_combo_coleccion = new ArrayList<String>();
                for (Coleccion col : lista_colecciones) {
                    lista_combo_coleccion.add(col.getColeccionDescripcion());
                }               
                roCaracteristicas2 = "";
                roVisible2 = 0;
                roUnidades2 = 0;
                roFecha2 = null;
                lista_categoria = ControladoresDAO.cCategorias.RecuperaTodos("");
                lista_combo_categorias = new ArrayList<String>();
                for (Categoria Lc : lista_categoria) {
                    lista_combo_categorias.add(Lc.getCatDescripcion());
                }
                lista_materiales = ControladoresDAO.cMaterial.Recupera_Todos("");
                lista_combo_material = new ArrayList<String>();
                for (Material mat : lista_materiales) {
                    lista_combo_material.add(mat.getMaterialDescripcion());
                }
                            accionocul = "a";
         cabeceraocul = "Alta";
         botonocul = "Alta";
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
                for (Ropa Lr : lista_ropa) {
                for(RopaCategoria rc: ropaCategorias2 ){
                    lista_combo_categorias.add(Integer.toString(rc.getCategoria().getCatId()));
                }
                
            }
                                accionocul = "m";
                cabeceraocul = "Modificar";
                botonocul = "Modificar"; 
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
                for (Ropa Lr : lista_ropa) {
                for(RopaCategoria rc: ropaCategorias2 ){
                    lista_combo_categorias.add(Integer.toString(rc.getCategoria().getCatId()));
                }
                
            }
                accionocul = "e";
                cabeceraocul = "Eliminar";
                botonocul = "Eliminar";
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
