package Modelos;
// Generated 17-oct-2016 23:10:23 by Hibernate Tools 4.3.1



/**
 * Cesta generated by hbm2java
 */
public class Cesta  implements java.io.Serializable {


     private Integer cestaId;
     private Ropa ropa;
     private int cestaUsuId;
     private int cestaUnidades;

    public Cesta() {
    }

    public Cesta(Ropa ropa, int cestaUsuId, int cestaUnidades) {
       this.ropa = ropa;
       this.cestaUsuId = cestaUsuId;
       this.cestaUnidades = cestaUnidades;
    }
   
    public Integer getCestaId() {
        return this.cestaId;
    }
    
    public void setCestaId(Integer cestaId) {
        this.cestaId = cestaId;
    }
    public Ropa getRopa() {
        return this.ropa;
    }
    
    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }
    public int getCestaUsuId() {
        return this.cestaUsuId;
    }
    
    public void setCestaUsuId(int cestaUsuId) {
        this.cestaUsuId = cestaUsuId;
    }
    public int getCestaUnidades() {
        return this.cestaUnidades;
    }
    
    public void setCestaUnidades(int cestaUnidades) {
        this.cestaUnidades = cestaUnidades;
    }




}


