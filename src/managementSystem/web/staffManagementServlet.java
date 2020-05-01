package managementSystem.web;

import managementSystem.bean.NewWorker;
import managementSystem.bean.Worker;
import managementSystem.service.NewWorkerService;
import managementSystem.service.WorkerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "staffManagementServlet", urlPatterns = "/staffManagement")
public class staffManagementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {


            /*
             * 此处判断登录人员的所在的公司职务
             * max为最高管理员
             * 相应部门名为该部门管理员
             * */

            NewWorkerService newWorkerService = new NewWorkerService();
            List<NewWorker> newWorkers = newWorkerService.checkNewWorkerInformation();
            WorkerService workerService = new WorkerService();
            List<Worker> workers = workerService.checkWorkers();
            request.setAttribute("workers",workers);
            request.setAttribute("newWorkers", newWorkers);


            request.setAttribute("method", "newWorker");

            request.getRequestDispatcher("admin_index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
