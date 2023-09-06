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

@WebServlet("/admin/schedules/edit")
public class EditScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BusScheduleServices services = new BusScheduleServices();
            BusSchedule schedule = services.getBusSchedule(id);

            if (schedule != null) {
                request.setAttribute("editSchedule", schedule);
                request.getRequestDispatcher("/editSchedule.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/schedules");
            }
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/schedules");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BusScheduleServices scheduleServices = new BusScheduleServices();
        try {
            int scheduleId = Integer.parseInt(request.getParameter("id"));
            boolean monday = request.getParameter("monday") != null && request.getParameter("monday").equals("on");
            boolean tuesday = request.getParameter("tuesday") != null && request.getParameter("tuesday").equals("on");
            boolean wednesday = request.getParameter("wednesday") != null && request.getParameter("wednesday").equals("on");
            boolean thursday = request.getParameter("thursday") != null && request.getParameter("thursday").equals("on");
            boolean friday = request.getParameter("friday") != null && request.getParameter("friday").equals("on");
            boolean saturday = request.getParameter("saturday") != null && request.getParameter("saturday").equals("on");
            boolean sunday = request.getParameter("sunday") != null && request.getParameter("sunday").equals("on");

            BusSchedule schedule = scheduleServices.getBusSchedule(scheduleId);

            if (schedule != null) {
                schedule.setMonday(monday);
                schedule.setTuesday(tuesday);
                schedule.setWednesday(wednesday);
                schedule.setThursday(thursday);
                schedule.setFriday(friday);
                schedule.setSaturday(saturday);
                schedule.setSunday(sunday);

                scheduleServices.updateBusSchedule(schedule);

                response.sendRedirect(request.getContextPath() + "/admin/schedules");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/schedules");
            }
        } catch (NumberFormatException | ServicesException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/schedules");
        }
    }
}
