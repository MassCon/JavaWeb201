package step.learning.ioc;


import com.google.inject.Guice;
import com.google.inject.Singleton;
import com.google.inject.servlet.ServletModule;
import step.learning.filters.CharsetFilter;
import step.learning.servlets.FiltersServlet;
import step.learning.servlets.HomeServlet;
import step.learning.servlets.IocServlet;
import step.learning.servlets.JspServlet;
import step.learning.servlets.*;

//@Singleton
public class RouterModule extends ServletModule {
    @Override
    protected void configureServlets() {
        // третій спосіб конфігурування фільтрів та сервлетів - IoC
        filter("/*").through(CharsetFilter.class);

        serve("/"       ).with(HomeServlet.class);
        serve("/db"     ).with(DbServlet.class);
        serve("/jsp"    ).with(JspServlet.class);
        serve("/filters").with(FiltersServlet.class);
        serve("/ioc"    ).with(IocServlet.class);
        serve("/signup" ).with(SignupServlet.class);
    }
}