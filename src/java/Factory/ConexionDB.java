
package Factory;
//importaciones
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//le agregamos abstract antes de la clase
public abstract class ConexionDB {
    protected String [] parametros;
    protected Connection conexion;
    
    abstract Connection open(); 
    
    
    //metodo para consultas
    public ResultSet cosultaSQL(String consulta){
    Statement st;
    ResultSet rs = null;

        try{
            st = conexion.createStatement();
            rs = st.executeQuery(consulta);
            }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return rs;
        }
    
    //metodo para ejecutar
    public boolean ejecutarSQL(String consulta){
        Statement st;
        boolean guardar = true;
        try{
            st =  conexion.createStatement();
            st.executeUpdate(consulta);
        }
        catch(SQLException ex){
            guardar = false;
            ex.printStackTrace();
        }
        return guardar;
    }
    
    //metodo para cierre de conexion
    public boolean cerrarConexion (){
        boolean ok =true;
        try{
            conexion.close();
        }
        catch(Exception ex){
            ok = false;
            ex.printStackTrace();
        }
        return ok;
    }
}


