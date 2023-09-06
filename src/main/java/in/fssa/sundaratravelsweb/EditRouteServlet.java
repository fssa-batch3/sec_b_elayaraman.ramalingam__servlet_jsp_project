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

@WebServlet("/admin/routes/edit")
public class EditRouteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int routeId = Integer.parseInt(request.getParameter("id"));
            RouteServices services = new RouteServices();
            Route route = services.getRouteById(routeId);

            if (route != null) {
                request.setAttribute("editRoute", route);
                request.getRequestDispatcher("/editRoute.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/routes");
            }
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/routes");
        }
    }
}
