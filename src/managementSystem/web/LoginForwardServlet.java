package managementSystem.web;

import managementSystem.bean.Department;
import managementSystem.service.DepartmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "LoginForwardServlet",urlPatterns = "/loginForward")
public class LoginForwardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String send = request.getParameter("send");
            String url = "";
            if(send!=null&&send.equals("changeCode")){
                url = "login.jsp?send=changeCode";
            }else{
                url = "login.jsp";
            }

            DepartmentService departmentService = new DepartmentService();
            List<Department> departments = departmentService.checkDepartmentList();
            request.setAttribute("departments",departments);
            request.getRequestDispatcher(url).forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
