package managementSystem.web;

import managementSystem.bean.User;
import managementSystem.service.UserService;
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

@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String u_method = request.getParameter("U_method");
            String userName = request.getParameter("userName");
            UserService userService = new UserService();
            boolean bool = false;
            if(u_method.equals("delete")){
                bool = userService.delUser(userName);
                if(bool){
                    response.sendRedirect("userManage?method=userManage");
                }else{
                    response.getWriter().write("delUser error");
                }
            }else if(u_method.equals("changeUser")){
                Map<String, String[]> parameterMap = request.getParameterMap();
                User user = new User();
                BeanUtils.populate(user,parameterMap);
                System.out.println(user.getUserName());
                bool = userService.changeUser(user);
                if(bool){
                    System.out.println("changeUser success");
                    response.sendRedirect("userManage");
                }else{
                    System.out.println("chaneUser error");
                    response.sendRedirect("userManage");
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
