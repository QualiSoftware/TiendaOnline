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
import Modelos.NoLogCesta;
import Modelos.NoLogFavoritos;
import Modelos.NoLogFavoritosId;
import Modelos.NoLogUsuarios;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Subcategoria;
import Modelos.Tallas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.struts2.interceptor.validation.SkipValidation;

/*  
*   Author     : QualiSoftware
*/
public class HomeRopa extends ActionSupport {

    //variables fijas para todos los controladores
    private String filtro;
    private int clave;
    private String usuario;
    private String password;
    private String accion;
    private String titulo;
    private Map sesion;
    private String cabeceraocul;
    private String botonocul;
    private Ropa t;
    private RopaStock rstock;
    private String orden;
    private String fechaI;
    private String fechaF;
    private Usuarios u;
    private boolean superaPeriodo;
    private Map<String, String> stateMap = new LinkedHashMap<String, String>();
    private String countryName;
    private String roid;
    private String colorid;
    private String tallaid;
    private String cantidadprenda;
    private String scantidad;
    private String masmenos;
    private String idusu;
    private String stotal;
    private String prefact;
    private String unifact;
    private String sunifact;
    private String sprefactura;    

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
    private List<Campania> lista_campaniasTienda;
    private List<Marcas> lista_marcasTienda;
    private List<RopaStock> lista_ropaStock;

    private int roId;
    private Integer roId2;
    private int rostockId;
    private String campania;
    private String campaniaNombre;
    private int camDescuento;
    private String cliCodigo;
    private String catCodigo;
    private String categoriaNombre;
    private String clientelaNombre;
    private String coleccion2;
    private String look2;
    private String marca;
    private String marcaNom;
    private String roDescripcion2;
    private double roPrecio2;
    private int roDescuento2;
    private String roCaracteristicas2;
    private byte roVisible2;
    private int roUnidades2;
    private String accionocul;
    private String roFecha2;
    private Set<Fotos> fotoses2;
    private String subcategoria2;
    private String fotoAlta1;
    private String fotoAlta2;
    private String fotoAlta3;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private Integer cantidad;
    private String eliminadas;
    private boolean confotos;
    private List<File> archivo = new LinkedList<File>();
    private List<String> archivoContentType = new LinkedList<String>();
    private List<String> archivoFileName = new LinkedList<String>();
    private boolean hayFotos;
    private int maximo;
    private String precio;
    private String precioConDescuento;
    private String desc;
    private String diasDesc;
    private int periodo;
    private String mensajeError;
    private NoLogUsuarios nlu;
    private ArrayList<NoLogCesta> lista_ropa_Cesta_NoLog;

    public String getUsuario() {
        return usuario;
    }

    @RequiredStringValidator(message = "Usuario incompleto o erróneo")
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    @RequiredStringValidator(message = "Password incompleto o erróneo")
    public void setPassword(String password) {
        this.password = password;
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

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public Ropa getT() {
        return t;
    }

    public void setT(Ropa t) {
        this.t = t;
    }

    public RopaStock getRstock() {
        return rstock;
    }

    public void setRstock(RopaStock rstock) {
        this.rstock = rstock;
    }

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
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

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public Map<String, String> getStateMap() {
        return stateMap;
    }

    public void setStateMap(Map<String, String> stateMap) {
        this.stateMap = stateMap;
    }

    public String getRoid() {
        return roid;
    }

    public void setRoid(String roid) {
        this.roid = roid;
    }

    public String getColorid() {
        return colorid;
    }

    public void setColorid(String colorid) {
        this.colorid = colorid;
    }

    public String getTallaid() {
        return tallaid;
    }

    public void setTallaid(String tallaid) {
        this.tallaid = tallaid;
    }

    public String getCantidadprenda() {
        return cantidadprenda;
    }

    public void setCantidadprenda(String cantidadprenda) {
        this.cantidadprenda = cantidadprenda;
    }

    public String getScantidad() {
        return scantidad;
    }

    public void setScantidad(String scantidad) {
        this.scantidad = scantidad;
    }

    public String getMasmenos() {
        return masmenos;
    }

    public void setMasmenos(String masmenos) {
        this.masmenos = masmenos;
    }

    public String getIdusu() {
        return idusu;
    }

    public void setIdusu(String idusu) {
        this.idusu = idusu;
    }

    public String getPrefact() {
        return prefact;
    }

    public void setPrefact(String prefact) {
        this.prefact = prefact;
    }

    public String getUnifact() {
        return unifact;
    }

    public void setUnifact(String unifact) {
        this.unifact = unifact;
    }

    public String getSunifact() {
        return sunifact;
    }

    public void setSunifact(String sunifact) {
        this.sunifact = sunifact;
    }

    public String getSprefactura() {
        return sprefactura;
    }

    public void setSprefactura(String sprefactura) {
        this.sprefactura = sprefactura;
    }
    
    
    
    
    
    
    
    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public ArrayList<Ropa> getLista_ropa() {
        return lista_ropa;
    }

    public void setLista_ropa(ArrayList<Ropa> lista_ropa) {
        this.lista_ropa = lista_ropa;
    }

    public ArrayList<Ropa> getLista_menu_ropa() {
        return lista_menu_ropa;
    }

    public void setLista_menu_ropa(ArrayList<Ropa> lista_menu_ropa) {
        this.lista_menu_ropa = lista_menu_ropa;
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

    public List<RopaStock> getLista_ropaStock() {
        return lista_ropaStock;
    }

    public void setLista_ropaStock(List<RopaStock> lista_ropaStock) {
        this.lista_ropaStock = lista_ropaStock;
    }

    public int getRoId() {
        return roId;
    }

    public void setRoId(int roId) {
        this.roId = roId;
    }

    public Integer getRoId2() {
        return roId2;
    }

    public void setRoId2(Integer roId2) {
        this.roId2 = roId2;
    }

    public String getStotal() {
        return stotal;
    }

    public void setStotal(String stotal) {
        this.stotal = stotal;
    }

    
    
    public int getRostockId() {
        return rostockId;
    }

    public void setRostockId(int rostockId) {
        this.rostockId = rostockId;
    }

    public String getCampania() {
        return campania;
    }

    public void setCampania(String campania) {
        this.campania = campania;
    }

    public String getCliCodigo() {
        return cliCodigo;
    }

    public void setCliCodigo(String cliCodigo) {
        this.cliCodigo = cliCodigo;
    }

    public String getCatCodigo() {
        return catCodigo;
    }

    public void setCatCodigo(String catCodigo) {
        this.catCodigo = catCodigo;
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

    public int getRoDescuento2() {
        return roDescuento2;
    }

    public void setRoDescuento2(int roDescuento2) {
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

    public String getAccionocul() {
        return accionocul;
    }

    public void setAccionocul(String accionocul) {
        this.accionocul = accionocul;
    }

    public String getSubcategoria2() {
        return subcategoria2;
    }

    public void setSubcategoria2(String subcategoria2) {
        this.subcategoria2 = subcategoria2;
    }

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
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

    public boolean isSuperaPeriodo() {
        return superaPeriodo;
    }

    public void setSuperaPeriodo(boolean superaPeriodo) {
        this.superaPeriodo = superaPeriodo;
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

    public List<Coleccion> getLista_colecciones() {
        return lista_colecciones;
    }

    public void setLista_colecciones(List<Coleccion> lista_colecciones) {
        this.lista_colecciones = lista_colecciones;
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

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
    }

    public List<Campania> getLista_campaniasTienda() {
        return lista_campaniasTienda;
    }

    public void setLista_campaniasTienda(List<Campania> lista_campaniasTienda) {
        this.lista_campaniasTienda = lista_campaniasTienda;
    }

    public List<Marcas> getLista_marcasTienda() {
        return lista_marcasTienda;
    }

    public void setLista_marcasTienda(List<Marcas> lista_marcasTienda) {
        this.lista_marcasTienda = lista_marcasTienda;
    }

    public String getCampaniaNombre() {
        return campaniaNombre;
    }

    public void setCampaniaNombre(String campaniaNombre) {
        this.campaniaNombre = campaniaNombre;
    }

    public int getCamDescuento() {
        return camDescuento;
    }

    public void setCamDescuento(int camDescuento) {
        this.camDescuento = camDescuento;
    }

    public String getCategoriaNombre() {
        return categoriaNombre;
    }

    public void setCategoriaNombre(String categoriaNombre) {
        this.categoriaNombre = categoriaNombre;
    }

    public String getClientelaNombre() {
        return clientelaNombre;
    }

    public void setClientelaNombre(String clientelaNombre) {
        this.clientelaNombre = clientelaNombre;
    }

    public String getMarcaNom() {
        return marcaNom;
    }

    public void setMarcaNom(String marcaNom) {
        this.marcaNom = marcaNom;
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

    public int getTotalcestaUsuario() {
        return totalcestaUsuario;
    }

    public void setTotalcestaUsuario(int totalcestaUsuario) {
        this.totalcestaUsuario = totalcestaUsuario;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public int getMaximo() {
        return maximo;
    }

    public void setMaximo(int maximo) {
        this.maximo = maximo;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getPrecioConDescuento() {
        return precioConDescuento;
    }

    public void setPrecioConDescuento(String precioConDescuento) {
        this.precioConDescuento = precioConDescuento;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDiasDesc() {
        return diasDesc;
    }

    public void setDiasDesc(String diasDesc) {
        this.diasDesc = diasDesc;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }

    public NoLogUsuarios getNlu() {
        return nlu;
    }

    public void setNlu(NoLogUsuarios nlu) {
        this.nlu = nlu;
    }

    public ArrayList<NoLogCesta> getLista_ropa_Cesta_NoLog() {
        return lista_ropa_Cesta_NoLog;
    }

    public void setLista_ropa_Cesta_NoLog(ArrayList<NoLogCesta> lista_ropa_Cesta_NoLog) {
        this.lista_ropa_Cesta_NoLog = lista_ropa_Cesta_NoLog;
    }
    
    @SkipValidation
    public String RopaFiltro() throws Exception {
        
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        superaPeriodo = false;
        diasDesc = Acciones.HomePropiedades.muestraValor("dias.descuento");
        desc = Acciones.HomePropiedades.muestraValor("descuento");
        periodo = Integer.parseInt(Acciones.HomePropiedades.muestraValor("dias.antiguedad.para.apadrinar"));
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                    Date hoy = new Date();
                    hoy = sumarRestarDiasFecha(hoy, -periodo);
                    if(u.getUsuAlta().before(hoy)){
                        superaPeriodo = true;
                    }
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                            + " con usuID "+sesion.get("usuId")+" el día "+new Date());
                }
            }
        }
        
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        if(orden == null || orden.equals("null") || orden.equals("") || orden.equals("/")){
            orden = "categoria.catDescripcion";
        }
        if((fechaI == null) || (fechaF == null) || fechaI.equals("null") || fechaF.equals("null")){
            fechaI = "";
            fechaF = "";
        }
        if(eliminadas == null || eliminadas.equals("null") || eliminadas.equals("/") || eliminadas.equals("")){
            eliminadas = "2";
        }
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos("","categoria.catDescripcion","","","2");
        lista_campanias = ControladoresDAO.cCampanias.RecuperaCampaniasActivas("");
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_campaniasTienda = ControladoresDAO.cCampanias.RecuperaCampaniasActivas(filtro);
        lista_marcasTienda =  ControladoresDAO.cMarcas.RecuperaTodos(filtro);
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
        lista_ropa.clear();
        lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro,orden,fechaI,fechaF,eliminadas);
        cargarCesta();
        return SUCCESS;
    }

    @SkipValidation
    public String RopaForm() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
         try{
            Usuarios u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
            if(u.getUsuAdministrador()!=1){
                return INPUT;
            }
         }catch(Exception e){
            return INPUT;
         }
        lista_marcas = ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_clientela = ControladoresDAO.cClientela.RecuperaTodos("");
        lista_look = ControladoresDAO.cLook.RecuperaTodos("");
        lista_tallas = ControladoresDAO.cTallas.RecuperaTodos("");
        lista_colores = ControladoresDAO.cColor.RecuperaTodos("");
        lista_colecciones = ControladoresDAO.cColeccion.RecuperaTodos("");
        lista_categoria = ControladoresDAO.cCategorias.RecuperaTodos("");
        lista_subcategoria = ControladoresDAO.cSubcategorias.RecuperaTodos("");
        int year;
        int month;
        String monthString;
        int day;
        String dayString;
        t = ControladoresDAO.cRopa.RecuperaPorId(clave);
        if (accion.equals("a")) {
            roId2 = 0;
            roDescripcion2 = "";
            roPrecio2 = 0.0;
            roDescuento2 = 0;
            roCaracteristicas2 = "";
            roVisible2 = 1;
            fotoses2 = null;
            fotoAlta1 = "";
            fotoAlta2 = "";
            fotoAlta3 = "";
            rostockId = 0;
            roUnidades2 = 0;            
            Date hoy = new Date();
            year = hoy.getYear() + 1900;
            month = hoy.getMonth()+1;
            day = hoy.getDate();
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
            titulo = "Alta";           
            accionocul = "a";
            cabeceraocul = "Alta";
            botonocul = "Alta";
        } else {
            if(rostockId == -1){
                roId2 = clave;
                roDescripcion2 = t.getRoDescripcion();
                roPrecio2 = t.getRoPrecio();
                roDescuento2 = t.getRoDescuento();
                roCaracteristicas2 = t.getRoCaracteristicas();
                roVisible2 = t.getRoVisible();
            }else{            
                rstock = ControladoresDAO.cRopaStock.RecuperaPorId(rostockId);
                year = rstock.getRostockFecha().getYear() + 1900;
                month = rstock.getRostockFecha().getMonth()+1;
                day = rstock.getRostockFecha().getDate();
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
                roUnidades2 = rstock.getRostockUnidades();
            }
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
        if (roId2 != 0) {
            t = ControladoresDAO.cRopa.RecuperaPorId(roId2);
        } else {
            t = new Ropa();
        }
        if (!accionocul.equals("e")) {
            t.setClientela(ControladoresDAO.cClientela.RecuperaPorId(Integer.parseInt(cliCodigo)));
            t.setColeccion(ControladoresDAO.cColeccion.RecuperaPorId(Integer.parseInt(coleccion2)));
            t.setLook(ControladoresDAO.cLook.RecuperaPorId(Integer.parseInt(look2)));
            t.setMarcas(ControladoresDAO.cMarcas.RecuperaPorId(Integer.parseInt(marca)));
            t.setRoDescripcion(roDescripcion2);
            t.setRoPrecio(roPrecio2);
            t.setRoDescuento(roDescuento2);
            t.setRoCaracteristicas(roCaracteristicas2);
            t.setRoVisible(roVisible2);
            if(!hayFotos){
                t.setCategoria(ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(catCodigo)));
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
    
    @SkipValidation
    public String ajaxAction() throws Exception{
        Categoria c = ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(countryName));
            for(Subcategoria auxsubcat:c.getSubcategorias()){
                stateMap.put(""+auxsubcat.getSubId(), auxsubcat.getSubDescripcion());
            }
           //dummyMsg = "Ajax action Triggered";
        return SUCCESS;
    }
    
    @SkipValidation
    public String RopaMenu() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }     
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    //int aux;
                    u = null;
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                            + " con usuID "+sesion.get("usuId")+" el día "+new Date());
                }
            }
        }
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_tallas = ControladoresDAO.cTallas.RecuperaTodos("");
        lista_colores = ControladoresDAO.cColor.RecuperaTodos("");
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
        if ((marca == null || marca.equals("") || marca.equals("0")) && (cliCodigo == null || cliCodigo.equals("") || cliCodigo.equals("0")) && (campania == null || campania.equals("") || campania.equals("0"))) {            
            lista_ropa = ControladoresDAO.cRopa.RecuperaTodos(filtro,"categoria.catDescripcion","","","1");
        }else if((marca == null || marca.equals("") || marca.equals("0")) && (campania == null || campania.equals("") || campania.equals("0"))){
            lista_ropa = ControladoresDAO.cRopa.RecuperaClientelaCategoria(cliCodigo, catCodigo,filtro);
            Clientela cli = ControladoresDAO.cClientela.RecuperaPorId(Integer.parseInt(cliCodigo));
            clientelaNombre = cli.getClientelaDescripcion();
            Categoria cat = ControladoresDAO.cCategorias.RecuperaPorId(Integer.parseInt(catCodigo));
            categoriaNombre = cat.getCatDescripcion();
        }else if(marca == null || marca.equals("") || marca.equals("0")){
            List <Integer> listaRoId = ControladoresDAO.cCampaniasRopa.RecuperaRopaPorCampania(Integer.parseInt(campania));
            for(Integer lroid:listaRoId){
                //Desde acá hasta donde termina el for que está abajo lo único que hacen es cargar datos en memoria
                Ropa ropa = ControladoresDAO.cRopa.RecuperaPorId(lroid);
                boolean aux = ropa.getCampaniaRopas().isEmpty();
                aux = ropa.getFavoritoses().isEmpty();
                aux = ropa.getFotoses().isEmpty();
                String auxString = ropa.getCategoria().getCatDescripcion();
                auxString = ropa.getSubcategoria().getSubDescripcion();
                for(RopaStock ropaStock:ropa.getRopaStocks()){
                    int unidades = ropaStock.getRostockUnidades();
                    auxString = ropaStock.getColor().getColorDescripcion();
                    auxString = ropaStock.getTallas().getTallaDescripcion();
                }
                for(NoLogFavoritos noLogFavoritos:ropa.getNoLogFavoritoses()){
                    NoLogFavoritosId auxInt = noLogFavoritos.getId();
                }
                lista_ropa.add(ropa);
            }
            Campania camp = ControladoresDAO.cCampanias.RecuperaPorId(Integer.parseInt(campania));
            campaniaNombre = camp.getCamNombre();
            camDescuento = camp.getCamDescuento();
        }else{
            lista_ropa = ControladoresDAO.cRopa.RecuperaPorMarca(marca, filtro);
            Marcas mar = ControladoresDAO.cMarcas.RecuperaPorId(Integer.parseInt(marca));
            marcaNom = mar.getMarcaNombre();
        }
        lista_ropa = poneDescuentosBien(lista_ropa);
        cargarCesta();
       return SUCCESS;
    }
    
    public ArrayList<Ropa> poneDescuentosBien (ArrayList<Ropa> lista){
        ArrayList<Ropa> listaConDescuentosBien = new ArrayList<>();
        for(Ropa lr: lista){
            listaConDescuentosBien.add(descuentoEnRopa(lr));
        }
        return listaConDescuentosBien;
    }
    
    public Ropa descuentoEnRopa(Ropa r){
            List<Integer> listaCampaniasDeEstaRopa = ControladoresDAO.cCampaniasRopa.RecuperaCampaniasPorRopa(r.getRoId());
            if(!listaCampaniasDeEstaRopa.isEmpty()){
                Date hoy = new Date();
                for(Integer camId:listaCampaniasDeEstaRopa){
                    Campania cam = ControladoresDAO.cCampanias.RecuperaPorId(camId);
                    if(hoy.after(cam.getCamInicio()) && hoy.before(cam.getCamFin())){
                        r.setRoDescuento(cam.getCamDescuento());
                    }
                }
            }
        return r;
    }

    @SkipValidation
    public String RopaPopUp() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }        
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    u = null;
                    u = (Usuarios) ControladoresDAO.cUsuarios.RecuperaPorId(Integer.parseInt(sesion.get("usuId")+""));
                }catch(Exception e){
                    HomeUsuariosValidaciones huv = new HomeUsuariosValidaciones();
                    huv.escribirEnArchivoLog("Error al intentar cargar un usuario en método " + e.getStackTrace()[0].getMethodName()
                            + " con usuID "+sesion.get("usuId")+" el día "+new Date());
                }
            }
        }
        lista_ropaStock = ControladoresDAO.cRopaStock.RecuperaTodos(roId, "");
        lista_colores = new ArrayList<Color>();
        lista_tallas = new ArrayList<Tallas>();
        lista_colores.add(lista_ropaStock.get(0).getColor());
        lista_tallas.add(lista_ropaStock.get(0).getTallas());
        //Las dos líneas que siguen las necesito sólo para que funcione el login en tiendaDetalle.jsp
        lista_colores.get(0).getColorDescripcion();
        lista_tallas.get(0).getTallaDescripcion();
        for(int i=1;i<lista_ropaStock.size();i++){
            boolean bool = true;
            for(int j=0;j<lista_colores.size();j++){
                if(lista_ropaStock.get(i).getColor().getColorId() == lista_colores.get(j).getColorId()){
                    bool = false;
                }
            }
            if(bool){
                lista_colores.add(lista_ropaStock.get(i).getColor());
                //Las dos líneas siguientes son necesarias para cargar la descripción en memoria, nada más.
                int tam = lista_colores.size();
                lista_colores.get(tam-1).getColorDescripcion();
            }
            bool = true;
            for(int j=0;j<lista_tallas.size();j++){
                if(lista_ropaStock.get(i).getTallas().getTallaId() == lista_tallas.get(j).getTallaId()){
                    bool = false;
                }
            }
            if(bool){
                lista_tallas.add(lista_ropaStock.get(i).getTallas());
                //Las dos líneas siguientes son necesarias para cargar la descripción en memoria, nada más.
                int tam = lista_tallas.size();
                lista_tallas.get(tam-1).getTallaDescripcion();
            }
        }
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
        lista_marcas =  ControladoresDAO.cMarcas.RecuperaTodos("");
        lista_ropa.clear();
        if (filtro == null || filtro.equals("null")) {
            filtro = "";
        }
        Ropa tr = ControladoresDAO.cRopa.RecuperaPorId(roId);
        if(lista_colores.size() == 1){
            maximo = lista_ropaStock.get(0).getRostockUnidades();
        }else{
            maximo = 1;
        }
        clientelaNombre = tr.getClientela().getClientelaDescripcion();
        categoriaNombre = tr.getCategoria().getCatDescripcion();
        marcaNom = tr.getMarcas().getMarcaNombre();
        t = descuentoEnRopa(tr);
        DecimalFormat df = new DecimalFormat("#.00");
        precio = df.format(t.getRoPrecio());
        precioConDescuento = df.format(t.getRoPrecio() - (t.getRoPrecio() * t.getRoDescuento() / 100));
        try{
            if(!campania.equals("")){
                Campania camp = ControladoresDAO.cCampanias.RecuperaPorId(Integer.parseInt(campania));
                campaniaNombre = camp.getCamNombre();
            }
        }catch(Exception e){
            campaniaNombre = "";
        }
        cargarCesta();
        return SUCCESS;
    }
    
    public static Date sumarRestarDiasFecha(Date fecha, int dias){
        Calendar calendar = Calendar.getInstance();calendar.setTime(fecha);
        calendar.add(Calendar.DAY_OF_YEAR, dias);
        return calendar.getTime();
    }
    
    @SkipValidation
    public String ajaxFavoritos() throws Exception{
        //Necesito este método para que no de error el struts del orto y la puta que lo parió
       return SUCCESS;
    }

    private void cargarCesta() {        
        if(sesion.get("usuId") == null){
                sesion.put("usuId", "");            
        }
        if(sesion.get("cookieLogueado") != null){
            nlu = (NoLogUsuarios) sesion.get("cookieLogueado");
        }
        if(u != null){
            lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(sesion.get("usuId")+"");
            for(Cesta caux:lista_ropa_Cestas){
                totalcestaUsuario += caux.getCestaUnidades();
                caux.getRopaStock().setRopa(descuentoEnRopa(caux.getRopaStock().getRopa()));
            }
        } else if(sesion.get("cookieLogueado") != null){
            lista_ropa_Cesta_NoLog = ControladoresDAO.cCestaNoLog.RecuperaTodos(""+nlu.getNluUsuId());
            for(NoLogCesta caux:lista_ropa_Cesta_NoLog){
                totalcestaUsuario += caux.getNlcUnidades();
                caux.getRopaStock().setRopa(descuentoEnRopa(caux.getRopaStock().getRopa()));
            }
        }
    }
}
