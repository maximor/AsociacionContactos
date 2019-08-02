<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/14/2019
  Time: 3:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<g:if test="${flash.accion != null}">
    <div id="aviso" class="card bg-${flash.metodo} text-white shadow">
        <div class="card-body">
            <g:if test="${flash.accion == 'crear' && flash.metodo == 'success'}">
                <g:message code="d_departamento_mensaje_guardar"/>
            </g:if>
            <g:if test="${flash.accion == 'crear' && flash.metodo == 'danger'}">
                <g:message code="d_departamento_error_duplicidad"/>
            </g:if>
            <g:elseif test="${flash.accion == 'actualizar'}">
                <g:message code="d_departamento_mensaje_actualizar"/>
            </g:elseif>
            <g:elseif test="${flash.accion == 'eliminar'}">
                <g:message code="d_departamento_mensaje_eliminar"/>
            </g:elseif>
        </div>
    </div>
</g:if>
<div class="row">
    <div class="col-lg-12">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">${d_titulo}</h1>
            </div>
            <form class="user" action="/departamento" method="POST">
                <div class="form-group row">
                    <div class="col-sm-12 mb-6 mb-sm-3">
                        <input type="number" name="id" value="${departamento?.id}" hidden/>
                        <input type="text" class="form-control form-control-user" name="nombre" id="nombre" value="${departamento?.nombre}" placeholder="<g:message code="d_nombre"/>" required>
                    </div>
                </div>
                <button type="submit" name="btn_crear" value="crear" class="btn btn-primary btn-user btn-block"><g:message code="d_titulo"/></button>
            </form>
            <hr>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary"><g:message code="c_titulo_tabla"/></h6>
                </div>
                <div class="card-body">

                    <div class="table-responsive">
                        <form action="/departamento" method="POST">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th><g:message code="c_tabla_codigo"/> </th>
                                    <th><g:message code="d_departamento"/></th>
                                    <th><g:message code="c_tabla_accion"/> </th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th><g:message code="c_tabla_codigo"/> </th>
                                    <th><g:message code="d_departamento"/></th>
                                    <th><g:message code="c_tabla_accion"/> </th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <g:each in="${departamentos}">
                                    <tr>
                                        <td>${it.id}</td>
                                        <td>${it.nombre}</td>
                                        <td>
                                            <button type="submit" class="btn btn-primary" name="btn_editar" title="<g:message code="c_tabla_editar"/>" value="${it.id}"><i class="oi oi-pencil"></i></button>
                                            <button type="submit" class="btn btn-danger" name="btn_eliminar" title="<g:message code="c_tabla_eliminar"/>" value="${it.id}"><i class="oi oi-x"></i></button>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>