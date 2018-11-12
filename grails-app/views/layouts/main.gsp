<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <g:layoutHead/>
</head>
<body>

    <div id="header" class="navbar navbar-inverse navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand header-text" href="/#">Gingham</a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <sec:ifLoggedIn>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            menu<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="user" action="list">ユーザー管理</g:link></li>
                            <li><g:link controller="picture" action="list">画像管理</g:link></li>
                            <li><g:link controller="logout">ログアウト</g:link></li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>

                <sec:ifNotLoggedIn>
                    <li><g:link controller="login">ログイン</g:link></li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </div>

    <div class="container">
        <g:layoutBody/>
    </div>
</body>
</html>
