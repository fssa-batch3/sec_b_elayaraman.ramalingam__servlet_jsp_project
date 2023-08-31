package in.fssa.sundaratravelsweb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.fssa.sundaratravels.service.RouteServices;

@WebServlet("/book")
public class BookTicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException{
        RequestDispatcher request = req.getRequestDispatcher("./index.jsp");
        request.forward(req,res);
    }
}
