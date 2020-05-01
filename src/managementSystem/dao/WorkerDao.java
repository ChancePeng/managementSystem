package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.NewWorker;
import managementSystem.bean.Worker;
import managementSystem.util.ChineseToPinyin;
import managementSystem.util.GenerateId;
import managementSystem.util.GeneratePassword;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WorkerDao {
    public Worker login(Worker worker) throws SQLException {
        Worker user = null;

        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql_id = "select * from worker_login where workerId=? and passWord=?";
        String sql_nickName = "select * from worker_login where nickName=? and passWord=?";
        String sql_email = "select * from worker_login where email=? and passWord=?";

        //判断用户输入为--id--
        //       或者---昵称---
        //       或者---工号---
        Worker query_id = queryRunner.query(sql_id, new BeanHandler<Worker>(Worker.class), worker.getWorkerId(), worker.getPassWord());
        Worker query_nickName = queryRunner.query(sql_nickName, new BeanHandler<Worker>(Worker.class), worker.getWorkerId(), worker.getPassWord());
        Worker query_email = queryRunner.query(sql_email, new BeanHandler<Worker>(Worker.class),worker.getWorkerId(), worker.getPassWord());
        List<Worker> workerList = new ArrayList<>();
        workerList.add(query_id);
        workerList.add(query_nickName);
        workerList.add(query_email);
        for(int i=0;i<workerList.size();i++){
            if(workerList.get(i)!=null){
                user = workerList.get(i);
                break;
            }
        }
        return user;


    }


    public Worker checkWorkerInformation(Worker worker) throws SQLException {

        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select worker_login.workerId,nickName,passWord,email,name,sex,birthday,tel,place,incumbency,department,permissions from worker_login,worker_information,worker_department where worker_login.workerId = worker_department.workerId \n" +
                "and worker_login.workerId = worker_information.workerId\n" +
                "and worker_department.workerId = worker_information.workerId\n" +
                "and worker_login.workerId = ?";
        Worker query = queryRunner.query(sql, new BeanHandler<Worker>(Worker.class), worker.getWorkerId());
        return query;

    }

    public List<Worker> checkWorkers() throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select worker_login.workerId,nickName,passWord,email,name,sex,birthday,tel,place,incumbency,department,permissions from worker_login,worker_information,worker_department where worker_login.workerId = worker_department.workerId \n" +
                "and worker_login.workerId = worker_information.workerId\n" +
                "and worker_department.workerId = worker_information.workerId\n" +
                "and worker_login.workerId != '001';";
        List<Worker> query = queryRunner.query(sql, new BeanListHandler<Worker>(Worker.class));
        return query;
    }

    public Worker addWorker(NewWorker newWorker) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sqlInsLogin = "insert into worker_login value(?,?,?,?)";
        String sqlInsDepartment = "insert into worker_department value(?,?,?)";
        String sqlInsInformation = "insert into worker_information value(?,?,?,?,?,?,?)";
        GenerateId GenerateId = new GenerateId();
        GeneratePassword generatePassword = new GeneratePassword();
        ChineseToPinyin chineseToPinyin = new ChineseToPinyin();
        String id = GenerateId.getId();
        String password = generatePassword.getPassword();
        String nickName = chineseToPinyin.text(newWorker.getName());
        int rowInsLogin = queryRunner.update(sqlInsLogin, id, nickName, password, newWorker.getEmail());
        int rowInsDepartment = queryRunner.update(sqlInsDepartment, id, newWorker.getDepartment(),"3");
        int rowInsInformation = queryRunner.update(sqlInsInformation, id,newWorker.getName(),newWorker.getSex(),newWorker.getBirthday(),
                newWorker.getTel(),newWorker.getPlace(),"1"
        );
        Worker worker = null;
        if(rowInsLogin>0&&rowInsDepartment>0&&rowInsInformation>0){
            worker = checkWorkerInformationById(id);
        }
        return worker;

    }
    public Worker checkWorkerInformationById(String workerId) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select worker_login.workerId,nickName,passWord,email,name,sex,birthday,tel,place,incumbency,department,permissions from worker_login,worker_information,worker_department where worker_login.workerId = worker_department.workerId \n" +
                "and worker_login.workerId = worker_information.workerId\n" +
                "and worker_department.workerId = worker_information.workerId\n" +
                "and worker_login.workerId = ?";
        Worker query = queryRunner.query(sql, new BeanHandler<Worker>(Worker.class), workerId);
        return query;

    }

    public Worker checkWorker(String newWorkerName) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select worker_login.workerId,nickName,passWord,email,name,sex,birthday,tel,place,incumbency,department,permissions from worker_login,worker_information,worker_department where worker_login.workerId = worker_department.workerId \n" +
                "and worker_login.workerId = worker_information.workerId\n" +
                "and worker_department.workerId = worker_information.workerId\n" +
                "and worker_information.name = ?";
        Worker query = queryRunner.query(sql, new BeanHandler<Worker>(Worker.class), newWorkerName);
        return query;
    }

    public boolean setAuthority(String workerId,String d_Name) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update worker_department set permissions = '2' where workerId = ?";
        String sql1 = "update worker_department set department = ? where workerId = ?";
        int row = queryRunner.update(sql, workerId);
        int row1 = queryRunner.update(sql1, d_Name, workerId);
        return row>0&&row1>0;

    }

    public boolean changeCode(String workerId,String newPassword) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update worker_login set passWord = ? where workerId = ?";
        int row = queryRunner.update(sql, newPassword, workerId);
        return row>0;
    }

    public boolean changeWorkerDepartment(String oldName,String newName) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update worker_department set department  =? where department = ?";
        int row = queryRunner.update(sql, newName, oldName);
        return row>0;

    }
}
