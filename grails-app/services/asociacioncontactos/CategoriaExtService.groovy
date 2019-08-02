package asociacioncontactos

import grails.gorm.transactions.Transactional

@Transactional
class CategoriaExtService {

    def serviceMethod() {

    }

    def crearCategoria(Categoria categoria){
        categoria.save()
    }

    def actualizarCategoria(id, String nombre, String descripcion){
        def categoria = Categoria.get(id)
        categoria.nombre = nombre
        categoria.merge()
    }

    def eliminarCatetoria(id){
        def categoria = Categoria.get(id)
        categoria.delete(flush: true)
    }

    def buscarCategoriaPorNombre(String nombre){
        return Categoria.executeQuery("SELECT c.nombre FROM Categoria c WHERE c.nombre=:nombre",[nombre:nombre])
    }

}
