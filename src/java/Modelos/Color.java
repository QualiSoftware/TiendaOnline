package Modelos;
// Generated 01-oct-2016 14:05:09 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Color generated by hbm2java
 */
public class Color  implements java.io.Serializable {


     private Integer colorId;
     private String colorDescripcion;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);

    public Color() {
    }

    public Color(Integer colorId, String colorDescripcion) {
        this.colorId = colorId;
        this.colorDescripcion = colorDescripcion;
    }
    
    

	
    public Color(String colorDescripcion) {
        this.colorDescripcion = colorDescripcion;
    }
    public Color(String colorDescripcion, Set<Ropa> ropas) {
       this.colorDescripcion = colorDescripcion;
       this.ropas = ropas;
    }
   
    public Integer getColorId() {
        return this.colorId;
    }
    
    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }
    public String getColorDescripcion() {
        return this.colorDescripcion;
    }
    
    public void setColorDescripcion(String colorDescripcion) {
        this.colorDescripcion = colorDescripcion;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }




}


