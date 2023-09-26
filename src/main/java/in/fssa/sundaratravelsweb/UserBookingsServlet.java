package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.dto.BookingDTO;
import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Ticket;
import in.fssa.sundaratravels.model.*;
import in.fssa.sundaratravels.service.*;

@WebServlet("/user/bookings")
public class UserBookingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookingServices bookingServices = new BookingServices();
		UserServices userservices = new UserServices();
		RouteServices routeServices = new RouteServices();
		BusServices busservices = new BusServices();
		long phonenumber = 0;
		try {
			phonenumber = userservices.getUserByUserId((Integer)request.getSession().getAttribute("userId")).getPhone();
		} catch (ServicesException e) {
			e.printStackTrace();
		}
		List<Ticket> list = null;
		try {
			list = bookingServices.getTicketByPhoneNumber(phonenumber);
		} catch (ServicesException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		List<BookingDTO> bookings = new ArrayList<>();
		for(Ticket t : list) {
			
			
			
			BookingDTO dto = new BookingDTO();
			dto.setStatus(t.isActive());
			int ticketID = t.getTicketId();
			Booking booking = null;
			try {
				booking = bookingServices.getBooking(t.getBookingId());
			} catch (ServicesException e) {
				e.printStackTrace();
			}
			Bus bus = null;
			try {
				bus = busservices.getBus(booking.getBusId());
			} catch (ServicesException e) {
				e.printStackTrace();
			}
			Route route = null;
			try {
				route = routeServices.getRouteById(bus.getRouteId());
			} catch (ServicesException e) {
				e.printStackTrace();
			}
		    boolean isCancelable = false;

		    try {
		        booking = bookingServices.getBooking(t.getBookingId());
		        java.sql.Date travelDate = t.getTravelDate();
		        java.util.Date today = new java.util.Date();

		        if (travelDate != null && travelDate.after(today)) {
		            isCancelable = true;
		        }
		    } catch (ServicesException e) {
		        e.printStackTrace();
		    }
		    dto.setBusNumber(bus.getBusNo());
		    dto.setFromLocation(route.getFromLocation());
		    dto.setToLocation(route.getToLocation());
		    dto.setSeatCount(t.getBookedSeats());
		    dto.setTravelDate(t.getTravelDate());
		    dto.setTicketId(t.getTicketId());
		    dto.setCancelable(isCancelable);
		    bookings.add(dto);
		}
		Collections.reverse(bookings);
		System.out.println(bookings);
		request.setAttribute("bookings", bookings);
        RequestDispatcher rd = request.getRequestDispatcher("/userBookings.jsp");
        rd.forward(request, response); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
