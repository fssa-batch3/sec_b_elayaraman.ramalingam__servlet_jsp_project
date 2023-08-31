package in.fssa.sundaratravelsweb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.service.RouteServices;
import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.*;

/**
 * Servlet implementation class CreateRoute
 */
@WebServlet("/route/create")
public class CreateRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RouteServices services = new RouteServices();
		
		Route route = new Route();
		
		PrintWriter out = response.getWriter();
		
		route.setFromLocation(request.getParameter("fromLocation"));
		route.setToLocation(request.getParameter("toLocation"));
		route.setBasePrice(new BigDecimal(request.getParameter("basePrice")));
		
		
		try {
			services.createRoute(route);
			out.println("SUCCESSS");
			
		}catch(ServicesException e) {
			e.printStackTrace();
			out.println(e.getMessage());
			}
		
		// TODO Auto-generated method stub
	}

}
