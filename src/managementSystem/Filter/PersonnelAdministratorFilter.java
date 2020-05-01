package managementSystem.Filter;

import managementSystem.bean.Worker;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "PersonnelAdministratorFilter",urlPatterns = {"/department.jsp","/newWorker.jsp",
        "/reimbursement.jsp","/workerReimbursement.jsp","/addDepartment",
        "/departmentManage","/department","/ReimbursementManage","/Reimbursement",
        "/verification"})
public class PersonnelAdministratorFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        HttpServletRequest request  =(HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        Worker worker = (Worker) session.getAttribute("worker");
        if(worker.getPermissions().equals("2")&&worker.getDepartment().equals("人事部")){
            response.sendRedirect("admin_index");
            return;

        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
