<%@ page import="step.learning.dto.models.RegFormModel" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Перевіряємо чи є повідомлення попередньої форми, формуємо значення полів
    RegFormModel model = ( RegFormModel ) request.getAttribute("model");
    String loginValue = model == null ? "" : model.getLogin();
    String nameValue = model == null ? "" : model.getName();
    String emailValue = model == null ? "" : model.getEmail();
    String birthdateValue = model == null ? "" : model.getBirthdateAsString();
    Map<String, String> errors = model == null ? new HashMap<String, String>() : (HashMap<String, String>) model.getErrorMessages();

    String nameClass = model == null ? "validate" : ( errors.containsKey("name") ? "invalid" : "valid");
    String loginClass = model == null ? "validate" : ( errors.containsKey("login") ? "invalid" : "valid");
    String emailClass = model == null ? "validate" : ( errors.containsKey("email") ? "invalid" : "valid");
    String passwordClass = model == null ? "validate" : ( errors.containsKey("password") ? "invalid" : "valid");
    String repeatClass = model == null ? "validate" : ( errors.containsKey("repeat") ? "invalid" : "valid");
    String birthdateClass = model == null ? "validate" : ( errors.containsKey("birthdate") ? "invalid" : "valid");

    String regMessage = (String) request.getAttribute("reg-message");
    if(regMessage == null) {
        regMessage = "";
    }
%>

<h2>Registration</h2>

<p><%=regMessage%></p>

<div class="row">
    <form class="col s12" method="post" enctype="multipart/form-data" >
        <div class="row">

            <!-- Login Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">badge</i>
                <input value="<%=loginValue%>" name="reg-login" id="reg-login" type="text" class=<%=loginClass%>>
                <label for="reg-login">Login</label>
                <% if(errors.containsKey("login")) { %>
                <span class="helper-text" data-error="<%=errors.get("login")%>" ></span>
                <% } %>
            </div>
            <!---->

            <!-- Name Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">person</i>
                <input value="<%=nameValue%>" name="reg-name" id="reg-name" type="tel" class=<%=nameClass%>>
                <label for="reg-name">Name</label>
                <% if(errors.containsKey("name")) { %>
                <span class="helper-text" data-error="<%=errors.get("name")%>" ></span>
                <% } %>
            </div>
            <!---->

            <!-- Email Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">alternate_email</i>
                <input value="<%=emailValue%>" name="reg-email" id="reg-email" type="email" class=<%=emailClass%>>
                <label for="reg-email">E-mail</label>
                <% if(errors.containsKey("email")) { %>
                <span class="helper-text" data-error="<%=errors.get("email")%>" ></span>
                <% } %>
            </div>
            <!---->

            <!-- Birthdate DatePicker -->
            <div class="input-field col s6">
                <i class="material-icons prefix">cake</i>
                <input value="<%=birthdateValue%>" name="reg-birthdate" id="reg-birthdate" type="date" class=<%=birthdateClass%>>
                <label for="reg-birthdate">Date of birth</label>
                <% if(errors.containsKey("birthdate")) { %>
                <span class="helper-text" data-error="<%=errors.get("birthdate")%>" ></span>
                <% } %>
            </div>
            <!---->

            <!-- Password Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">lock</i>
                <input name="reg-password" id="reg-password" type="password" class=<%=passwordClass%>>
                <label for="reg-password">Password</label>
                <% if(errors.containsKey("password")) { %>
                <span class="helper-text" data-error="<%=errors.get("password")%>" ></span>
                <% } %>
            </div>
            <!---->

            <!-- Repeat Password Input -->
            <div class="input-field col s6">
                <i class="material-icons prefix">lock</i>
                <input name="reg-repeat" id="reg-repeat" type="password" class=<%=repeatClass%>>
                <label for="reg-repeat">Repeat the password</label>
                <% if(errors.containsKey("repeat")) { %>
                <span class="helper-text" data-error="<%=errors.get("repeat")%>" ></span>
                <% } %>
            </div>
            <!---->

        </div>
        <div class="row">

            <!-- Rules Agreement -->
            <div class="input-field col s6">
                <label for="reg-rules" class=<%=errors.containsKey("rules") ? "invalid" : ""%>>
                    <input id="reg-rules" name="reg-rules" type="checkbox" class="filled-in" />
                    <span>I will not disturb anything</span>
                    <% if(errors.containsKey("rules")) { %>
                    <span class="helper-text" data-error="<%=errors.get("rules")%>" ></span>
                    <% } %>
                </label>
            </div>
            <!---->

            <!-- Avatar Input -->
            <div class="file-field input-field col s6">
                <div class="btn blue lighten-1">
                    <i class="material-icons ">account_box</i>
                    <input name="reg-avatar" type="file">
                </div>
                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text" placeholder="Аватар">
                </div>
            </div>
            <!---->

        </div>

        <div class="input-field row right-align">
            <button class="waves-effect waves-light btn blue lighten-1">Registration</button>
        </div>
    </form>
</div>