<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div>
    <g:link class="btn btn-primary" action="add">new</g:link>
</div>

<div>
    <h2>List</h2>
    <ul class="list-group">
        <g:each var="user" in="${userList}">
            <li class="list-group-item"><g:link action="show" id="${user.id}">${user.username}</g:link></li>
        </g:each>
    </ul>
</div>
</body>
</html>
