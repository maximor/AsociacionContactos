package asociacioncontactos

import grails.converters.JSON
import grails.validation.ValidationException

class CategoriaController {

    CategoriaService categoriaService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [categorias: Categoria.findAll()]
    }

    def mostrar(Long id) {
        respond categoriaService.get(id)
    }

    def crear() {}

    def guardar() {
        try {
            def categoria = new Categoria(params)
            categoria.save(flush: true, failOnError: true)
        } catch (ValidationException e) {
            println e
        }

        redirect(uri: '/categoria/crear')
    }

    def editar(Long id) {
        def categoria = categoriaService.get(id)

        render categoria as JSON
    }

    def actualizar(Integer id, String nombre) {
        def categoria = Categoria.findById(id)
        categoria.setNombre(nombre)
        categoria.save(flush: true, failOnError: true)
        redirect(uri: '/categoria/index')
    }

    def borrar(Long id) {
        println "id: " + id
        def categoria = Categoria.findById(id)
        println(""+categoria)
        println "nombre " +categoria.getNombre()
        //def u = Contacto.findAllByCategoriasInList([categoria])
        def u  = Contacto.where {categoria.id in [categoria.id]}
//        def u  = Contacto.where {categorias in [categoria]}
//        def u = Contacto.findAll("from Contacto as u where u.categorias in (:categorias)", [categorias: [categoria]])

        println u.size()
        def usuarios = ((u) as List<Contacto>)

        usuarios.each {
            it.removeFromCategorias(categoria)
            it.save(flush: true, failOnError: true)
        }

        categoria.delete(flush: true, failOnError: true)
        redirect action: '/categoria/index'
    }
}
