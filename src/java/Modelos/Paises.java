package Modelos;
// Generated 14-may-2017 23:58:02 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Paises generated by hbm2java
 */
public class Paises  implements java.io.Serializable {


     private Integer paisId;
     private String paisNombre;
     private Set<Provincias> provinciases = new HashSet<Provincias>(0);

    public Paises() {
    }

	
    public Paises(String paisNombre) {
        this.paisNombre = paisNombre;
    }
    public Paises(String paisNombre, Set<Provincias> provinciases) {
       this.paisNombre = paisNombre;
       this.provinciases = provinciases;
    }
   
    public Integer getPaisId() {
        return this.paisId;
    }
    
    public void setPaisId(Integer paisId) {
        this.paisId = paisId;
    }
    public String getPaisNombre() {
        return this.paisNombre;
    }
    
    public void setPaisNombre(String paisNombre) {
        this.paisNombre = paisNombre;
    }
    public Set<Provincias> getProvinciases() {
        return this.provinciases;
    }
    
    public void setProvinciases(Set<Provincias> provinciases) {
        this.provinciases = provinciases;
    }




}


