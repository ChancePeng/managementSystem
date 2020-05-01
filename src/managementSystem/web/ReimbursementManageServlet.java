package managementSystem.web;

import managementSystem.service.ReimbursementService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ReimbursementManageServlet",urlPatterns = "/ReimbursementManage")
public class ReimbursementManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String r_method = request.getParameter("R_method");
            String r_id = request.getParameter("R_id");
            ReimbursementService reimbursementService = new ReimbursementService();
            boolean bool = false;

            if(r_method.equals("through")){
                bool = reimbursementService.throughReimbursement(r_id);
                if(bool){
                    response.sendRedirect("Reimbursement?send=through_success");
                }
            }else if(r_method.equals("withdraw")){
                bool = reimbursementService.withdrawReimbursement(r_id);
                if(bool){
                    response.sendRedirect("Reimbursement?send=withdraw_success");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
