package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.model.BusSchedule;
import in.fssa.sundaratravels.service.BusScheduleServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/schedules/create")
public class NewScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/newSchedule.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String monday = request.getParameter("monday");
        String tuesday = request.getParameter("tuesday");
        String wednesday = request.getParameter("wednesday");
        String thursday = request.getParameter("thursday");
        String friday = request.getParameter("friday");
        String saturday = request.getParameter("saturday");
        String sunday = request.getParameter("sunday");

        BusSchedule newSchedule = new BusSchedule();
        newSchedule.setMonday(Boolean.parseBoolean(monday));
        newSchedule.setTuesday(Boolean.parseBoolean(tuesday));
        newSchedule.setWednesday(Boolean.parseBoolean(wednesday));
        newSchedule.setThursday(Boolean.parseBoolean(thursday));
        newSchedule.setFriday(Boolean.parseBoolean(friday));
        newSchedule.setSaturday(Boolean.parseBoolean(saturday));
        newSchedule.setSunday(Boolean.parseBoolean(sunday));

        BusScheduleServices scheduleServices = new BusScheduleServices();

        try {
            scheduleServices.createBusSchedule(newSchedule);
            response.sendRedirect(request.getContextPath() + "/admin/schedules");
        } catch (ServicesException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/newSchedule.jsp").forward(request, response);
        }
    }
}
