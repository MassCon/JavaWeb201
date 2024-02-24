<!DOCTYPE web-app PUBLIC
"-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
"http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>

  <filter>
    <filter-name>ChatsetFilter</filter-name>
    <filter-class>step.learning.filters.CharsetFilter</filter-class>
  </filter>
  <filter-mapping>
    <filter-name>ChatsetFilter</filter-name>
    <url-pattern>/*</url-pattern>
    <!-- патерн /* - всі запити -->
  </filter-mapping>

  <servlet>
    <servlet-name>HomeServlet</servlet-name>
    <servlet-class>step.learning.servlets.HomeServlet</servlet-class>
  </servlet>
  <servlet>
    <servlet-name>JspServlet</servlet-name>
    <servlet-class>step.learning.servlets.JspServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>HomeServlet</servlet-name>
    <url-pattern></url-pattern>
    <!-- порожній патерн - домашня сторінка -->
  </servlet-mapping>
  <servlet-mapping>
    <servlet-name>JspServlet</servlet-name>
    <url-pattern>/jsp</url-pattern>
  </servlet-mapping>
</web-app>
