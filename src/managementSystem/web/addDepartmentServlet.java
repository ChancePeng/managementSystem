package managementSystem.web;

import managementSystem.bean.Department;
import managementSystem.service.DepartmentService;
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

@WebServlet(name = "addDepartmentServlet",urlPatterns = "/addDepartment")
public class addDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            Department department = new Department();
            BeanUtils.populate(department,parameterMap);
            DepartmentService departmentService = new DepartmentService();
            boolean bool = departmentService.addDepartment(department);
            if (bool) {
                response.sendRedirect("department");
            }else{
                response.getWriter().write("addDepartment error");
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
