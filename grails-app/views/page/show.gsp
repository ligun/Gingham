<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title>${title}</title>
    </head>
    <body>
    <h1 class="title">${title}</h1>
        <div class="show-main markdown-body">
            ${raw(html)}
        </div>
    <g:link class="btn btn-primary" action="edit" id="${id}">edit</g:link>
    </body>
</html>
