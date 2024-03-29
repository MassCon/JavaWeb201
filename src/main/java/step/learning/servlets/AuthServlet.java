package step.learning.servlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import step.learning.dao.AuthTokenDao;
import step.learning.dao.UserDao;
import step.learning.dto.entities.AuthToken;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Base64;

@Singleton
public class AuthServlet extends HttpServlet {
    private final Gson gson = new GsonBuilder().serializeNulls().create();
    private final AuthTokenDao authTokenDao;
    private final UserDao userDao;

    @Inject
    public AuthServlet(AuthTokenDao authTokenDao, UserDao userDao) {
        this.authTokenDao = authTokenDao;
        this.userDao = userDao;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        if(login == null || login.isEmpty() || password == null ) {
            sendResponse(resp, 400, "Missing required parametrs: login and/or password");
            return;
        }

        AuthToken authToken = authTokenDao.getTokenByCredentials(login, password);
        if( authToken == null ) {
            sendResponse(resp, 401, "Auth rejected for given login and/or password");
            return;
        }


        String json = gson.toJson(authToken);
        String base64code = Base64.getUrlEncoder().encodeToString(json.getBytes());
        Cookie cookie = new Cookie("authToken", base64code);
        cookie.setMaxAge(3600); // Set the cookie expiration time in seconds
        resp.addCookie(cookie);
        resp.setContentType("text/plain");
        resp.getWriter().print(base64code);
    }

    private void sendResponse(HttpServletResponse resp, int status, Object body) throws IOException {
        resp.setContentType("application/json");
        resp.setStatus( status ) ;
        resp.getWriter().print( body );
    }
}
