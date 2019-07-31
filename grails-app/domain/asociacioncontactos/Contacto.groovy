package asociacioncontactos

class Contacto {
    String nombre
    String apellido
    String email
    String telefono
    String movil
    String puesto
    String direccion

    Date dateCreated
    Date lastUpdated

    Set departamentos = []
    static hasMany = [departamentos: Departamento, categorias: Categoria]

    static constraints = {
        email(email: true, unique: true, blank: false)
        movil blank: false, unique: true
        telefono blank: true
        categorias blank: true
    }
}
