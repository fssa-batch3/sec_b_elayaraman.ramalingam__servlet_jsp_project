package in.fssa.sundaratravelsweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.service.BookingServices;
import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Ticket;
import java.util.*;

/**
 * Servlet implementation class TicketServlet
 */
@WebServlet("/admin/tickets")
public class TicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookingServices services = new BookingServices();
		
		List<Ticket> tickets = null;
		
		try {
			tickets = services.getAllTickets();
		}catch(ServicesException e){
			throw new RuntimeException(e.getMessage());
		}
		
		request.setAttribute("tickets", tickets);
		
		request.getRequestDispatcher("/ticket.jsp").forward(request, response);
		
	}

}
