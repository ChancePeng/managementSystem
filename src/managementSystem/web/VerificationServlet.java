package managementSystem.web;

import managementSystem.bean.NewWorker;
import managementSystem.bean.Worker;
import managementSystem.service.NewWorkerService;
import managementSystem.service.WorkerService;
import managementSystem.util.MailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "VerificationServlet",urlPatterns = "/verification")
public class VerificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String v_method = request.getParameter("V_method");
            String newWorkerName = request.getParameter("newWorkerName");
            NewWorkerService newWorkerService = new NewWorkerService();
            boolean bool = false;
            if(v_method.equals("through")){

                bool = newWorkerService.setThough(newWorkerName);
                WorkerService workerService = new WorkerService();
                NewWorker newWorker = newWorkerService.checkOnlyNewWorkerInformation(newWorkerName);
                Worker worker = workerService.addWorker(newWorker);
                if(bool){
                    System.out.println("through success");
                    System.out.println("addWorker success");
//------------------------------javamail发送邮件部分----------------------------------------------------
                    MailUtils mailUtils = new MailUtils();
                    mailUtils.Addressee_mail = worker.getEmail();
                    mailUtils.content = "恭喜您("+worker.getName()+")申请成功，您的工号为:"+worker.getWorkerId()+",所在部门为"+worker.getDepartment()+",昵称为您真实姓名的小写拼音，密码为:"+worker.getPassWord()+
                            ",请牢记密码！届时，您可通过您的昵称、邮箱或者工号使用密码登录，当您第一次登陆后，请更改密码!祝您任职愉快！！<a href='http://39.106.177.154/'>点击快速转至登录</a>";
                    mailUtils.sendMail();
//------------------------------javamail发送邮件部分----------------------------------------------------
                    response.sendRedirect("staffManagement?send=through_success");

                }else{
                    System.out.println("through error");
                }





            }
            if(v_method.equals("withdraw")){
                System.out.println("withdraw");
                bool = newWorkerService.setWithdraw(newWorkerName);
                if(bool){
                    System.out.println("withdraw success");
                    response.sendRedirect("staffManagement?send=withdraw_success");
                    NewWorkerService newWorkerService1 = new NewWorkerService();
                    NewWorker newWorker = newWorkerService1.checkOnlyNewWorkerInformation(newWorkerName);
//------------------------------javamail发送邮件部分----------------------------------------------------
                    MailUtils mailUtils = new MailUtils();
                    mailUtils.Addressee_mail = newWorker.getEmail();
                    mailUtils.content = "非常抱歉您申请失败！！谢谢您对公司的期望！！您可继续努力，期望您的下次提交！！！祝您安康！！";
                    mailUtils.sendMail();
//------------------------------javamail发送邮件部分----------------------------------------------------



                }else{
                    System.out.println("withdraw error");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
