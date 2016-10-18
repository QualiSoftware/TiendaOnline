package Modelos;
// Generated 18-oct-2016 17:17:52 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Tallas generated by hbm2java
 */
public class Tallas  implements java.io.Serializable {


     private Integer tallaId;
     private String tallaDescripcion;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);

    public Tallas() {
    }

	
    public Tallas(String tallaDescripcion) {
        this.tallaDescripcion = tallaDescripcion;
    }
    public Tallas(String tallaDescripcion, Set<Ropa> ropas) {
       this.tallaDescripcion = tallaDescripcion;
       this.ropas = ropas;
    }
   
    public Integer getTallaId() {
        return this.tallaId;
    }
    
    public void setTallaId(Integer tallaId) {
        this.tallaId = tallaId;
    }
    public String getTallaDescripcion() {
        return this.tallaDescripcion;
    }
    
    public void setTallaDescripcion(String tallaDescripcion) {
        this.tallaDescripcion = tallaDescripcion;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }




}


