<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <style type="text/css" media="screen">
    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
        margin-bottom: 10px;
    }
    .form-signin .checkbox {
        font-weight: normal;
    }
    .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    </style>
</head>

<body>
<div class="container">

    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="form-signin" autocomplete="off">
        <h2 class="form-signin-heading"><g:message code='springSecurity.login.header'/></h2>
        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>
        <label for="username" class="sr-only"><g:message code='springSecurity.login.username.label'/></label>
        <input type="text" id="username" class="form-control" name="${usernameParameter ?: 'username'}" placeholder="<g:message code='springSecurity.login.username.label'/>" required autofocus>
        <label for="password" class="sr-only"><g:message code='springSecurity.login.password.label'/></label>
        <input type="password" id="password" class="form-control" name="${passwordParameter ?: 'password'}" placeholder="<g:message code='springSecurity.login.password.label'/>" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" value="remember-me" <g:if test='${hasCookie}'>checked="checked"</g:if>><g:message code='springSecurity.login.remember.me.label'/>
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">${message(code: 'springSecurity.login.button')}</button>
    </form>

</div> <!-- /container -->

<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>