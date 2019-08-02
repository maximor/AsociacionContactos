package asociacioncontactos

class Contacto {
    String nombre
    String apellido
    String email
    String telefono
    String direccion
    String posicion
    String telefonoMovil
    Date dateCreated //nombre predefinido por grails y se llenara automaticamente
    Date lastUpdated //nombre predefinido por grails y se llenara automaticamente

    // relacion con el usuario que crea el contacto

    //relacion de uno a mucho con el departamento
    static hasMany = [departamento: Departamento, categoria: Categoria]

    static constraints = {
        nombre(nullable: false, size: 5..32)
        apellido(nullable: false, size: 5..32)
        email(nullable: false, email: true, unique: true)
        telefono(nullable: true, unique: true)
        direccion(nullable: true)
        posicion(nullable: false)
        telefonoMovil(nullable: true, unique: true)
    }

    String toString(){
        return nombre + " " + apellido
    }
}
