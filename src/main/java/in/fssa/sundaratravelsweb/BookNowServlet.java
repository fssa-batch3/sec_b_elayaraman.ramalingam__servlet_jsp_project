package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.dao.TicketDAO;
import in.fssa.sundaratravels.dto.*;
import in.fssa.sundaratravels.service.*;
import in.fssa.sundaratravels.exception.*;
import in.fssa.sundaratravels.model.Booking;
import in.fssa.sundaratravels.model.Ticket;

@WebServlet("/booknow")
public class BookNowServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookingServices bookingservices = new BookingServices();
		BusServices busservices = new BusServices();

		int busId = Integer.parseInt(request.getParameter("busid"));
		String busNo = request.getParameter("busNo");
		BigDecimal basePrice = new BigDecimal(request.getParameter("basePrice"));
		int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));
		Date travelDate = Date.valueOf(request.getParameter("travelDate"));
		int totalSeats = 0;
		try {
			totalSeats = busservices.getBus(busId).getCapacity();
		} catch (ServicesException e) {
			e.printStackTrace();
		}

		Booking booking = null;
		try {
			booking = bookingservices.getBookingByBusAndDate(busId, travelDate);
		} catch (ServicesException e) {
			e.printStackTrace();
		}
		List<Ticket> listofTickets = null;
		List<Integer> listOfBookedSeats = new ArrayList<>();
		HashMap<Integer, Boolean> seats = new HashMap<>();
		try {
			if (booking != null) {
				listofTickets = bookingservices.getTicketByBookingId(booking.getId());
				for (Ticket t : listofTickets) {
					for (int i : t.getSeats()) {
						listOfBookedSeats.add(i);
					}
				}
			}

		} catch (ServicesException | RuntimeException e) {
			e.printStackTrace();
		}

		for (int i = 1; i <= totalSeats; i++) {
			if (listOfBookedSeats != null && listOfBookedSeats.size() > 0) {
				seats.put(i, (listOfBookedSeats.contains(i)) ? true : false);
				continue;
			}
			seats.put(i, false);
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String json = objectMapper.writeValueAsString(seats);

		BusDetailsDTO busDetails = new BusDetailsDTO();
		busDetails.setBusid(busId);
		busDetails.setBusNo(busNo);
		busDetails.setBasePrice(basePrice);
		busDetails.setAvailableSeats(availableSeats);
		busDetails.setTravelDate(travelDate);
		busDetails.setSeats(seats);

		request.setAttribute("busDetails", busDetails);
		request.setAttribute("seatsJSON", json);

		request.getRequestDispatcher("/bookNow.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int busId = Integer.parseInt(request.getParameter("busId"));

			String seatrow = request.getParameter("selectedSeats").replaceAll("[^0-9]", ",");
			String[] seatRowStringArray = seatrow.trim().split(",");
			System.out.println("Array size: " + seatRowStringArray.length);
			for (String i : seatRowStringArray) {
				System.out.println("Element: " + i);
			}

			String travelDateStr = request.getParameter("travelDate");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsedDate = dateFormat.parse(travelDateStr);
			java.sql.Date travelDate = new java.sql.Date(parsedDate.getTime());

			int bookedSeats = Integer.parseInt(request.getParameter("seatCount"));
			List<Integer> seatsList = new ArrayList<>();

			for (int i = 0; i < seatRowStringArray.length; i++) {
				if (seatRowStringArray[i].trim().length() > 0) {
					seatsList.add(Integer.parseInt(seatRowStringArray[i]));
				}
			}
			int[] seats = new int[seatsList.size()];
			for (int i = 0; i < seats.length; i++) {
				seats[i] = seatsList.get(i);
			}

			String passengerName = request.getParameter("passengerName");
			long phoneNumber = Long.parseLong(request.getParameter("phoneNumber"));
			BookingServices bookingService = new BookingServices();
			int id = bookingService.bookTicket(busId, travelDate, bookedSeats, passengerName, phoneNumber, seats);

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
