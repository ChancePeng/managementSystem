package managementSystem.web;

import managementSystem.bean.Worker;
import managementSystem.service.StaffService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name = "StaffServlet",urlPatterns = "/changeWorker")
public class StaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            Worker worker = new Worker();
            BeanUtils.populate(worker,parameterMap);
            StaffService staffService = new StaffService();
            Boolean bool = staffService.changeWorker(worker);
            if(bool){
                System.out.println("changeWorker success");
                response.sendRedirect("staffManagement?send=change_success&view=workerList");
            }else{
                System.out.println("changeWorker error");
                response.sendRedirect("staffManagement");
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
