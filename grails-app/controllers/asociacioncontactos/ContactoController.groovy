package asociacioncontactos

class ContactoController {

    def springSecurityService
    static allowedMethods = [
            "GET",
            "POST"
    ]

    def index() {

        def contacto = null
        if(session.getAttribute("contacto_id") != null){
            contacto = Contacto.get(session.getAttribute("contacto_id"))
            session.removeAttribute("contacto_id")
        } else if(params.btn_crear != null){
            ContactoExtService cs = new ContactoExtService()
            if(params.id != ''){
                contacto = Contacto.get(params.id)
                contacto.nombre = params.nombre
                contacto.apellido = params.apellido
                contacto.telefono = params.telefono
                contacto.telefonoMovil = params.telefonoMovil
                contacto.posicion = params.posicion
                contacto.direccion = params.direccion
                contacto.email = params.correo
                contacto.addToCategoria(Categoria.get(params.categoria))
                contacto.addToDepartamento(Departamento.get(params.departamento))
                cs.actualizarContacto(contacto)
                session.removeAttribute("contact_id")
                contacto = null
                flash.accion = "actualizar"
                flash.metodo = "success"
            }else{
                if(params.categoria != 'Categoria' || params.departamento != 'Departamento'){
                    try{

                        if(cs.buscarContactoPorCelular(params.telefonoMovil).size() > 0){
                            flash.accion = "crear"
                            flash.metodo = "danger"
                            flash.campo = "telefonoMovil"
                        }else if(cs.buscarContactoPorCorreo(params.correo).size() > 0){
                            flash.accion = "crear"
                            flash.metodo = "danger"
                            flash.campo = "correo"
                        }else if(cs.buscarContactoPorTelefono(params.telefono).size() > 0){
                            flash.accion = "crear"
                            flash.metodo = "danger"
                            flash.campo = "telefono"
                        }else{
                            contacto = new Contacto()
                            contacto.nombre = params.nombre
                            contacto.apellido = params.apellido
                            contacto.telefono = params.telefono
                            contacto.telefonoMovil = params.telefonoMovil
                            contacto.posicion = params.posicion
                            contacto.direccion = params.direccion
                            contacto.email = params.correo
                            contacto.addToCategoria(Categoria.get(params.categoria))
                            contacto.addToDepartamento(Departamento.get(params.departamento))
                            cs.crearContacto(contacto)
                            session.removeAttribute("contact_id")
                            contacto = null
                            flash.accion = "crear"
                            flash.metodo = "success"
                        }
                    }catch(e){
                        println(e)
                    }
                }
            }

        }

        def model = [
                departamentos: Departamento.list(),
                categorias: Categoria.list(),
                contacto: contacto,
                usuario: springSecurityService.currentUser.username
        ]


        render(view:"contacto", model: model)
    }

    def consulta(){
        if(params.btn_eliminar != null){
            try{
                ContactoExtService cs = new ContactoExtService()
                cs.eliminarContacto(params.long("btn_eliminar"))
                flash.accion = "eliminar"
            }catch(e){
                println(e)
            }
        }else if(params.btn_editar != null){
            session.setAttribute("contacto_id", params.long("btn_editar"))
            redirect(uri:"/contacto")
        }

        def model = [
                contactos: Contacto.list(),
                usuario: springSecurityService.currentUser.username
        ]

        render(view:"consulta", model: model)
    }

}
