package Acciones;

import Modelos.Color;
import Modelos.Ropa;
import Modelos.RopaStock;
import Modelos.Tallas;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
}
