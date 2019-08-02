package asociacioncontactos

class ManejoUsuarioController {
    def springSecurityService
    def index() {

        render(view: 'manejousuario')
    }
}
