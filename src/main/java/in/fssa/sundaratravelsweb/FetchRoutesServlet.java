package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.service.RouteServices;


@WebServlet("/fetch-routes")
public class FetchRoutesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RouteServices services = new RouteServices();
        
        try {
            List<Route> routes = services.getAllRoutes();
            String jsonRoutes = new Gson().toJson(routes);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonRoutes);
        } catch (ServicesException e) {
            e.printStackTrace();
        }
    }
}

