<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/14/2019
  Time: 8:53 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Asociación | Contacto</title>
</head>

<body>
    <g:if test="${flash.accion != null}">
        <div id="aviso" class="card bg-${flash.metodo} text-white shadow">
            <div class="card-body">
                <g:if test="${flash.accion == 'crear' && flash.metodo == 'success'}">
                    <g:message code="co_contacto_mensaje_guardar"/>
                </g:if>
                <g:elseif test="${flash.accion == 'crear' && flash.metodo == 'danger' && flash.campo == 'telefonoMovil'}">
                    <g:message code="co_contacto_error_duplicidad_celular"/>
                </g:elseif>
                <g:elseif test="${flash.accion == 'crear' && flash.metodo == 'danger' && flash.campo == 'correo'}">
                    <g:message code="co_contacto_error_duplicidad_email"/>
                </g:elseif>
                <g:elseif test="${flash.accion == 'crear' && flash.metodo == 'danger' && flash.campo == 'telefono'}">
                    <g:message code="co_contacto_error_duplicidad_telefono"/>
                </g:elseif>
                <g:elseif test="${flash.accion == 'actualizar'}">
                    <g:message code="co_contacto_mensaje_actualizar"/>
                </g:elseif>
            </div>
        </div>
    </g:if>
    <div class="row">
        <div class="col-lg-12">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4"><g:message code="co_titulo"/></h1>
                </div>
                <form class="user" action="/contacto" method="POST">
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="number" name="id" value="${contacto?.id}" hidden/>
                            <input type="text" class="form-control form-control-user" name="nombre" id="nombre" value="${contacto?.nombre}" placeholder="<g:message code="co_nombre"/>" required>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control form-control-user" name="apellido" id="apellido" value="${contacto?.apellido}" placeholder="<g:message code="co_apellido"/> ">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="text" class="form-control form-control-user" name="telefono" id="telefono" value="${contacto?.telefono}" placeholder="<g:message code="co_telefono"/>" required>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control form-control-user" name="telefonoMovil" id="telefonoMovil" value="${contacto?.telefonoMovil}" placeholder="<g:message code="co_telefono"/>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="text" class="form-control form-control-user" name="posicion" id="posicion" value="${contacto?.posicion}" placeholder="<g:message code="co_posicion"/>" required>
                        </div>
                        <div class="col-sm-6">
                            <input type="email" class="form-control form-control-user" name="correo" id="correo" value="${contacto?.email}" placeholder="<g:message code="co_correo"/>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <select class="form-control" name="categoria" id="categoria">
                                <option value="categoria" selected><g:message code="co_categoria"/> </option>
                                <g:each in="${categorias}">
                                    <option value="${it.id}">${it.nombre}</option>
                                </g:each>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <select class="form-control" name="departamento" id="departamento">
                                <option value="departamento" selected><g:message code="co_departamento"/></option>
                                <g:each in="${departamentos}">
                                    <option value="${it.id}">${it.nombre}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-12 mb-6 mb-sm-3">
                            <input type="text" class="form-control form-control-user" name="direccion" id="direccion" value="${contacto?.direccion}" placeholder="<g:message code="co_direccion"/> " required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <button type="submit" name="btn_crear" value="crear" class="btn btn-primary btn-user btn-block"><g:message code="co_titulo"/> </button>
                        </div>
                        <div class="col-md-6">
                            <button name="btn_consultar" value="consultar" onclick="window.location='/contacto/consulta'" class="btn btn-success btn-user btn-block"><g:message code="co_consultar"/></button>
                        </div>

                    </div>
                </form>

                <hr>
            </div>
        </div>
    </div>
</body>
</html>