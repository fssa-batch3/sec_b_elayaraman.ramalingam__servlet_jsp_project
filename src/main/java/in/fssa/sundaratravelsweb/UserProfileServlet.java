package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Ticket;
import in.fssa.sundaratravels.model.User;
import in.fssa.sundaratravels.service.UserServices;
import in.fssa.sundaratravels.service.BookingServices;

@WebServlet("/user/profile")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 423171308248739132L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            Integer userId = (Integer) request.getSession().getAttribute("userId");
            BookingServices bookingServices = new BookingServices();

            if (userId == null) {
                response.sendRedirect(request.getContextPath() + "/user/register");
                return;
            }

            UserServices userService = new UserServices();
            User user = userService.getUserByUserId(userId);

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/user/register");
                return;
            }

            List<Ticket> bookings = bookingServices.getTicketByPhoneNumber(user.getPhone());

            request.setAttribute("user", user);
            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        } catch (ServicesException e) {
            response.sendRedirect(request.getContextPath() + "/user/register");
        }
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer userId = (Integer) request.getSession().getAttribute("userId");

            if (userId == null) {
                response.sendRedirect(request.getContextPath() + "/user/register");
                return;
            }

            UserServices userService = new UserServices();
            User user = userService.getUserByUserId(userId);

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/user/register");
                return;
            }

            String updatedUsername = request.getParameter("username");

            user.setUserName(updatedUsername);

            userService.updateUserDetails(user);

            response.sendRedirect(request.getContextPath() + "/user/profile?success=true");
        } catch (ServicesException e) {
            request.setAttribute("error", e.getMessage());
            doGet(request, response); 
        }
        }
}
