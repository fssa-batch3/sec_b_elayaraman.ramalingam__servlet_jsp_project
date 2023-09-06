package in.fssa.sundaratravelsweb;

import java.io.*;
import java.util.List;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.service.RouteServices;
@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    RouteServices services = new RouteServices();

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        Route route = null;
        try {
            route = services.getRouteById(1);
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }

        response.setContentType("text/html");

        out.println("<html><body>");
        out.println("<h1>" + route + "</h1>");
        out.println("</body></html>");
    }

}