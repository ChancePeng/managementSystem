package managementSystem.web;

import managementSystem.bean.NewWorker;
import managementSystem.service.NewWorkerService;
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

@WebServlet(name = "newWorkerServlet",urlPatterns = "/newWorker")
public class newWorkerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            if(parameterMap==null){
                System.out.println("没有数据");
            }
            NewWorker newWorker = new NewWorker();
            BeanUtils.populate(newWorker,parameterMap);
            NewWorkerService newWorkerService = new NewWorkerService();
            boolean bool = newWorkerService.newWorker(newWorker);
            if(bool){
                response.sendRedirect("login.jsp?send=well");
            }else{
                response.getWriter().write("login.jsp?send=error");
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
