
package Test;
import DAO.CategoriaDAO;
import DAO.CategoriaDAOImplementar;
import Model.Categoria;
import java.util.List;


public class Prueba {
    public static void main (String [] args){
        Prueba evaluar = new Prueba();
        //evaluar.guardaCategoria();//Metodo guardar
        evaluar.listarCategoria();//metodo listar
        evaluar.eliminarCategoria();//Metodo que eliminará la categoria indicada
        evaluar.listarCategoria();//consultar si ha sido eliminada la categoria
        //evaluar.editarCategoria();//metodo editar
    }
    
    
    public void listarCategoria(){
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        List<Categoria> listar = categoria.Listar();
        System.out.println("LISTADO DE CATEGORIAS");
        for(Categoria categoriaListar : listar){
            System.out.println("ID: " + categoriaListar.getId_categoria()+
                            " NOMBRE: " + categoriaListar.getNom_categoria()+
                            " ESTADO: " +categoriaListar.getEstado_categoria());
        }
    }
    
    public void editarCategoria(){
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        Categoria cat_edit = categoria.editarCat(1);
        System.out.println("CATEGORIA MODIFICAR");
        System.out.println("ID: "+ cat_edit.getId_categoria()+
                            " NOMBRE: " + cat_edit.getNom_categoria()+
                            " ESTADO: " + cat_edit.getEstado_categoria());
    }
    
    public void guardaCategoria(){
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        Categoria guarda_cat = new Categoria();
        guarda_cat.setNom_categoria("Bebidas Naturales");//Nueva Categoria guardada
        guarda_cat.setId_categoria(5);
        guarda_cat.setEstado_categoria(1);//estado 1
        categoria.guardarCat(guarda_cat); 
    }
    
    public void eliminarCategoria(){
        CategoriaDAO categoria = new CategoriaDAOImplementar();
        categoria.borrarCat(2);
    }
}
