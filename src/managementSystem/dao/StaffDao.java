package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.Worker;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class StaffDao {
    public Boolean changeWorker(Worker worker) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        Boolean bool = false;
        String sql = "select * from worker_login where workerId = ?";
        Worker query = queryRunner.query(sql, new BeanHandler<Worker>(Worker.class), worker.getWorkerId());
        String password = query.getPassWord();
        String nickName = query.getNickName();
        String permissions = query.getPermissions();
        System.out.println(password);
        System.out.println(worker.getDepartment());
        String sqlDel1 = "delete from worker_login where workerId = ?";
        String sqlDel2 = "delete from worker_department where workerId = ?";
        String sqlDel3 = "delete from worker_information where workerId = ?";
        String sqlIns1 = "insert into worker_login value(?,?,?,?)";
        String sqlIns2 = "insert into worker_department value(?,?,?)";
        String sqlIns3 = "insert into worker_information value(?,?,?,?,?,?,?)";
        int rowDel2 = queryRunner.update(sqlDel2, worker.getWorkerId());
        int rowDel3 = queryRunner.update(sqlDel3, worker.getWorkerId());
        int rowDel1 = queryRunner.update(sqlDel1, worker.getWorkerId());
        if(rowDel1>0&&rowDel2>0&&rowDel3>0){
            System.out.println("职工删除成功");
            int rowIns1 = queryRunner.update(sqlIns1, worker.getWorkerId(), nickName,password, worker.getEmail());
            int rowIns2 = queryRunner.update(sqlIns2, worker.getWorkerId(), worker.getDepartment(), permissions);
            int rowIns3 = queryRunner.update(sqlIns3, worker.getWorkerId(), worker.getName(), worker.getSex(),worker.getBirthday(),worker.getTel(),worker.getPlace(),worker.getIncumbency());
            if(rowIns1>0&&rowIns2>0&&rowIns3>0){
                System.out.println("更新完成！！！");
                bool = true;
            }else{
                System.out.println("更新失败！！！");
                bool = false;
            }
        }else{
            System.out.println("删除失败");
            bool = false;
        }
        return bool;
    }
}
