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

@WebServlet("/admin/buses/edit")
public class EditBusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("id"));
        BusServices busServices = new BusServices();
        try {
            Bus bus = busServices.getBus(busId);
            request.setAttribute("editBus", bus);
            request.getRequestDispatcher("/editBus.jsp").forward(request, response);
        } catch (ServicesException e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int busId = Integer.parseInt(request.getParameter("busId"));
            String busNo = request.getParameter("busNo");
            String departureTime = request.getParameter("departureTime");
            String arrivalTime = request.getParameter("arrivalTime");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            boolean isAc = request.getParameter("isAc") != null;
            int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));

            BusServices services = new BusServices();
            Bus bus = new Bus();
            bus.setId(busId);
            bus.setBusNo(busNo);
            bus.setDepartureTime(Time.valueOf(departureTime));
            bus.setArrivalTime(Time.valueOf(arrivalTime));
            bus.setCapacity(capacity);
            bus.setAc(isAc);
            bus.setScheduleId(scheduleId);
            services.updateBus(bus);
            response.sendRedirect(request.getContextPath() + "/admin/buses");
        } catch (ServicesException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/buses/edit?id=" + request.getParameter("busId") + "&error=true");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
