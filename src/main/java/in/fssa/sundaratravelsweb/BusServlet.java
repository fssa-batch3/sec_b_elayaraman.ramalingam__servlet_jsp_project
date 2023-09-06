package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.model.Bus;
import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.service.BusServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/buses")
public class BusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            BusServices busService = new BusServices();
        List<Bus> buses = null;
        try {
            buses = busService.getAllBuses();
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("buses", buses);

        request.getRequestDispatcher("/bus.jsp").forward(request, response);
    }
}
