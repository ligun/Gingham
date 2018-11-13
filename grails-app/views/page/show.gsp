<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title>${page.title}</title>
    </head>
    <body>
    <h1 class="title">${page.title}</h1>
    <h2 class="auther"><small>author : <g:link controller="user" action="show" id="${page.author.username}">${page.author.username}</g:link></small></h2>
        <div class="show-main markdown-body">
            ${raw(html)}
        </div>
    <g:link class="btn btn-primary" action="edit" id="${id}">edit</g:link>
    </body>
</html>
