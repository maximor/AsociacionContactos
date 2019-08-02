package asociacioncontactos

import grails.gorm.transactions.Transactional

@Transactional
class ContactoExtService {

    def serviceMethod() {

    }

    def crearContacto(Contacto contacto){
        contacto.save()
    }

    def actualizarContacto(Contacto contacto){
        contacto.merge()
    }

    def eliminarContacto(id){
        def contacto = Contacto.get(id)
        contacto.delete(flush:true)
    }

    def buscarContactoPorCorreo(String correo){
        return Contacto.executeQuery("SELECT co.email FROM Contacto co WHERE co.email=:email",[email:correo])
    }

    def buscarContactoPorTelefono(String telefono){
        return Contacto.executeQuery("SELECT co.telefono FROM Contacto co WHERE co.telefono=:telefono",[telefono:telefono])
    }

    def buscarContactoPorCelular(String celular){
        return Contacto.executeQuery("SELECT co.telefonoMovil FROM Contacto co WHERE co.telefonoMovil=:celular",[celular:celular])
    }
}
