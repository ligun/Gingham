<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div>
    <h2>${user.username}</h2>
    <ul class="list-group">
        <g:each var="page" in="${pageList}">
            <li class="list-group-item"><g:link controller="page" action="show" id="${page.id}">${page.title}</g:link></li>
        </g:each>
    </ul>
</div>
</body>
</html>
