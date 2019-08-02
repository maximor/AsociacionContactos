package asociacioncontactos

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/contacto/contacto", controller: "contacto")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
