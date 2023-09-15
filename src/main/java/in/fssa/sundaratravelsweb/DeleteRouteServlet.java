package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.service.RouteServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/routes/delete")
public class DeleteRouteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int routeId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("routeId", routeId);
        request.getRequestDispatcher("/deleteRoute.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int routeId = Integer.parseInt(request.getParameter("routeId"));
        RouteServices services = new RouteServices();
        try {
            services.switchRouteStatus(routeId);
            response.sendRedirect(request.getContextPath() + "/admin/routes");
        } catch (ServicesException e) {
            e.printStackTrace();
        }
    }
}
