package Modelos;
// Generated 18-jun-2017 18:48:23 by Hibernate Tools 4.3.1



/**
 * CampaniaRopa generated by hbm2java
 */
public class CampaniaRopa  implements java.io.Serializable {


     private CampaniaRopaId id;
     private Campania campania;
     private Ropa ropa;

    public CampaniaRopa() {
    }

    public CampaniaRopa(CampaniaRopaId id, Campania campania, Ropa ropa) {
       this.id = id;
       this.campania = campania;
       this.ropa = ropa;
    }
   
    public CampaniaRopaId getId() {
        return this.id;
    }
    
    public void setId(CampaniaRopaId id) {
        this.id = id;
    }
    public Campania getCampania() {
        return this.campania;
    }
    
    public void setCampania(Campania campania) {
        this.campania = campania;
    }
    public Ropa getRopa() {
        return this.ropa;
    }
    
    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }




}


