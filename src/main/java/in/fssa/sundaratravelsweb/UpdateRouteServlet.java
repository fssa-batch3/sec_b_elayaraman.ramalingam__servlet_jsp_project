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
import java.math.BigDecimal;

@WebServlet("/admin/routes/update")
public class UpdateRouteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            RouteServices services = new RouteServices();

            int routeId = Integer.parseInt(request.getParameter("routeId"));
            String fromLocation = request.getParameter("fromLocation");
            String toLocation = request.getParameter("toLocation");
            BigDecimal basePrice = new BigDecimal(request.getParameter("basePrice"));

            Route testRoute = services.getRouteById(routeId);

            Route route = new Route();
            route.setRouteId(routeId);
            route.setFromLocation(fromLocation);
            route.setToLocation(toLocation);
            route.setBasePrice(basePrice);

            if (fromLocation.equals(testRoute.getFromLocation()) && toLocation.equals(testRoute.getToLocation())) {
                services.updateRoutePrice(routeId, basePrice);
            } else {
                services.updateRoute(route);
            }
            response.sendRedirect(request.getContextPath() + "/admin/routes");
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/routes");
        }
    }
}
