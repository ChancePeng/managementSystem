package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.Department;
import managementSystem.util.GenerateId;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DepartmentDao {
    public List<Department> checkDepartmentList() throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from department";
        List<Department> query = queryRunner.query(sql, new BeanListHandler<Department>(Department.class));
        return query;


    }

    public boolean addDepartment(Department department) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "insert into department values(?,?,?)";
        GenerateId generateId = new GenerateId();
        String id = generateId.getId();
        int row = queryRunner.update(sql, department.getD_Name(), id,department.getWorkerId());
        return row>0;

    }

    public boolean delDepartment(String d_Id) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "delete from department where d_Id = ?";
        int row = queryRunner.update(sql, d_Id);
        return row>0;
    }

    public boolean changeDepartment(Department department) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql1 = "update department set d_name=? where d_Id = ?";
        String sql2 = "update department set workerId=? where d_Id = ?";
        int row1 = queryRunner.update(sql1, department.getD_Name(), department.getD_Id());
        int row2 = queryRunner.update(sql2, department.getWorkerId(), department.getD_Id());
        return row1>0&&row2>0;
    }
}
