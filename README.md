# AsociacionContactos
Práctica #11 - Grails: Aceptamos el desarrollo de una aplicación web para una empresa de renombre en el país, ellos necesitan que todos los contactos relacionan con los departamentos de la empresa, pueden tener una asociación.

## Desarrollo
Aceptamos el desarrollo de una aplicación web para una empresa de renombre en el país,
ellos necesitan que todos los contactos relacionan con los departamentos de la empresa,
pueden tener una asociación. Los requerimientos para implementar son:
1. Debe utilizar el framework Grails 3.X.X para realizar la aplicación.
2. Debe tener un control de usuarios asociado a los departamentos de la empresa
al cual tiene permiso.
3. El sistema debe mostrar un listado de todos los contactos registrados para un
departamento seleccionado en el cual tenga permiso el usuario.
4. Las propiedades de un contacto serán: nombre, apellido, email, teléfono, dirección,
puesto de trabajo, teléfono móvil, listado de departamentos asociados y categoría
del contacto.
5. Un contacto puede tener relaciones con más de un departamento, por lo cual,
debemos evitar que los contactos se dupliquen en el sistema, por tal razón, se
debe validar por el correo electrónico o teléfono móvil del contacto no puede ser
reinsertado en el sistema, cuando ocurra esté evento deben indicar al usuario que
existe el contacto y se estará incluyendo el departamento al cual pertenece el
usuario como relación de manera automática, es decir, existe una relación un
contacto relacionado a muchos departamento.
6. En una sección del sistema mostrar gráficos del tipo circular para ver la distribución
de los contactos por departamento y categorías de un contacto.
7. Cada registro insertando o modificando debe persistir la fecha y quien lo realizo.
8. Solo el usuario administrador puede crear usuarios y asignarlos a un
departamento.
9. El usuario administrador tendrá acceso a las funciones administrativas de creación
de departamentos y categorías.
10. Deben existir los CRUD para los dominios de departamento y categoría, se pueden
utilizar scaffolding pero adaptados a la plantilla utilizada, no utilizar la plantilla por
defecto.
11. Todos los campos deben ser validados tanto en la vista como en el servidor.
12. Implementar I18N.
13. Implementar una plantilla con buena presentación.
14. Implementar Spring Security Core.
