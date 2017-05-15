package Modelos;
// Generated 14-may-2017 23:58:02 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Subcategoria generated by hbm2java
 */
public class Subcategoria  implements java.io.Serializable {


     private Integer subId;
     private Categoria categoria;
     private String subDescripcion;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);

    public Subcategoria() {
    }

	
    public Subcategoria(Categoria categoria, String subDescripcion) {
        this.categoria = categoria;
        this.subDescripcion = subDescripcion;
    }
    public Subcategoria(Categoria categoria, String subDescripcion, Set<Ropa> ropas) {
       this.categoria = categoria;
       this.subDescripcion = subDescripcion;
       this.ropas = ropas;
    }
   
    public Integer getSubId() {
        return this.subId;
    }
    
    public void setSubId(Integer subId) {
        this.subId = subId;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public String getSubDescripcion() {
        return this.subDescripcion;
    }
    
    public void setSubDescripcion(String subDescripcion) {
        this.subDescripcion = subDescripcion;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }




}


