package asociacioncontactos

import grails.gorm.transactions.Transactional

@Transactional
class DepartamentoExtService {

    def serviceMethod() {

    }

    def crearDepartamento(Departamento departamento){
        departamento.save()
    }

    def actualizarDepartamento(id, String nombre, String descripcion){
        def departamento = Departamento.get(id)
        departamento.nombre = nombre
        departamento.descripcion = descripcion
        departamento.merge()
    }

    def eliminarDepartamento(id){
        def departamento = Departamento.get(id)
        departamento.delete(flush: true)
    }

    def buscarDepartamentoPorNombre(String nombre){
        return Departamento.executeQuery("SELECT d.nombre FROM Departamento d WHERE d.nombre=:nombre",[nombre:nombre])
    }
}
