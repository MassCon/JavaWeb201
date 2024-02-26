<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String context = request.getContextPath(); %>

<h1>Login</h1>

<div id="auth-form" class="row">
    <form class="col s12">
        <b id="auth-message"></b>
        <div class="row">
            <div class="input-field col s6">
                <i class="material-icons prefix">account_circle</i>
                <input id="auth-login-input" type="text" class="validate">
                <label for="auth-login-input">Login</label>
            </div>
            <div class="input-field col s6">
                <i class="material-icons prefix">lock</i>
                <input id="auth-password-input" type="password" class="validate">
                <label for="auth-password-input">Password</label>
            </div>
        </div>
    </form>
</div>

<a class="waves-effect waves-light btn blue lighten-1" role="button" id="auth-login-btn"><i class="material-icons right">login</i>Sign in</a>
<a class="waves-effect waves-light btn blue lighten-1" href="<%=context%>/signup"><i class="material-icons right">assignment</i>Register</a>