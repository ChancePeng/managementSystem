package managementSystem.web;

import managementSystem.bean.Reimbursement;
import managementSystem.bean.Worker;
import managementSystem.service.ReimbursementService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name = "workerReimbursementManageServlet",urlPatterns = "/workerReimbursementManage")
public class workerReimbursementManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            Reimbursement reimbursement = new Reimbursement();
            BeanUtils.populate(reimbursement,parameterMap);
            System.out.println(reimbursement.getR_id());
            System.out.println(reimbursement.getWorkerId());
            System.out.println(reimbursement.getReason());
            System.out.println(reimbursement.getR_price());
            HttpSession session = request.getSession();
            Worker worker =(Worker) session.getAttribute("worker");

            reimbursement.setWorkerId(worker.getWorkerId());

            ReimbursementService reimbursementService = new ReimbursementService();
            boolean bool = reimbursementService.addReimbursement(reimbursement);
            if(bool){
                System.out.println("addReimbursement success");
                response.sendRedirect("workerReimbursement");
            }else{
                System.out.println("addReimbursement error");
                response.sendRedirect("workerReimbursement");
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
