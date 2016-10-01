package Modelos;
// Generated 01-oct-2016 14:05:09 by Hibernate Tools 4.3.1



/**
 * RopaCategoriaId generated by hbm2java
 */
public class RopaCategoriaId  implements java.io.Serializable {


     private int rocaRoId;
     private int rocaCatId;

    public RopaCategoriaId() {
    }

    public RopaCategoriaId(int rocaRoId, int rocaCatId) {
       this.rocaRoId = rocaRoId;
       this.rocaCatId = rocaCatId;
    }
   
    public int getRocaRoId() {
        return this.rocaRoId;
    }
    
    public void setRocaRoId(int rocaRoId) {
        this.rocaRoId = rocaRoId;
    }
    public int getRocaCatId() {
        return this.rocaCatId;
    }
    
    public void setRocaCatId(int rocaCatId) {
        this.rocaCatId = rocaCatId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof RopaCategoriaId) ) return false;
		 RopaCategoriaId castOther = ( RopaCategoriaId ) other; 
         
		 return (this.getRocaRoId()==castOther.getRocaRoId())
 && (this.getRocaCatId()==castOther.getRocaCatId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getRocaRoId();
         result = 37 * result + this.getRocaCatId();
         return result;
   }   


}


