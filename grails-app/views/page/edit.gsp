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
              <div class="form-menu">
                  <input type="file" id="pic_upload" name="file" accept="image/jpeg,image/png,image/gif" style="display:none">
                  <a href="#" id="pic_upload_button"><i class="fa fa-picture-o" aria-hidden="true"></i></a>
              </div>
                <div class="form-group">
                    <textarea id="markdown-input" class="form-control" name="markdown" rows="30" placeholder="本文">${page?.markdown}</textarea>
                    <g:if test="${page}"><input type="hidden" name="id" value="${page.id}" /> </g:if>
                </div>
                <button class="btn btn-primary" type="submit">send</button>
            </div>

            <div class="col-md-6">
            <div id="preview" class="markdown-body">

            </div>
            </div>
        </div>
    </g:form>
    <asset:javascript src="webjars/marked-mathjax/0.3.6/marked.min.js"/>
    <script type="text/javascript">
        function update() {
            $('#preview').html(marked($('#markdown-input').val()));
        }
        jQuery(function ($) {
            $('#markdown-input').on('input', function () {
                update();
            });
        });

        $('#pic_upload_button').click(function () {
            $('#pic_upload').click();
            return false;
        });

        $('#pic_upload').on('change', function () {
            var file = $(this).prop('files')[0];

            /*
            if(file.size > 1024*1024) {
                alert("file size over!");
                return false;
            }
            */

            var formData = new FormData();
            formData.append('fileName', file.name);
            formData.append('fileData', file);

            $.ajax('<g:createLink controller="picture" action="upload" /> ', {
                type: 'POST',
                contentType: false,
                processData: false,
                data: formData,
                error: function () {
                    alert('error');
                },
                success: function (res) {
                    if(res.error) {
                        alert(res.error.message);
                    }else {
                        var mdPic = "\n![](" + res.url + ")\n";
                        insertText($('#markdown-input').get(0), mdPic);
                        update();
                    }
                }
            });
            return false;
        });

        function insertText(textarea, text) {
            var index = textarea.selectionStart;
            var length = textarea.selectionEnd - index;

            textarea.value = textarea.value.substr(0, index) + text + textarea.value.substr(index + length);

            textarea.focus();
            var newCaretPosition = index + text.length;
            textarea.setSelectionRange(newCaretPosition, newCaretPosition);
        }

        $(document).ready(function() {
            update();
        });
    </script>
    </body>
</html>
