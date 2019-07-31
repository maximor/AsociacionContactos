<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 7/31/2019
  Time: 3:05 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"><g:message code="c_titulo_tabla"/></h6>
    </div>
    <div class="card-body">

        <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th><g:message code="c_tabla_codigo"/></th>
                        <th><g:message code="c_categoria"/></th>
                        <th><g:message code="c_tabla_accion"/></th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th><g:message code="c_tabla_codigo"/></th>
                        <th><g:message code="c_categoria"/></th>
                        <th><g:message code="c_tabla_accion"/></th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <g:each in="${categorias}" var="categoria">
                        <tr>
                            <td>${categoria.id}</td>
                            <td>${categoria.nombre}</td>
                            <td>
                                <button class="btn btn-primary" onclick="editar(${categoria.id})"><i class="oi oi-pencil"></i>
                                <g:message code="c_tabla_editar"/></button>
                                <button class="btn btn-danger" onclick="eliminar(${categoria.id});location.reload()"><i class="oi oi-x"></i>
                                <g:message code="c_tabla_eliminar"/></button>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
        </div>
    </div>

</div>

<div class="modal" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"> <g:message code="c_titulo_tabla"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <g:form action="actualizar" controller="categoria"  method="PUT">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre" class="col-form-label"> <g:message code="nombre"/> </label>
                        <input id="nombre" type="text" class="form-control" name="nombre" required>
                        <input hidden id="id" name="id">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"> <g:message code="cerrar"/> </button>
                    <button type="submit" class="btn btn-primary"> <g:message code="guardar"/> </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script>
    function eliminar(id) {
        let request = new XMLHttpRequest();
        request.open('DELETE', '/categoria/borrar/?id='+id, true);
        request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        request.send();
    }

    function editar(id) {
        let request = new XMLHttpRequest();
        request.open('GET', '/categoria/editar/?id=' + id, true);

        request.onload = function () {
            if (request.status >= 200 && request.status < 400) {
                let resp = JSON.parse(request.responseText);
                document.getElementById('id').value = resp.id;
                document.getElementById('nombre').value = resp.nombre;
                $('#modal').modal("toggle");
            }
        };

        request.onerror = function () {
            // There was a connection error of some sort
        };
        request.send();
    }
</script>

</body>
</html>