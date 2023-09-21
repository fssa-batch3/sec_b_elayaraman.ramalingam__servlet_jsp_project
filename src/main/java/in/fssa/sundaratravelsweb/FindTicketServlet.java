package in.fssa.sundaratravelsweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.sundaratravels.dao.*;
import in.fssa.sundaratravels.exception.PersistenceException;
import in.fssa.sundaratravels.model.*;
import java.sql.*;
import java.util.List;

@WebServlet({ "/FindTicketServlet", "/ticket/find" })
public class FindTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/findTicket.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ticket> list;
		try {
			System.out.println(request.getParameter("phonenumber"));
			Long phoneNumber = Long.parseLong(request.getParameter("phonenumber"));
			Date traveldate = Date.valueOf(request.getParameter("traveldate"));
			
			TicketDAO dao = new TicketDAO();
			list = dao.getTicketsByPhoneNumberAndDate(phoneNumber, traveldate);
			
			String ticketJson = new Gson().toJson(list);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(ticketJson);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
