// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.3.1.min
//= require bootstrap
//= require popper.min
//= require_self

//Iniciar el plugin data table
// $(document).ready(function() {
//     $('#dataTable').DataTable();
// });
//configuracion para el popup de aviso de mensajes despues de guardar, actualizar y eliminar
$(document).ready(function(){
    $('#aviso').fadeIn(6000);
    $('#aviso').fadeOut(6000);
})