<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.add.label" args="[entityName]" /></title>
</head>
<body>
<script>
$(function(){
    $(".dropdown-menu li a").click(function(){
        $(this).parents('.dropdown').find('.dropdown-toggle').html($(this).text() + ' <span class="caret"></span>');
        $(this).parents('.dropdown').find('input[name="auth"]').val($(this).attr("data-value"));
    });
});
</script>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <h1>Add User</h1>
        <g:form action="create" class="form-horizontal">
            <div class="form-group">
                <label for="userName" class="col-md-3 control-label">User Name</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="Name" />
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-md-3 control-label">Password</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" /></label>
                </div>
            </div>

            <div class="form-group">
                <label for="authority" class="col-md-3 control-label">Role</label>
                <input type="hidden" name="authority" id="authority" value="">
                <div class="dropdown">
                    <div class="col-md-9">
                        <button class="btn btn-default btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                            Role
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <g:each var="role" in="${roleList}">
                            <li><a href="#" data-value="${role.authority}">${role.name}</a></li>
                            </g:each>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn btn-primary btn-block">登録</button>
                </div>
            </div>
        </g:form>

    </div>
</div>
</body>
</html>
