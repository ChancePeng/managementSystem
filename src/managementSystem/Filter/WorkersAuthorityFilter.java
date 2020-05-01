package managementSystem.Filter;

import managementSystem.bean.Worker;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "WorkersAuthorityFilter",urlPatterns = {"/department.jsp","/newWorker.jsp",
        "/reimbursement.jsp","/staffManagement.jsp","/system_index.jsp","/user.jsp","/addDepartment",
        "/departmentManage","/department","/ReimbursementManage","/Reimbursement",
        "/staffManagement","/changeWorker","/userManage","/user","/verification"})
public class WorkersAuthorityFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request  =(HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        Worker worker = (Worker) session.getAttribute("worker");
        if(worker.getPermissions().equals("3")){
            response.sendRedirect("admin_index");
            return;
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
