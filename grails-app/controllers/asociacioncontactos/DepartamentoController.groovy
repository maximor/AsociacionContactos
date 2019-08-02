package asociacioncontactos

class DepartamentoController {
    def springSecurityService
    static allowedMethods = [
            "GET",
            "POST"
    ]

    def index(Departamento departamento) {
        //cargar datos para editar
        if(params.btn_editar != null){
            departamento = Departamento.get(params.btn_editar)
        }else{
            try{
                DepartamentoExtService ds = new DepartamentoExtService()
                if(departamento.id == null){
                    if(ds.buscarDepartamentoPorNombre(departamento.nombre).size() > 0){
                        flash.accion = "crear"
                        flash.metodo = "danger"
                    }else{
                        ds.crearDepartamento(departamento)
                        flash.accion = "crear"
                        flash.metodo = "success"
                    }

                }else{
                    ds.actualizarDepartamento(departamento.id, departamento.nombre, departamento.descripcion)
                    flash.accion = "actualizar"
                    flash.metodo = "success"
                }

                if(params.btn_eliminar != null){
                    ds.eliminarDepartamento(params.long("btn_eliminar"))
                    flash.accion = "eliminar"
                    flash.metodo = "success"
                }
            }catch(e){
                println(e)
            }
        }
        def model=[
                departamentos: Departamento.list(),
                departamento: departamento,
                usuario: springSecurityService.currentUser.username
        ]

        render(view:"departamento", model:model)
    }
}
