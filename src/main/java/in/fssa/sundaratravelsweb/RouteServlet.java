package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.service.RouteServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/routes")
public class RouteServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RouteServices services = new RouteServices();
        List<Route> list = new ArrayList<>();
        try {
            list = services.getAllRoutes();
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("routes",
                list);
        request.getRequestDispatcher("/routes.jsp").forward(request, response);
    }
}
