package Modelos;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.util.Date;

public class ropaSH {
    private int ro_id;
    private int ro_marca_id;
    private int ro_clientela_id;
    private String ro_descripcion;
    private int ro_look_id;
    private int ro_talla_id;
    private double ro_precio;
    private double ro_descuento;
    private int ro_color_id;
    private int ro_coleccion_id;
    private String ro_caracteristicas;
    private int ro_visible;
    private int ro_unidades;
    private Date ro_fecha;
    private int ro_cat_id;
    private int ro_sub_id;

    public ropaSH(int ro_id, int ro_marca_id, int ro_clientela_id, String ro_descripcion, int ro_look_id, int ro_talla_id, double ro_precio, double ro_descuento, int ro_color_id, int ro_coleccion_id, String ro_caracteristicas, int ro_visible, int ro_unidades, Date ro_fecha, int ro_cat_id, int ro_sub_id) {
        this.ro_id = ro_id;
        this.ro_marca_id = ro_marca_id;
        this.ro_clientela_id = ro_clientela_id;
        this.ro_descripcion = ro_descripcion;
        this.ro_look_id = ro_look_id;
        this.ro_talla_id = ro_talla_id;
        this.ro_precio = ro_precio;
        this.ro_descuento = ro_descuento;
        this.ro_color_id = ro_color_id;
        this.ro_coleccion_id = ro_coleccion_id;
        this.ro_caracteristicas = ro_caracteristicas;
        this.ro_visible = ro_visible;
        this.ro_unidades = ro_unidades;
        this.ro_fecha = ro_fecha;
        this.ro_cat_id = ro_cat_id;
        this.ro_sub_id = ro_sub_id;
    }

    public int getRo_id() {
        return ro_id;
    }

    public void setRo_id(int ro_id) {
        this.ro_id = ro_id;
    }

    public int getRo_marca_id() {
        return ro_marca_id;
    }

    public void setRo_marca_id(int ro_marca_id) {
        this.ro_marca_id = ro_marca_id;
    }

    public int getRo_clientela_id() {
        return ro_clientela_id;
    }

    public void setRo_clientela_id(int ro_clientela_id) {
        this.ro_clientela_id = ro_clientela_id;
    }

    public String getRo_descripcion() {
        return ro_descripcion;
    }

    public void setRo_descripcion(String ro_descripcion) {
        this.ro_descripcion = ro_descripcion;
    }

    public int getRo_look_id() {
        return ro_look_id;
    }

    public void setRo_look_id(int ro_look_id) {
        this.ro_look_id = ro_look_id;
    }

    public int getRo_talla_id() {
        return ro_talla_id;
    }

    public void setRo_talla_id(int ro_talla_id) {
        this.ro_talla_id = ro_talla_id;
    }

    public double getRo_precio() {
        return ro_precio;
    }

    public void setRo_precio(double ro_precio) {
        this.ro_precio = ro_precio;
    }

    public double getRo_descuento() {
        return ro_descuento;
    }

    public void setRo_descuento(double ro_descuento) {
        this.ro_descuento = ro_descuento;
    }

    public int getRo_color_id() {
        return ro_color_id;
    }

    public void setRo_color_id(int ro_color_id) {
        this.ro_color_id = ro_color_id;
    }

    public int getRo_coleccion_id() {
        return ro_coleccion_id;
    }

    public void setRo_coleccion_id(int ro_coleccion_id) {
        this.ro_coleccion_id = ro_coleccion_id;
    }

    public String getRo_caracteristicas() {
        return ro_caracteristicas;
    }

    public void setRo_caracteristicas(String ro_caracteristicas) {
        this.ro_caracteristicas = ro_caracteristicas;
    }

    public int getRo_visible() {
        return ro_visible;
    }

    public void setRo_visible(int ro_visible) {
        this.ro_visible = ro_visible;
    }

    public int getRo_unidades() {
        return ro_unidades;
    }

    public void setRo_unidades(int ro_unidades) {
        this.ro_unidades = ro_unidades;
    }

    public Date getRo_fecha() {
        return ro_fecha;
    }

    public void setRo_fecha(Date ro_fecha) {
        this.ro_fecha = ro_fecha;
    }

    public int getRo_cat_id() {
        return ro_cat_id;
    }

    public void setRo_cat_id(int ro_cat_id) {
        this.ro_cat_id = ro_cat_id;
    }

    public int getRo_sub_id() {
        return ro_sub_id;
    }

    public void setRo_sub_id(int ro_sub_id) {
        this.ro_sub_id = ro_sub_id;
    }
    
    
}
