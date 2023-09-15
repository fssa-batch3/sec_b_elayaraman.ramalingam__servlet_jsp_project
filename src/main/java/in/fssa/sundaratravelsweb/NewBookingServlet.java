package in.fssa.sundaratravelsweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.service.RouteServices;


@WebServlet({"/booking/new" })
public class NewBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RouteServices services = new RouteServices();
		
		try {
			request.setAttribute("routes", services.getAllRoutes());
		} catch (ServicesException e) {
			e.printStackTrace();
		} 		
		request.getRequestDispatcher("/newBooking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
