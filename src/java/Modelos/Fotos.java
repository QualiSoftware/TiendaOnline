package Modelos;
// Generated 06-abr-2017 19:59:16 by Hibernate Tools 4.3.1



/**
 * Fotos generated by hbm2java
 */
public class Fotos  implements java.io.Serializable {


     private Integer fotosId;
     private Ropa ropa;
     private String fotosRuta;

    public Fotos() {
    }

    public Fotos(Ropa ropa, String fotosRuta) {
       this.ropa = ropa;
       this.fotosRuta = fotosRuta;
    }
   
    public Integer getFotosId() {
        return this.fotosId;
    }
    
    public void setFotosId(Integer fotosId) {
        this.fotosId = fotosId;
    }
    public Ropa getRopa() {
        return this.ropa;
    }
    
    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }
    public String getFotosRuta() {
        return this.fotosRuta;
    }
    
    public void setFotosRuta(String fotosRuta) {
        this.fotosRuta = fotosRuta;
    }




}


