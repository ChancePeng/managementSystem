package managementSystem.web;

import managementSystem.bean.Reimbursement;
import managementSystem.service.ReimbursementService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ReimbursementServlet",urlPatterns = "/Reimbursement")
public class ReimbursementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.setAttribute("method","Reimbursement");
            ReimbursementService reimbursementService = new ReimbursementService();
            //全部列表
            List<Reimbursement> reimbursements = reimbursementService.checkReimbursements();
            request.setAttribute("reimbursements",reimbursements);
            request.getRequestDispatcher("admin_index.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
