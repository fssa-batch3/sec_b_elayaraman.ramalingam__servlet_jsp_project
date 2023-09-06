package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.Route;
import in.fssa.sundaratravels.service.BusScheduleServices;
import in.fssa.sundaratravels.service.RouteServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import in.fssa.sundaratravels.model.BusSchedule;
@WebServlet("/admin/schedules")
public class ScheduleServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BusScheduleServices services = new BusScheduleServices();
        List<BusSchedule> list = null;
        try {
            list = services.getAllBusSchedules();
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("schedules",
                list);
        request.getRequestDispatcher("/schedules.jsp").forward(request, response);
    }
}
