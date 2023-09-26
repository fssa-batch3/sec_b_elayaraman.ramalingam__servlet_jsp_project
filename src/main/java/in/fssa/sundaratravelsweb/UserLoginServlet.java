package in.fssa.sundaratravelsweb;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.User;
import in.fssa.sundaratravels.service.UserServices;

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
	
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
	        rd.forward(request, response);  
	    }
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 UserServices services = new UserServices();
		 long phonenumber = Long.parseLong(request.getParameter("phonenumber"));
		 System.out.println(phonenumber);
		 String password = request.getParameter("password");
		 try {
			 User user = services.getUserByPhoneNumber(phonenumber);
			 if(user == null) {			 
				 System.out.println("user not found");			 
			 }else if(!password.equals(user.getPassword())) {
				 System.out.println("password is wrong");
			 }else {
				 request.getSession().setAttribute("userId", user.getUserId());
		            String userId = ""+ request.getSession().getAttribute("userId");
		            System.out.println("User ID from session: " + userId);
				 response.sendRedirect(request.getContextPath());
			 }
		 }catch(ServicesException e) {
			 e.printStackTrace();
			 throw new ServletException(e.getMessage());
		 }
	 }

}
