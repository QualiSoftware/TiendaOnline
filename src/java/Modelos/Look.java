package Modelos;
// Generated 14-may-2017 23:58:02 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Look generated by hbm2java
 */
public class Look  implements java.io.Serializable {


     private Integer lookId;
     private String lookDescripcion;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);

    public Look() {
    }

	
    public Look(String lookDescripcion) {
        this.lookDescripcion = lookDescripcion;
    }
    public Look(String lookDescripcion, Set<Ropa> ropas) {
       this.lookDescripcion = lookDescripcion;
       this.ropas = ropas;
    }
   
    public Integer getLookId() {
        return this.lookId;
    }
    
    public void setLookId(Integer lookId) {
        this.lookId = lookId;
    }
    public String getLookDescripcion() {
        return this.lookDescripcion;
    }
    
    public void setLookDescripcion(String lookDescripcion) {
        this.lookDescripcion = lookDescripcion;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }




}


