package in.fssa.sundaratravelsweb.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.service.RouteServices;

@WebServlet("/route/all")
public class ListAllRoutesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RouteServices services = new RouteServices();
		try {
			List<Route> list = services.getAllRoutes();
		} catch (ServicesException e) {
			e.printStackTrace();
		}
		RequestDispatcher req = request.getRequestDispatcher("/list_all_routes.jsp");
		req.forward(request, response);
	}


}
