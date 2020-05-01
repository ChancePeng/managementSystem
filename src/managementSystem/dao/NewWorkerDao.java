package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.NewWorker;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class NewWorkerDao {
    public boolean newWorker(NewWorker newWorker) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "insert into newworker values(?,?,?,?,?,?,?,?)";
        int row = queryRunner.update(sql, newWorker.getName(), newWorker.getSex(), newWorker.getBirthday(),
                newWorker.getTel(), newWorker.getEmail(),
                newWorker.getPlace(), newWorker.getDepartment(), "0");
        return row>0;
    }

    public List<NewWorker> checkNewWorkerInformation() throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from newworker";
        List<NewWorker> query = queryRunner.query(sql, new BeanListHandler<NewWorker>(NewWorker.class));
        return query;
    }

    public boolean setThrough(String newWorkerName) throws SQLException {

        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update newworker set state = ? where name = ?";
        int row = queryRunner.update(sql, "1", newWorkerName);
        return row>0;
    }

    public boolean setWithdraw(String newWorkerName) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update newworker set state = ? where name = ?";
        int row = queryRunner.update(sql, "2", newWorkerName);
        return row>0;
    }

    public NewWorker checkOnlyNewWorkerInformation(String newWorkerName) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from newworker where name=?";
        NewWorker query = queryRunner.query(sql, new BeanHandler<NewWorker>(NewWorker.class), newWorkerName);
        return query;
    }
}
