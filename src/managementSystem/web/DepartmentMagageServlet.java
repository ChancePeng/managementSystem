package managementSystem.web;

import managementSystem.bean.Department;
import managementSystem.service.DepartmentService;
import managementSystem.service.WorkerService;
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

@WebServlet(name = "DepartmentMagageServlet",urlPatterns = "/departmentManage")
public class DepartmentMagageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String d_method = request.getParameter("D_method");
            DepartmentService departmentService = new DepartmentService();
            boolean bool = false;
            if(d_method.equals("delDepartment")){
                String d_id = request.getParameter("d_Id");
                bool = departmentService.delDepartment(d_id);
                if(bool){
                    response.sendRedirect("department?send=del_success");
                    System.out.println("delDepartment success");
                }else{
                    response.sendRedirect("department?send=dei_error");
                    System.out.println("delDepartment error");
                }
            }
            if(d_method.equals("changeDepartment")){
                Map<String, String[]> parameterMap = request.getParameterMap();
                String oldName = request.getParameter("oldName");
                String newName = request.getParameter("d_Name");
                Department department = new Department();
                BeanUtils.populate(department,parameterMap);
                System.out.println(department.getD_Name());
                WorkerService workerService = new WorkerService();
                System.out.println(department.getWorkerId());
                System.out.println(department.getD_Name());
                boolean setResult = workerService.setAuthority(department.getWorkerId(),department.getD_Name());
                bool = departmentService.changeDepartment(department);
                boolean changeWorkerDepartmentBool = workerService.changeWorkerDepartment(oldName, newName);
                if(bool){
                    System.out.println("changeDepartment success");
                    response.sendRedirect("department?send=change_success");
                }else{
                    System.out.println("changeDepartment Error");
                    response.sendRedirect("department?send=change_error");
                }
                if(setResult){
                    System.out.println("设置成功");
                }else{
                    System.out.println("设置失败");
                }
                if(changeWorkerDepartmentBool){
                    System.out.println("change Worker department success");
                }else{
                    System.out.println("change worker department error");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
