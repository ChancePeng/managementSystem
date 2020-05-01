package managementSystem.web;

import managementSystem.bean.Department;
import managementSystem.bean.Worker;
import managementSystem.service.DepartmentService;
import managementSystem.service.WorkerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DepartmentServlet", urlPatterns = "/department")
public class DepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            DepartmentService departmentService = new DepartmentService();
            WorkerService workerService = new WorkerService();
            List<Worker> workers = workerService.checkWorkers();
            request.setAttribute("d_workers",workers);


            List<Department> departments = departmentService.checkDepartmentList();
            request.setAttribute("method", "Department");
            request.setAttribute("departments",departments);
            request.getRequestDispatcher("index.jsp");

            request.getRequestDispatcher("admin_index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
