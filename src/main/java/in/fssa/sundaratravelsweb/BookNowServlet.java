package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.dao.TicketDAO;
import in.fssa.sundaratravels.dto.*;
import in.fssa.sundaratravels.service.*;
import in.fssa.sundaratravels.exception.*;
import in.fssa.sundaratravels.model.Ticket;

@WebServlet("/booknow")
public class BookNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int busId = Integer.parseInt(request.getParameter("busid"));
	    String busNo = request.getParameter("busNo");
	    BigDecimal basePrice = new BigDecimal(request.getParameter("basePrice"));
	    int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
	    Date travelDate = Date.valueOf(request.getParameter("travelDate"));

	    BusDetailsDTO busDetails = new BusDetailsDTO();
	    busDetails.setBusid(busId);
	    busDetails.setBusNo(busNo);
	    busDetails.setBasePrice(basePrice);
	    busDetails.setAvailableSeats(availableSeats);
	    busDetails.setTravelDate(travelDate);

	    request.setAttribute("busDetails", busDetails);

	    request.getRequestDispatcher("/bookNow.jsp").forward(request, response);
	}
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	        	int busId = Integer.parseInt(request.getParameter("busId"));
	        	System.out.println(busId);
	        	String travelDateStr = request.getParameter("travelDate");
	        	System.out.println(travelDateStr);
	        	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        	    java.util.Date parsedDate = dateFormat.parse(travelDateStr);
	        	    java.sql.Date     travelDate = new java.sql.Date(parsedDate.getTime());
	        	System.out.println(request.getParameter("travelDate"));
	            
	            int bookedSeats = Integer.parseInt(request.getParameter("seatCount"));
	            String passengerName = request.getParameter("passengerName");
	            long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));

	            BookingServices bookingService = new BookingServices();
	            int id = bookingService.bookTicket(busId, travelDate, bookedSeats, passengerName, phoneNumber);
	            
	            TicketDAO dao = new TicketDAO();
	            Ticket ticket = dao.getTicketByPhoneNumberDateAndBookingId(phoneNumber, travelDate, id);

	            request.setAttribute("ticket", ticket);
	            request.getRequestDispatcher("/bookingSuccess.jsp").forward(request, response);
	        } catch (NumberFormatException | ServicesException | ParseException | PersistenceException e) {
	            e.printStackTrace();
	            response.sendRedirect("bookingError.jsp");
	        }
	    }

}
