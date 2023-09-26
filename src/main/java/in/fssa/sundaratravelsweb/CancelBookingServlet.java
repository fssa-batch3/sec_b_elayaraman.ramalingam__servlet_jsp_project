package in.fssa.sundaratravelsweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.service.*;

@WebServlet({"/user/cancelBooking","/ticket/cancel"})
public class CancelBookingServlet extends HttpServlet {

       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/cancelBooking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
	        System.out.println("Ticket Id : "+ticketId);
	        BookingServices bookingServices = new BookingServices();
	        bookingServices.cancelTicket(ticketId);
	        response.sendRedirect(request.getContextPath());
	    } catch (NumberFormatException | ServicesException e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
	    }
	}


}
