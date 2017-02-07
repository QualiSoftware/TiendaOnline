package Acciones;

import Modelos.Campania;
import Modelos.Categoria;
import Modelos.Cesta;
import Modelos.Clientela;
import Modelos.Color;
import Modelos.Marcas;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Tallas;
import Modelos.Usuarios;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class HomeRopaStock {
    
    private String accion;
    private String filtro;
    private String orden;
    private String eliminadas;
    private String cabeceraocul;
    private String botonocul;
    private String titulo;
    private int rostockId;
    private String tallas2;
    private String color2;
    private int roUnidades2;
    private String roFecha2;
    private RopaStock rstock;
    private Ropa t;
    private int roId;
    private List<Tallas> lista_tallas;
    private List<Color> lista_colores;
    private ArrayList<Cesta> lista_ropa_Cestas;
    private int totalcestaUsuario = 0;
    private String usi;
    private Map sesion;
    private Usuarios u;
    private List<RopaStock> lista_ropaStock;
    private String clientela2,categoria2,marcas2,campania;
    private ArrayList<Ropa> lista_ropa,lista_menu_ropa;
    private List<Marcas>lista_marcas;
    private String clientela, categoria, marca, campaniaNombre;

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
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

    public String getEliminadas() {
        return eliminadas;
    }

    public void setEliminadas(String eliminadas) {
        this.eliminadas = eliminadas;
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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getRostockId() {
        return rostockId;
    }

    public void setRostockId(int rostockId) {
        this.rostockId = rostockId;
    }

    public String getTallas2() {
        return tallas2;
    }

    public void setTallas2(String tallas2) {
        this.tallas2 = tallas2;
    }

    public String getColor2() {
        return color2;
    }

    public void setColor2(String color2) {
        this.color2 = color2;
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

    public RopaStock getRstock() {
        return rstock;
    }

    public void setRstock(RopaStock rstock) {
        this.rstock = rstock;
    }

    public Ropa getT() {
        return t;
    }

    public int getRoId() {
        return roId;
    }

    public void setRoId(int roId) {
        this.roId = roId;
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

    public ArrayList<Cesta> getLista_ropa_Cestas() {
        return lista_ropa_Cestas;
    }

    public void setLista_ropa_Cestas(ArrayList<Cesta> lista_ropa_Cestas) {
        this.lista_ropa_Cestas = lista_ropa_Cestas;
    }

    public int getTotalcestaUsuario() {
        return totalcestaUsuario;
    }

    public void setTotalcestaUsuario(int totalcestaUsuario) {
        this.totalcestaUsuario = totalcestaUsuario;
    }

    public String getUsi() {
        return usi;
    }

    public void setUsi(String usi) {
        this.usi = usi;
    }

    public Map getSesion() {
        return sesion;
    }

    public void setSesion(Map sesion) {
        this.sesion = sesion;
    }

    public Usuarios getU() {
        return u;
    }

    public void setU(Usuarios u) {
        this.u = u;
    }

    public List<RopaStock> getLista_ropaStock() {
        return lista_ropaStock;
    }

    public void setLista_ropaStock(List<RopaStock> lista_ropaStock) {
        this.lista_ropaStock = lista_ropaStock;
    }

    public String getClientela2() {
        return clientela2;
    }

    public void setClientela2(String clientela2) {
        this.clientela2 = clientela2;
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

    public List<Marcas> getLista_marcas() {
        return lista_marcas;
    }

    public void setLista_marcas(List<Marcas> lista_marcas) {
        this.lista_marcas = lista_marcas;
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

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCampaniaNombre() {
        return campaniaNombre;
    }

    public void setCampaniaNombre(String campaniaNombre) {
        this.campaniaNombre = campaniaNombre;
    }

    public String getCategoria2() {
        return categoria2;
    }

    public void setCategoria2(String categoria2) {
        this.categoria2 = categoria2;
    }

    public String getMarcas2() {
        return marcas2;
    }

    public void setMarcas2(String marcas2) {
        this.marcas2 = marcas2;
    }

    public String getCampania() {
        return campania;
    }

    public void setCampania(String campania) {
        this.campania = campania;
    }

    public String RopaPopUp() throws Exception {
        if (sesion == null) {
            sesion = ActionContext.getContext().getSession();
        }
        usi = "";        
        if(sesion.get("usuarioLogueado") != null){
            if(!sesion.get("usuarioLogueado").equals("")){
                try{
                    //int aux;
                    u = null;
                    u = (Usuarios) sesion.get("usuarioLogueado");
                    usi = ""+u.getUsuId();
                }catch(Exception e){
                    System.out.println(e.getMessage());
                }
            }
        }
        lista_ropaStock = ControladoresDAO.cRopaStock.RecuperaTodos(roId, "");
        lista_colores = new ArrayList<Color>();
        lista_tallas = new ArrayList<Tallas>();
        lista_colores.add(lista_ropaStock.get(0).getColor());
        lista_tallas.add(lista_ropaStock.get(0).getTallas());
        for(int i=1;i<lista_ropaStock.size();i++){
            boolean bool = true;
            for(int j=0;j<lista_colores.size();j++){
                if(lista_ropaStock.get(i).getColor().getColorId() == lista_colores.get(j).getColorId()){
                    bool = false;
                }
            }
            if(bool){
                lista_colores.add(lista_ropaStock.get(i).getColor());
            }
            bool = true;
            for(int j=0;j<lista_tallas.size();j++){
                if(lista_ropaStock.get(i).getTallas().getTallaId() == lista_tallas.get(j).getTallaId()){
                    bool = false;
                }
            }
            if(bool){
                lista_tallas.add(lista_ropaStock.get(i).getTallas());
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
        clientela = tr.getClientela().getClientelaDescripcion();
        categoria = tr.getCategoria().getCatDescripcion();
        marca = tr.getMarcas().getMarcaNombre();
        t = descuentoEnRopa(tr);
        //System.out.println("campania: " + campania);
        if(!campania.equals("")){
            Campania camp = ControladoresDAO.cCampanias.RecuperaPorId(Integer.parseInt(campania));
            campaniaNombre = camp.getCamNombre();
        }
        lista_ropa_Cestas = ControladoresDAO.cCesta.RecuperaTodos(usi);
        for(Cesta caux:lista_ropa_Cestas){
            totalcestaUsuario += caux.getCestaUnidades();
            caux.getRopaStock().setRopa(descuentoEnRopa(caux.getRopaStock().getRopa()));
            //System.out.println(caux.getRopaStock().getRopa().getRoDescripcion()+" - "+caux.getCestaUnidades()+" - "+caux.getRopaStock().getRopa().getRoPrecio());
        }
        return SUCCESS;
    }
    
    public String CrudActionRopaStock() throws Exception {
        int respuesta = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String year;
        String month;
        String day;
        year = roFecha2.substring(6, 10);
        month = roFecha2.substring(3, 5);
        day = roFecha2.substring(0, 2);
        String fechaIngresada = year+"-"+month+"-"+day;
        Date fecha = sdf.parse(fechaIngresada);
        if (rostockId != 0) {
            rstock = ControladoresDAO.cRopaStock.RecuperaPorId(rostockId);
        } else {
            lista_tallas = ControladoresDAO.cTallas.RecuperaTodos("");
            lista_colores = ControladoresDAO.cColor.RecuperaTodos("");
            titulo = "Alta";
            cabeceraocul = "Alta";
            botonocul = "Alta";
            rstock = new RopaStock();
        }
        if (!accion.equals("e")) {
            rstock.setColor(ControladoresDAO.cColor.RecuperaPorId(Integer.parseInt(color2)));
            rstock.setTallas(ControladoresDAO.cTallas.RecuperaPorId(Integer.parseInt(tallas2)));
            rstock.setRostockUnidades(roUnidades2);
            rstock.setRostockFecha(fecha);
        }
        if (accion.equals("a")) {
            t = ControladoresDAO.cRopa.RecuperaPorId(roId);
            rstock.setRopa(t);
            respuesta = ControladoresDAO.cRopaStock.Inserta(rstock);
            roUnidades2 = 0;            
        }
        if (accion.equals("m")) {
            respuesta = ControladoresDAO.cRopaStock.Modifica(rstock);
        }
        if (accion.equals("e")) {
            respuesta = ControladoresDAO.cRopaStock.Elimina(rstock);
        }
        if(respuesta>0){
            return SUCCESS;
        }else{
            return INPUT;
        }
    }
    
    private Ropa descuentoEnRopa(Ropa r){
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
}
