package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.PersistenceException;
import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Booking;
import in.fssa.sundaratravels.model.Ticket;
import in.fssa.sundaratravels.service.BookingServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/bookings")
public class BookingServlet extends HttpServlet {

	private static final long serialVersionUID = 3674515115878591233L;

	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        BookingServices services =  new BookingServices();
        List<Booking>  list = new ArrayList<>();
        try{
            list = services.getAllBookings();
            System.out.println(list);
            
        } catch (ServicesException  e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("bookings",list);
		request.getRequestDispatcher("/bookings.jsp").forward(request, response);
    }
}
