package Modelos;
// Generated 01-oct-2016 14:05:09 by Hibernate Tools 4.3.1



/**
 * RopaMaterial generated by hbm2java
 */
public class RopaMaterial  implements java.io.Serializable {


     private RopaMaterialId id;
     private Material material;
     private Ropa ropa;

    public RopaMaterial() {
    }

    public RopaMaterial(RopaMaterialId id, Material material, Ropa ropa) {
       this.id = id;
       this.material = material;
       this.ropa = ropa;
    }
   
    public RopaMaterialId getId() {
        return this.id;
    }
    
    public void setId(RopaMaterialId id) {
        this.id = id;
    }
    public Material getMaterial() {
        return this.material;
    }
    
    public void setMaterial(Material material) {
        this.material = material;
    }
    public Ropa getRopa() {
        return this.ropa;
    }
    
    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }




}

