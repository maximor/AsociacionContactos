package asociacioncontactos

import auth.Usuario

class BootStrap {

    def init = { servletContext ->
        if (Usuario.count() < 1){

            def admin = new Usuario(username: "admin", password: "admin")
            admin.save(flush: true, failOnError: true)
        }
        if (Categoria.count() < 1){

            def categoria1 = new Categoria(nombre: "Normal", usuario: Usuario.first())
            def categoria2 = new Categoria(nombre: "Importante", usuario: Usuario.first())
            def categoria3 = new Categoria(nombre: "Bajo", usuario: Usuario.first())

            categoria1.save(flush: true, failOnError: true)
            categoria2.save(flush: true, failOnError: true)
            categoria3.save(flush: true, failOnError: true)
        }

//        if (Contacto.count() < 1){
////
////            def contacto = new Contacto(nombre: "felix", apellido: "g", puesto: "dev", telefono: "654645", direccion: "sucasa", categorias: [Categoria.first()], email: "felix@gmail.com", movil: "80980890", usuario: Usuario.first())
////
////            contacto.save(flush:true, failOnError: true)
////        }
    }
    def destroy = {
    }
}
