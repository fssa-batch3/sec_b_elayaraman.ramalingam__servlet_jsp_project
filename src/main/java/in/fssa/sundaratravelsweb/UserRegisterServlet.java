package in.fssa.sundaratravelsweb;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.*;
import in.fssa.sundaratravels.service.UserServices;


@WebServlet("/user/register")
public class UserRegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
        rd.forward(request, response);	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		UserServices services = new UserServices();
		user.setUserName(request.getParameter("username"));
		user.setDob(Date.valueOf(request.getParameter("dob")));
		user.setPhone(Long.parseLong(request.getParameter("phonenumber")));
		user.setPassword(request.getParameter("password"));
		try {
			services.createUser(user);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} catch (ServicesException e) {
			e.printStackTrace();
			
		}
		
	}

}
