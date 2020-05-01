package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.Reimbursement;
import managementSystem.util.GenerateId;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ReimbursementDao {
    public List<Reimbursement> checkReimbursements() throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from reimbursement";
        List<Reimbursement> query = queryRunner.query(sql, new BeanListHandler<Reimbursement>(Reimbursement.class));
        return query;

    }

    public boolean throughReimbursement(String r_id) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update reimbursement set state='1' where R_id=?";
        int row = queryRunner.update(sql, r_id);
        return row>0;
    }

    public boolean withdrawReimbursement(String r_id) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "update reimbursement set state='2' where R_id=?";
        int row = queryRunner.update(sql, r_id);
        return row>0;
    }

    public List<Reimbursement> checkReimbursement(String workerId) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from reimbursement where workerId = ?";
        List<Reimbursement> query = queryRunner.query(sql, new BeanListHandler<Reimbursement>(Reimbursement.class), workerId);
        return query;
    }

    public boolean addReimbursement(Reimbursement reimbursement) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);

        System.out.println(reimbursement.getR_id()+reimbursement.getWorkerId()+reimbursement.getR_price()+ reimbursement.getReason()+ "0");
        String sql = "insert into reimbursement value(?,?,?,?,?)";
        GenerateId GenerateId = new GenerateId();
        String id = GenerateId.getId();
        int row = queryRunner.update(sql, id, reimbursement.getWorkerId(), reimbursement.getR_price(), reimbursement.getReason(), "0");
        return row>0;
    }
}
