package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Bus;
import in.fssa.sundaratravels.service.BookingServices;
import in.fssa.sundaratravels.service.BusServices;

@WebServlet("/buses/list")
public class ListBusesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	BusServices busServices = new BusServices();
        	BookingServices bookingServices = new BookingServices();
        	
            int routeId = Integer.parseInt(request.getParameter("routeId"));
            Date travelDate = Date.valueOf(request.getParameter("travelDate"));

            List<Bus> buses = busServices.getBusesByRouteIdAndDate(routeId, travelDate);

            for (Bus bus : buses) {
                int bookedSeats = bookingServices.getBookingByBusAndDate(bus.getId(), travelDate).getBookedSeats();
                int availableSeats = bus.getCapacity() - bookedSeats;
                bus.setCapacity(availableSeats);
            }

            request.setAttribute("buses", buses);
            request.setAttribute("travelDate", travelDate);

            request.getRequestDispatcher("/busList.jsp").forward(request, response);
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
        }
    }
}
