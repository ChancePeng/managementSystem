package managementSystem.web;

import managementSystem.bean.Worker;
import managementSystem.service.WorkerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ChangeCodeServlet",urlPatterns = "/changeCode")
public class ChangeCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String newCode = request.getParameter("newCode");
            HttpSession session = request.getSession();
            Worker worker = (Worker) session.getAttribute("worker");
            WorkerService workerService = new WorkerService();
            boolean bool = workerService.changeCode(worker.getWorkerId(), newCode);
            if(bool){
                System.out.println("changeCode success");
                response.sendRedirect("loginForward?send=changeCode");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
