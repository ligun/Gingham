<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:form action="save">
        <g:textField class="form-control" name="title" value="${page?.title}" placeholder="タイトル" />
        <div class="row edit">
            <div class="col-md-6">
                <div class="form-group">
                    <textarea class="form-control markdown-input" name="markdown" rows="30" placeholder="本文">${page?.markdown}</textarea>
                    <g:if test="${page}"><input type="hidden" name="id" value="${page.id}" /> </g:if>
                </div>
            </div>

            <div class="col-md-6">
            <div class="preview markdown-body">

            </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">send</button>
    </g:form>
    <asset:javascript src="webjars/marked-mathjax/0.3.6/marked.min.js"/>
    <script type="text/javascript">
        function update() {
            $('.preview').html(marked($('.markdown-input').val()));
        }
        jQuery(function ($) {
            $('.markdown-input').on('input', function () {
                update();
            });
        });

        update();
    </script>
    </body>
</html>
