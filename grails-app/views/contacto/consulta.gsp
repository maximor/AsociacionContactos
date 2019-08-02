<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/14/2019
  Time: 2:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Consulta</title>
</head>

<body>
    <g:if test="${flash.accion != null}">
        <div id="aviso" class="card bg-success text-white shadow">
            <div class="card-body">
                <g:if test="${flash.accion == 'eliminar'}">
                    <g:message code="co_contacto_mensaje_eliminar"/>
                </g:if>
            </div>
        </div>
    </g:if>
    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-4"><g:message code="co_titulo_consulta"/> </h1>
        <button class="btn btn-success" onclick="window.location='/contacto'"><g:message code="co_volver"/></button>
        <br><br>
    </div>
    <form action="/contacto/consulta" method="POST">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
                <th><g:message code="c_tabla_codigo"/></th>
                <th><g:message code="co_nombre"/></th>
                <th><g:message code="co_apellido"/></th>
                <th><g:message code="co_correo"/></th>
                <th><g:message code="co_telefono"/></th>
                <th><g:message code="co_telefono_movil"/></th>
                <th><g:message code="co_posicion"/></th>
                <th><g:message code="co_direccion"/></th>
                <th><g:message code="co_categoria"/></th>
                <th><g:message code="co_departamento"/></th>
                <th><g:message code="c_tabla_accion"/></th>

            </tr>
            </thead>
            <tfoot>
            <tr>
                <th><g:message code="c_tabla_codigo"/></th>
                <th><g:message code="co_nombre"/></th>
                <th><g:message code="co_apellido"/></th>
                <th><g:message code="co_correo"/></th>
                <th><g:message code="co_telefono"/></th>
                <th><g:message code="co_telefono_movil"/></th>
                <th><g:message code="co_posicion"/></th>
                <th><g:message code="co_direccion"/></th>
                <th><g:message code="co_categoria"/></th>
                <th><g:message code="co_departamento"/></th>
                <th><g:message code="c_tabla_accion"/></th>
            </tr>
            </tfoot>
            <tbody>
            <g:each in="${contactos}">
                <tr>
                    <td>${it.id}</td>
                    <td>${it.nombre}</td>
                    <td>${it.apellido}</td>
                    <td>${it.email}</td>
                    <td>${it.telefono}</td>
                    <td>${it.telefonoMovil}</td>
                    <td>${it.posicion}</td>
                    <td>${it.direccion}</td>
                    <th>${it.categoria}</th>
                    <th>${it.departamento}</th>
                    <td>
                        <button type="submit" class="btn btn-primary" name="btn_editar" title="<g:message code="c_tabla_editar"/>" value="${it.id}"><i class="oi oi-pencil"></i></button>
                        <button type="submit" class="btn btn-danger" name="btn_eliminar" title="<g:message code="c_tabla_eliminar"/>" value="${it.id}"><i class="oi oi-x"></i></button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </form>

</body>
</html>