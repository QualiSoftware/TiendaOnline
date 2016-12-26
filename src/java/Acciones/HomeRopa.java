/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelos.Campania;
import Modelos.Categoria;
import Modelos.Cesta;
import Modelos.Clientela;
import Modelos.Coleccion;
import Modelos.Color;
import Modelos.Fotos;
import Modelos.Look;
import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.Subcategoria;
import Modelos.Tallas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
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
    private String orden;
    private String fechaI;
    private String fechaF;
    private Usuarios u;
    

    //variables específicas a cada controlador
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Categoria> lista_categoria;
    private List<Clientela> lista_clientela;
    private List<Look> lista_look;
    private List<Tallas> lista_tallas;
    private List<Color> lista_colores;
    private List<Coleccion> lista_colecciones;
    private List<Subcategoria> lista_subcategoria;
    private List<Campania> lista_campanias;
    private List<Marcas>lista_marcas;

    private Integer roId2;
    private String campania;
    private String campaniaNombre;
    private String clientela;
    private String categoria;
    private String clientela2;
    private String coleccion2;
    private String color2;
    private String look2;
    private String marca;
    private String marcas2;
    private String tallas2;
    private String roDescripcion2;
    private double roPrecio2;
    private double roDescuento2;
    private String roCaracteristicas2;
    private byte roVisible2;
    private int roUnidades2;
    private String accionocul;
    private String roFecha2;
    private Set<Fotos> fotoses2;
    private String categoria2;
    private String subcategoria2;
    private String fotoAlta1;
    private String fotoAlta2;
    private String fotoAlta3;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private String usi;
    private Integer cantidad;
    private String eliminadas;
    private boolean confotos;
    private List<File> archivo = new LinkedList<File>();
    private List<String> archivoContentType = new LinkedList<String>();
    private List<String> archivoFileName = new LinkedList<String>();
    private boolean hayFotos;

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
    }
    
    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public String getEliminadas() {
        return eliminadas;
    }

    public void setEliminadas(String eliminadas) {
        this.eliminadas = eliminadas;
    }

    public boolean isConfotos() {
        return confotos;
    }

    public void setConfotos(boolean confotos) {
        this.confotos = confotos;
    }

    public List<File> getArchivo() {
        return archivo;
    }

    public void setArchivo(List<File> archivo) {
        this.archivo = archivo;
    }

    public List<String> getArchivoContentType() {
        return archivoContentType;
    }

    public void setArchivoContentType(List<String> archivoContentType) {
        this.archivoContentType = archivoContentType;
    }

    public List<String> getArchivoFileName() {
        return archivoFileName;
    }

    public void setArchivoFileName(List<String> archivoFileName) {
        this.archivoFileName = archivoFileName;
    }

    public boolean isHayFotos() {
        return hayFotos;
    }

    public void setHayFotos(boolean hayFotos) {
        this.hayFotos = hayFotos;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public String getUsi() {
        return usi;
    }

    public void setUsi(String usi) {
        this.usi = usi;
    }

    public int getTotalcestaUsuario() {
        return totalcestaUsuario;
    }

    public void setTotalcestaUsuario(int totalcestaUsuario) {
        this.totalcestaUsuario = totalcestaUsuario;
    }

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
    }
      
    private Map<String, String> stateMap = new LinkedHashMap<String, String>();
    private String dummyMsg;
    //Parameter from Jquery
    private String countryName;

    public Map<String, String> getStateMap() {
        return stateMap;
    }

    public void setStateMap(Map<String, String> stateMap) {
        this.stateMap = stateMap;
    }

    public String getDummyMsg() {
        return dummyMsg;
    }

    public void setDummyMsg(String dummyMsg) {
        this.dummyMsg = dummyMsg;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getFotoAlta1() {
        return fotoAlta1;
    }

    public void setFotoAlta1(String fotoAlta1) {
        this.fotoAlta1 = fotoAlta1;
    }

    public String getFotoAlta2() {
        return fotoAlta2;
    }

    public void setFotoAlta2(String fotoAlta2) {
        this.fotoAlta2 = fotoAlta2;
    }

    public String getFotoAlta3() {
        return fotoAlta3;
    }

    public void setFotoAlta3(String fotoAlta3) {
        this.fotoAlta3 = fotoAlta3;
    }

    public String getCategoria2() {
        return categoria2;
    }

    public void setCategoria2(String categoria2) {
        this.categoria2 = categoria2;
    }

    public String getSubcategoria2() {
        return subcategoria2;
    }

    public void setSubcategoria2(String subcategoria2) {
        this.subcategoria2 = subcategoria2;
    }

    public String getColeccion2() {
        return coleccion2;
    }

    public void setColeccion2(String coleccion2) {
        this.coleccion2 = coleccion2;
    }

    public String getLook2() {
        return look2;
    }

    public void setLook2(String look2) {
        this.look2 = look2;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getMarcas2() {
        return marcas2;
    }

    public void setMarcas2(String marcas2) {
        this.marcas2 = marcas2;
    }

    public String getTallas2() {
        return tallas2;
    }

    public void setTallas2(String tallas2) {
        this.tallas2 = tallas2;
    }

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

    public List<Campania> getLista_campanias() {
        return lista_campanias;
    }

    public void setLista_campanias(List<Campania> lista_campanias) {
        this.lista_campanias = lista_campanias;
    }

    public ArrayList<Ropa> getLista_menu_ropa() {
        return lista_menu_ropa;
    }

    public void setLista_menu_ropa(ArrayList<Ropa> lista_menu_ropa) {
        this.lista_menu_ropa = lista_menu_ropa;
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

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
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

    public String getCampania() {
        return campania;
    }

    public void setCampania(String campania) {
        this.campania = campania;
    }

    public String getCampaniaNombre() {
        return campaniaNombre;
    }

    public void setCampaniaNombre(String campaniaNombre) {
        this.campaniaNombre = campaniaNombre;
    }

    public String getClientela() {
        return clientela;
    }

    public void setClientela(String clientela) {
        this.clientela = clientela;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getClientela2() {
        return clientela2;
    }

    public void setClientela2(String clientela2) {
        this.clientela2 = clientela2;
    }

    public String getColor2() {
        return color2;
    }

    public void setColor2(String color2) {
        this.color2 = color2;
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

    public String getRoFecha2() {
        return roFecha2;
    }

    public void setRoFecha2(String roFecha2) {
        this.roFecha2 = roFecha2;
    }

    public Set<Fotos> getFotoses2() {
        return fotoses2;
    }

    public void setFotoses2(Set<Fotos> fotoses2) {
        this.fotoses2 = fotoses2;
    }

    public String getFechaI() {
        return fechaI;
    }

    public void setFechaI(String fechaI) {
        this.fechaI = fechaI;
    }

    public String getFechaF() {
        return fechaF;
    }

    public void setFechaF(String fechaF) {
        this.fechaF = fechaF;
    }

    @SkipValidation
    public String RopaFiltro() throws Exception {
        
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        usi = "";
        // para cuando tengamos sesión de usuario
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    int aux;
                    u = (Usuarios) sesion.get("usuarioLogueado");
                    aux = u.getUsuId();
                    u = ControladoresDAO.cUsuarios.RecuperaPorId(aux);
                    sesion.clear();
                    sesion.put("usuarioLogueado", (Usuarios) u);
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            }
        }
        
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        if(orden == null || orden.equals("null") || orden.equals("")){
            orden = "categoria.catDescripcion";
        }
        if((fechaI == null) || (fechaF == null) || fechaI.equals("null") || fechaF.equals("null")){
            fechaI = "";
            fechaF = "";
        }
        if(eliminadas == null || eliminadas.equals("null")){
            eliminadas = "2";
        }
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(usi);
        for(Cesta caux:lista_ropa_Cestas){
            totalcestaUsuario += caux.getCestaUnidades();
        }       
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro,orden,fechaI,fechaF,eliminadas);
        lista_campanias = ControladoresDAO.cCampanias.RecuperaCampaniasActivas();
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_menu_ropa = new ArrayList<Ropa>();
        for(Ropa lr: lista_ropa){
            String auxClientela = lr.getClientela().getClientelaDescripcion();
            String auxCategoria = lr.getCategoria().getCatDescripcion();
            boolean noEsta = true;
            for(Ropa lrm: lista_menu_ropa){
                if(auxClientela.equals(lrm.getClientela().getClientelaDescripcion()) && auxCategoria.equals(lrm.getCategoria().getCatDescripcion())){
                    noEsta = false;
                }
            }
            if(noEsta){
                lista_menu_ropa.add(lr);
            }
        }
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
        lista_marcas = ControladoresDAO.cMarcas.RecuperaTodos("");
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
            fotoses2 = null;
            fotoAlta1 = "";
            fotoAlta2 = "";
            fotoAlta3 = "";
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        } else {
            t = ControladoresDAO.cRopa.RecuperaPorId(clave);
            int year;
            int month;
            String monthString;
            int day;
            String dayString;
            year = t.getRoFecha().getYear() + 1900;
            month = t.getRoFecha().getMonth()+1;
            day = t.getRoFecha().getDate();
            if(month < 10){
                monthString = "0"+month;
            }else{
                monthString = ""+month;
            }
            if(day < 10){
                dayString = "0"+day;
            }else{
                dayString = ""+day;
            }
            roFecha2 = dayString+"-"+monthString+"-"+year;
            roId2 = t.getRoId();
            roDescripcion2 = t.getRoDescripcion();
            roPrecio2 = t.getRoPrecio();
            roDescuento2 = t.getRoDescuento();
            roCaracteristicas2 = t.getRoCaracteristicas();
            roVisible2 = t.getRoVisible();
            roUnidades2 = t.getRoUnidades();
        }
        if (accion.equals("m")) {
            accionocul = "m";
            cabeceraocul = "Modificación";
            botonocul = "Modificar";
        }
        if (accion.equals("e")) {
            accionocul = "e";
            cabeceraocul = "Eliminación";
            botonocul = "Eliminar";
        }
        if (accion.equals("c")) {
            cantidad = 1;
            accionocul = "c";
            cabeceraocul = "Añadir Cesta";
            botonocul = "Añadir Cesta";
        }

        return SUCCESS;
    }

    @SkipValidation
    public String CrudActionRopa() throws Exception {
        int respuesta;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String year;
        String month;
        String day;
        year = roFecha2.substring(6, 10);
        month = roFecha2.substring(3, 5);
        day = roFecha2.substring(0, 2);
        roFecha2 = year+"-"+month+"-"+day;
        Date fecha = sdf.parse(roFecha2);
        if (roId2 != 0) {
            t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        } else {
            t = new Ropa();
        }
        if (!accionocul.equals("e")) {
            t.setClientela(ControladoresDAO.cClientela.RecuperaPorId(Integer.parseInt(clientela2)));
            t.setColeccion(ControladoresDAO.cColeccion.RecuperaPorId(Integer.parseInt(coleccion2)));
            t.setColor(ControladoresDAO.cColor.RecuperaPorId(Integer.parseInt(color2)));
            t.setLook(ControladoresDAO.cLook.RecuperaPorId(Integer.parseInt(look2)));
            t.setMarcas(ControladoresDAO.cMarcas.RecuperaPorId(Integer.parseInt(marcas2)));
            t.setTallas(ControladoresDAO.cTallas.RecuperaPorId(Integer.parseInt(tallas2)));
            t.setRoDescripcion(roDescripcion2);
            t.setRoPrecio(roPrecio2);
            t.setRoDescuento(roDescuento2);
            t.setRoCaracteristicas(roCaracteristicas2);
            t.setRoVisible(roVisible2);
            t.setRoUnidades(roUnidades2);
            t.setRoFecha(fecha);
            if(!hayFotos){
                t.setCategoria(ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(categoria2)));
                t.setSubcategoria(ControladoresDAO.cSubcategorias.RecuperaPorId(Integer.parseInt(subcategoria2)));
            }
        }
        if (accionocul.equals("a")) {
            respuesta = ControladoresDAO.cRopa.Inserta(t);
            if(confotos){
                return INPUT;
            }
        }
        if (accionocul.equals("m")) {            
            respuesta = ControladoresDAO.cRopa.Modifica(t);
        }
        if (accionocul.equals("e")) {
            byte b = 0;
            t.setRoVisible(b);
            respuesta = ControladoresDAO.cRopa.Modifica(t);
        }
        return SUCCESS;
    }
    
    public String ajaxAction() throws Exception{
       Categoria c = ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(countryName));
                  for(Subcategoria auxsubcat:c.getSubcategorias()){
                      stateMap.put(""+auxsubcat.getSubId(), auxsubcat.getSubDescripcion());
                      //System.out.println("id"+auxsubcat.getSubId()+"descri"+auxsubcat.getSubDescripcion());
                      //System.out.println(stateMap);
                  }

           dummyMsg = "Ajax action Triggered";
       return SUCCESS;
    }
    
    public String RopaMenu() throws Exception {
        
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        usi = "";        
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    int aux;
                    u = (Usuarios) sesion.get("usuarioLogueado");
                    aux = u.getUsuId();
                    u = ControladoresDAO.cUsuarios.RecuperaPorId(aux);
                    sesion.clear();
                    sesion.put("usuarioLogueado", (Usuarios) u);
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            }
        }        
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(usi);
        for(Cesta caux:lista_ropa_Cestas){
            totalcestaUsuario += caux.getCestaUnidades();
        }
        //lista_campanias = ControladoresDAO.cCampanias.RecuperaCampaniasActivas();
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_menu_ropa = new ArrayList<Ropa>();
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos("","categoria.catDescripcion","","","2");
        for(Ropa lr: lista_ropa){
            String auxClientela = lr.getClientela().getClientelaDescripcion();
            String auxCategoria = lr.getCategoria().getCatDescripcion();
            boolean noEsta = true;
            for(Ropa lrm: lista_menu_ropa){
                if(auxClientela.equals(lrm.getClientela().getClientelaDescripcion()) && auxCategoria.equals(lrm.getCategoria().getCatDescripcion())){
                    noEsta = false;
                }
            }
            if(noEsta){
                lista_menu_ropa.add(lr);
            }
        }
        lista_ropa.clear();
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        //System.out.println("filtro: "+filtro+" clientela2: "+clientela2+" categoria2: "+categoria2+" marcas2: "+marcas2);
        if ((marcas2 == null || marcas2.equals("")) && (clientela2 == null || clientela2.equals("")) && (campania == null || campania.equals(""))) {            
            lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro,"categoria.catDescripcion","","","1");
        }else if((marcas2 == null || marcas2.equals("")) && (campania == null || campania.equals(""))){
            System.out.println(campania+2);
            lista_ropa = ControladoresDAO.cRopa.RecuperaClientelaCategoria(clientela2, categoria2,filtro);
            Clientela cli = ControladoresDAO.cClientela.RecuperaPorId(Integer.parseInt(clientela2));
            clientela = cli.getClientelaDescripcion();
            Categoria cat = ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(categoria2));
            categoria = cat.getCatDescripcion();
        }else if(marcas2 == null || marcas2.equals("")){
            List <Integer> listaRoId = ControladoresDAO.cCampaniasRopa.RecuperaRopaPorCampania(Integer.parseInt(campania));
            for(Integer lroid:listaRoId){
                lista_ropa.add(ControladoresDAO.cRopa.RecuperaPorId(lroid));
            }
            Campania camp = ControladoresDAO.cCampanias.RecuperaPorId(Integer.parseInt(campania));
            campaniaNombre = camp.getCamNombre();
        }else{
            lista_ropa = ControladoresDAO.cRopa.RecuperaPorMarca(marcas2, filtro);
            Marcas mar = ControladoresDAO.cMarcas.RecuperaPorId(Integer.parseInt(marcas2));
            marca = mar.getMarcaNombre();
        }
       return SUCCESS;
    }
}
