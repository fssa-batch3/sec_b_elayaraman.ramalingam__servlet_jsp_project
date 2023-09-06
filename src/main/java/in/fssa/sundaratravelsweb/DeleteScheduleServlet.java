package in.fssa.sundaratravelsweb;

import in.fssa.sundaratravels.exception.ServicesException;
import in.fssa.sundaratravels.service.BusScheduleServices;
import in.fssa.sundaratravels.service.RouteServices;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/schedules/delete")
public class DeleteScheduleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int scheduleId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("scheduleId", scheduleId);
        request.getRequestDispatcher("/deleteSchedule.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        BusScheduleServices services = new BusScheduleServices();
        System.out.println("jj");
        try {
            services.deleteBusSchedule(scheduleId);
        } catch (ServicesException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath() + "/admin/schedules");
    }
}
