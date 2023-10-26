package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Bus;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.model.Booking;
import in.fssa.sundaratravels.dto.BusDetailsDTO;
import in.fssa.sundaratravels.service.BookingServices;
import in.fssa.sundaratravels.service.BusServices;
import in.fssa.sundaratravels.service.RouteServices;

@WebServlet("/admin/buses/list")
public class ListBusesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	BusServices busServices = new BusServices();
        	BookingServices bookingServices = new BookingServices();
        	RouteServices routeServices = new RouteServices();
        	
            int routeId = Integer.parseInt(request.getParameter("routeId"));
            Date travelDate = Date.valueOf(request.getParameter("travelDate"));

            List<Bus> buses = busServices.getBusesByRouteIdAndDate(routeId, travelDate);

            List<BusDetailsDTO> busList = new ArrayList<>();

            for (Bus bus : buses) {
                Booking  booking = bookingServices.getBookingByBusAndDate(bus.getId(), travelDate);
                Route route = routeServices.getRouteById(bus.getRouteId());
                int availableSeats ;
                int bookedSeats = 0;
                if(booking != null)
                	bookedSeats = booking.getBookedSeats();
                	
                availableSeats = bus.getCapacity() - bookedSeats;

            	BusDetailsDTO dto = new BusDetailsDTO();
            	dto.setBusid(bus.getId());
            	dto.setBusNo(bus.getBusNo());
            	dto.setBasePrice(route.getBasePrice());
            	dto.setAvailableSeats(availableSeats);
            	dto.setTravelDate(travelDate);
            	dto.setFromLocation(route.getFromLocation());
            	dto.setToLocation(route.getToLocation());
            	dto.setArrivalTime(bus.getArrivalTime());
            	dto.setDepartureTime(bus.getDepartureTime());
            	
            	busList.add(dto);
            }
            request.setAttribute("busList", busList);
            request.getRequestDispatcher("/busList.jsp").forward(request, response);
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
        }
    }
}
