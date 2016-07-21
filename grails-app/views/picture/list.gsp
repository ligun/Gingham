<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'picture.label', default: 'Picture')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div>
    <h2>List</h2>
    <ul class="list-group">
        <g:each var="picture" in="${pictureList}">
            <li class="list-group-item">
                <g:link controller="picture" action="download" id="${picture.fileName}">
                    <img src="${createLink(controller: "picture", action: "download", id: picture.fileName)}" width="40px" />
                </g:link>
                <span class="badge"><g:link controller="picture" action="delete" id="${picture.fileName}">del</g:link></span>
            </li>
        </g:each>
    </ul>
</div>
</body>
</html>
