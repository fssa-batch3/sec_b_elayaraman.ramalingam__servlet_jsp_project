package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Bus;
import in.fssa.sundaratravels.service.BusServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/buses/delete")
public class DeleteBusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int busId = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("busId", busId);
            request.getRequestDispatcher("/deleteBus.jsp").forward(request, response);
        }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                int busId = Integer.parseInt(request.getParameter("busId"));
                BusServices services = new BusServices();
        try {
            services.switchBusStatus(busId);
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath() + "/admin/buses");
    }
}

