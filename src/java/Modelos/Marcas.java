package Modelos;
// Generated 14-may-2017 23:58:02 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Marcas generated by hbm2java
 */
public class Marcas  implements java.io.Serializable {


     private Integer marcaId;
     private String marcaNombre;
     private String marcaFoto;
     private Set<Ropa> ropas = new HashSet<Ropa>(0);
     private Set<Campania> campanias = new HashSet<Campania>(0);

    public Marcas() {
    }

	
    public Marcas(String marcaNombre, String marcaFoto) {
        this.marcaNombre = marcaNombre;
        this.marcaFoto = marcaFoto;
    }
    public Marcas(String marcaNombre, String marcaFoto, Set<Ropa> ropas, Set<Campania> campanias) {
       this.marcaNombre = marcaNombre;
       this.marcaFoto = marcaFoto;
       this.ropas = ropas;
       this.campanias = campanias;
    }
   
    public Integer getMarcaId() {
        return this.marcaId;
    }
    
    public void setMarcaId(Integer marcaId) {
        this.marcaId = marcaId;
    }
    public String getMarcaNombre() {
        return this.marcaNombre;
    }
    
    public void setMarcaNombre(String marcaNombre) {
        this.marcaNombre = marcaNombre;
    }
    public String getMarcaFoto() {
        return this.marcaFoto;
    }
    
    public void setMarcaFoto(String marcaFoto) {
        this.marcaFoto = marcaFoto;
    }
    public Set<Ropa> getRopas() {
        return this.ropas;
    }
    
    public void setRopas(Set<Ropa> ropas) {
        this.ropas = ropas;
    }
    public Set<Campania> getCampanias() {
        return this.campanias;
    }
    
    public void setCampanias(Set<Campania> campanias) {
        this.campanias = campanias;
    }




}


