<%@ page import="step.learning.dto.entities.User" %>
<%@ page import="step.learning.dto.entities.Character" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String context = request.getContextPath();
    User user = ( User ) request.getAttribute( "user-model" ) ;
%>

<h1>Profile</h1>

<% if (user != null) { %>

<div class="row">
    <form class="col s12" method="post" enctype="multipart/form-data" >
        <div class="row">

            <div class="card col s6 brown darken-1">
                <div class="card-image">
                    <img src="<%=context%>/upload/avatar/<%=user.getAvatarUrl()%>">
                    <span class="card-title"><%=user.getName()%></span>
                    <a class="btn-floating halfway-fab waves-effect waves-light blue lighten-1" role="button" id="add-coins-btn">
                        <i class="material-icons">add</i>
                    </a>
                </div>
                <div class="card-content">
                    <p>У вас: <b><%=user.getCoins()%></b> $</p>
                </div>
            </div>

            <!-- Login Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">badge</i>
                <input value="<%=user.getLogin()%>" name="reg-login" id="reg-login" type="text">
                <label for="reg-login">Login</label>
            </div>
            <!---->

            <!-- Name Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">person</i>
                <input value="<%=user.getName()%>" name="reg-name" id="reg-name" type="tel">
                <label for="reg-name">Name</label>
            </div>
            <!---->

            <!-- Email Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">alternate_email</i>
                <input value="<%=user.getEmail()%>" name="reg-email" id="reg-email" type="email">
                <label for="reg-email">E-mail</label>
            </div>
            <!---->

            <!-- Birthdate DatePicker -->
            <div class="input-field col s6">
                <i class="material-icons prefix">cake</i>
                <input value="<%=user.getBirthdate()%>" name="reg-birthdate" id="reg-birthdate" type="date">
                <label for="reg-birthdate">Date of birth</label>
            </div>
            <!---->

            <a class="waves-effect waves-light btn brown lighten-1" role="button" id="logout-btn"><i class="material-icons right">logout</i>Вийти</a>
        </div>
    </form>
</div>

<h2>Your cars</h2>

<div class="row">
    <%
        List<Character> characters = (List<Character>) request.getAttribute("characters");
        for (Character character : characters) {
    %>
    <div class="col s12 m6">
        <div class="card brown">
            <div class="card-image">
                <img src="<%= context %>/upload/characters/<%= character.getImage() %>" alt="<%= character.getName() %>">
                <span class="card-title"><%= character.getName() %></span>
            </div>
        </div>
    </div>
    <% } %>
</div>

<% } else { %>

<a class="waves-effect waves-light btn blue lighten-1" href="<%=context%>/login"><i class="material-icons right">login</i>Sign in</a>
<a class="waves-effect waves-light btn blue lighten-1" href="<%=context%>/signup"><i class="material-icons right">assignment</i>Register</a>

<% } %>