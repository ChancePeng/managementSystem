package managementSystem.web;

import managementSystem.bean.Worker;
import managementSystem.service.WorkerService;
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

@WebServlet(name = "loginServlet",urlPatterns = "/login")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            Worker worker = new Worker();
            BeanUtils.populate(worker,parameterMap);
            WorkerService workerService = new WorkerService();
            Worker login = workerService.login(worker);
            if(login!=null){
                System.out.println("login_success");
                HttpSession session = request.getSession();
                Worker worker1 = workerService.checkWorkerInformation(login);
                session.setAttribute("worker",worker1);
                response.sendRedirect("admin_index");
            }else{
                System.out.println("login_error");
                response.sendRedirect("login.jsp?send=loginError");
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
