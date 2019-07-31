<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/7/2019
  Time: 11:32 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Asociacion | Categoría</title>
</head>

<body>

<div class="row">
    <div class="col-lg-12">
        <div class="p-5">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4"><g:message code="c_titulo"/></h1>
            </div>
            <g:form class="user" controller="categoria" action="guardar" method="POST">
                <div class="form-group row">
                    <div class="col-sm-12 mb-6 mb-sm-3">
                        <input type="text" class="form-control form-control-user" name="nombre" id="nombre" placeholder="<g:message code='c_categoria'/>" required>
                    </div>
                </div>
                <div style="float: right;margin-bottom: 5px;margin-right: 15px">
                    <button type="submit" name="btn_crear" class="btn btn-primary btn-user"><g:message code="c_titulo"/></button>
                    <button type="reset" class="btn btn-primary btn-user btn-danger"><g:message code="cancelar"/></button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>