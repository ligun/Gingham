<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div>
        <g:link class="btn btn-primary" action="edit">new</g:link>
    </div>

    <div>
        <h2>List</h2>
        <ul class="list-group">
            <g:each var="page" in="${pageList}">
                <li class="list-group-item"><g:link action="show" id="${page.id}">${page.title}</g:link></li>
            </g:each>
        </ul>
    </div>

    <div>
        <h2>Picture list</h2>
        <g:link class="btn btn-primary" controller="Picture" action="list">list</g:link>
    </div>

    <div>
        <h2>User list</h2>
        <g:link class="btn btn-primary" controller="User" action="list">list</g:link>
    </div>
    </body>
</html>
