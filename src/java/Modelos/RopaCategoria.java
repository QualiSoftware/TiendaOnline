package Modelos;
// Generated 01-oct-2016 14:05:09 by Hibernate Tools 4.3.1



/**
 * RopaCategoria generated by hbm2java
 */
public class RopaCategoria  implements java.io.Serializable {


     private RopaCategoriaId id;
     private Categoria categoria;
     private Ropa ropa;

    public RopaCategoria() {
    }

    public RopaCategoria(RopaCategoriaId id, Categoria categoria, Ropa ropa) {
       this.id = id;
       this.categoria = categoria;
       this.ropa = ropa;
    }
   
    public RopaCategoriaId getId() {
        return this.id;
    }
    
    public void setId(RopaCategoriaId id) {
        this.id = id;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public Ropa getRopa() {
        return this.ropa;
    }
    
    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }




}

