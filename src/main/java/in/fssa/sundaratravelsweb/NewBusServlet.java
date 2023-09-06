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
import java.sql.Time;

@WebServlet("/admin/buses/create")
public class NewBusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/createBus.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String busNo = request.getParameter("busNo");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            boolean isAc = request.getParameter("isAc") != null;
            int routeId = Integer.parseInt(request.getParameter("routeId"));
            int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));

            Bus newBus = new Bus();
            newBus.setBusNo(busNo);
            newBus.setDepartureTime(Time.valueOf(departureTime));
            newBus.setArrivalTime(Time.valueOf(arrivalTime));
            newBus.setCapacity(capacity);
            newBus.setAc(isAc);
            newBus.setRouteId(routeId);
            newBus.setScheduleId(scheduleId);
            BusServices services = new BusServices();
            services.createBus(newBus);
            response.sendRedirect(request.getContextPath() + "/admin/buses");
        } catch (ServicesException e) {
            request.setAttribute("errorMessage", "Failed to create the bus: " + e.getMessage());
            request.getRequestDispatcher("/createBus.jsp").forward(request, response);
        }
    }
}