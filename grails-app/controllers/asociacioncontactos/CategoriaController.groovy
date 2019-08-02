import asociacioncontactos.Categoria
import asociacioncontactos.CategoriaExtService

class CategoriaController {
    def springSecurityService

    static allowedMethods = [
            "GET",
            "POST"
    ]

    def index(Categoria categoria) {
        //cargar datos para editar
        if(params.btn_editar != null){
            categoria = Categoria.get(params.btn_editar)
        }else{
            try{
                CategoriaExtService cs = new CategoriaExtService()
                if(categoria.id == null){
                    if(cs.buscarCategoriaPorNombre(categoria.nombre).size() > 0){
                        flash.accion = "crear"
                        flash.metodo = "danger"
                    }else{
                        cs.crearCategoria(categoria)
                        flash.accion = "crear"
                        flash.metodo = "success"
                    }
//
                }else {
                    cs.actualizarCategoria(categoria.id, categoria.nombre, categoria.descripcion)
                    flash.accion = "actualizar"
                    flash.metodo = "success"
                }

                if(params.btn_eliminar != null){
                    cs.eliminarCatetoria(params.long("btn_eliminar"))
                    flash.accion = "eliminar"
                    flash.metodo = "success"
                }
            }catch(e){
                println(e)
            }
        }

        def model=[
                categoria: categoria,
                categorias: Categoria.list(),
                usuario: springSecurityService.currentUser.username
        ]
        render(view:"categoria", model: model)
    }
}
