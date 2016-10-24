package Modelos;
// Generated 24-oct-2016 21:24:41 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Coleccion generated by hbm2java
 */
public class Coleccion  implements java.io.Serializable {


     private Integer coleccionId;
     private String coleccionDescripcion;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);

    public Coleccion() {
    }

	
    public Coleccion(String coleccionDescripcion) {
        this.coleccionDescripcion = coleccionDescripcion;
    }
    public Coleccion(String coleccionDescripcion, Set<Ropa> ropas) {
       this.coleccionDescripcion = coleccionDescripcion;
       this.ropas = ropas;
    }
   
    public Integer getColeccionId() {
        return this.coleccionId;
    }
    
    public void setColeccionId(Integer coleccionId) {
        this.coleccionId = coleccionId;
    }
    public String getColeccionDescripcion() {
        return this.coleccionDescripcion;
    }
    
    public void setColeccionDescripcion(String coleccionDescripcion) {
        this.coleccionDescripcion = coleccionDescripcion;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }




}


