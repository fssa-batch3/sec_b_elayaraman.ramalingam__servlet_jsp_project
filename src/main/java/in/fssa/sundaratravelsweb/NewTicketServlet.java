package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.service.*;
import in.fssa.sundaratravels.exception.*;
import in.fssa.sundaratravels.model.*;

/**
 * Servlet implementation class NewTicketServlet
 */
@WebServlet("/ticket")
public class NewTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BookingServices bookingServices = new BookingServices();

       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/createTicket.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int busId = Integer.parseInt(request.getParameter("busId"));
            Date travelDate = Date.valueOf(request.getParameter("travelDate"));
            int bookedSeats = Integer.parseInt(request.getParameter("bookedSeats"));
            String passengerName = request.getParameter("passengerName");
            long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
            int[] list = {};

            bookingServices.bookTicket(busId, travelDate, bookedSeats, passengerName, phoneNumber,list);

            response.sendRedirect(request.getContextPath() + "/admin/tickets");
        } catch (ServicesException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/createTicket.jsp").forward(request, response);
        }
	}}
