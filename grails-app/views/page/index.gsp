<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div>
        <h2>List</h2>
        <ul class="list-group">
            <g:each var="page" in="${pageList}">
                <li class="list-group-item"><g:link action="show" id="${page.id}">${page.title}</g:link></li>
            </g:each>
        </ul>
    </div>
    </body>
</html>
