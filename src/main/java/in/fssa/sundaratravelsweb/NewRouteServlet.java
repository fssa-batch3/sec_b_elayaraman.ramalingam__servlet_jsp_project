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

@WebServlet("/admin/routes/create")
public class NewRouteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createRoute.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String fromLocation = request.getParameter("fromLocation");
            String toLocation = request.getParameter("toLocation");
            String basePriceStr = request.getParameter("basePrice");

            BigDecimal basePrice = new BigDecimal(basePriceStr);

            Route newRoute = new Route();
            newRoute.setFromLocation(fromLocation);
            newRoute.setToLocation(toLocation);
            newRoute.setBasePrice(basePrice);

            RouteServices routeServices = new RouteServices();
            routeServices.createRoute(newRoute);

            response.sendRedirect(request.getContextPath() + "/admin/routes");
        } catch (ServicesException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/routeRreate.jsp").forward(request, response);
        }
    }
}
