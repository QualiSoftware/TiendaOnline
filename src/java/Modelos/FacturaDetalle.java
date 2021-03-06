package Modelos;
// Generated 18-jun-2017 18:48:23 by Hibernate Tools 4.3.1



/**
 * FacturaDetalle generated by hbm2java
 */
public class FacturaDetalle  implements java.io.Serializable {


     private Integer facdId;
     private Facturas facturas;
     private double facdDescuento;
     private double facdPrecio;
     private String facdTalla;
     private int facdCantidad;
     private String facdMarca;
     private String facdClientela;
     private String facdCategoria;
     private String facdSubcategoria;
     private String facdColor;
     private int facdRoId;

    public FacturaDetalle() {
    }

    public FacturaDetalle(Facturas facturas, double facdDescuento, double facdPrecio, String facdTalla, int facdCantidad, String facdMarca, String facdClientela, String facdCategoria, String facdSubcategoria, String facdColor, int facdRoId) {
       this.facturas = facturas;
       this.facdDescuento = facdDescuento;
       this.facdPrecio = facdPrecio;
       this.facdTalla = facdTalla;
       this.facdCantidad = facdCantidad;
       this.facdMarca = facdMarca;
       this.facdClientela = facdClientela;
       this.facdCategoria = facdCategoria;
       this.facdSubcategoria = facdSubcategoria;
       this.facdColor = facdColor;
       this.facdRoId = facdRoId;
    }
   
    public Integer getFacdId() {
        return this.facdId;
    }
    
    public void setFacdId(Integer facdId) {
        this.facdId = facdId;
    }
    public Facturas getFacturas() {
        return this.facturas;
    }
    
    public void setFacturas(Facturas facturas) {
        this.facturas = facturas;
    }
    public double getFacdDescuento() {
        return this.facdDescuento;
    }
    
    public void setFacdDescuento(double facdDescuento) {
        this.facdDescuento = facdDescuento;
    }
    public double getFacdPrecio() {
        return this.facdPrecio;
    }
    
    public void setFacdPrecio(double facdPrecio) {
        this.facdPrecio = facdPrecio;
    }
    public String getFacdTalla() {
        return this.facdTalla;
    }
    
    public void setFacdTalla(String facdTalla) {
        this.facdTalla = facdTalla;
    }
    public int getFacdCantidad() {
        return this.facdCantidad;
    }
    
    public void setFacdCantidad(int facdCantidad) {
        this.facdCantidad = facdCantidad;
    }
    public String getFacdMarca() {
        return this.facdMarca;
    }
    
    public void setFacdMarca(String facdMarca) {
        this.facdMarca = facdMarca;
    }
    public String getFacdClientela() {
        return this.facdClientela;
    }
    
    public void setFacdClientela(String facdClientela) {
        this.facdClientela = facdClientela;
    }
    public String getFacdCategoria() {
        return this.facdCategoria;
    }
    
    public void setFacdCategoria(String facdCategoria) {
        this.facdCategoria = facdCategoria;
    }
    public String getFacdSubcategoria() {
        return this.facdSubcategoria;
    }
    
    public void setFacdSubcategoria(String facdSubcategoria) {
        this.facdSubcategoria = facdSubcategoria;
    }
    public String getFacdColor() {
        return this.facdColor;
    }
    
    public void setFacdColor(String facdColor) {
        this.facdColor = facdColor;
    }
    public int getFacdRoId() {
        return this.facdRoId;
    }
    
    public void setFacdRoId(int facdRoId) {
        this.facdRoId = facdRoId;
    }




}


