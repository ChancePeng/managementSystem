package managementSystem.web;

import managementSystem.bean.Reimbursement;
import managementSystem.bean.Worker;
import managementSystem.service.ReimbursementService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "workerReimbursementServlet",urlPatterns = "/workerReimbursement")
public class workerReimbursementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setAttribute("method","workerReimbursement");
            HttpSession session = request.getSession();
            Worker worker =(Worker) session.getAttribute("worker");
            String workerId = worker.getWorkerId();
            System.out.println(workerId);
            ReimbursementService reimbursementService = new ReimbursementService();
            List<Reimbursement> reimbursements = reimbursementService.checkReimbursement(workerId);
            request.setAttribute("reimbursements",reimbursements);
            request.getRequestDispatcher("admin_index.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
