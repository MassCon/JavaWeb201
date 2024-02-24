<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 09.02.2024
  Time: 00:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String pageBody = (String) request.getAttribute("page-body");
  String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="styles.css">
  <!--Import Google Icon Font-->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

  <title>Java web</title>
</head>
<body>

<nav>
  <div class="nav-wrapper green darken-4">
    <a href="<%= context %>/" class="brand-logo right">Java</a>
    <ul id="nav-mobile">
      <li><a href="<%= context %>/jsp">About</a></li>
      <li <%= "filters.jsp".equals(pageBody) ? "class='active'" : "" %> ><a href="<%= context %>/filters">Filters</a></li>
      <li <%= "ioc.jsp".equals(pageBody) ? "class='active'" : "" %> ><a href="<%= context %>/ioc">IoC</a></li>
    </ul>
  </div>
</nav>
<main>

  <div class="container">
    <jsp:include page="<%= pageBody%>"/>
</main>
</div>

<footer class="page-footer green darken-4">
  <div class="container">
    <div class="row">
      @@ -48,6 +53,7 @@
    </div>
  </div>
</footer>

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>

