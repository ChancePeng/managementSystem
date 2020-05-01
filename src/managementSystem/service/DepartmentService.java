package managementSystem.service;

import managementSystem.bean.Department;
import managementSystem.dao.DepartmentDao;

import java.sql.SQLException;
import java.util.List;

public class DepartmentService {
    public List<Department> checkDepartmentList() throws SQLException {
        DepartmentDao departmentDao = new DepartmentDao();
        List<Department> departments = departmentDao.checkDepartmentList();
        return departments;
    }

    public boolean addDepartment(Department department) throws SQLException {
        DepartmentDao departmentDao = new DepartmentDao();
        boolean bool = departmentDao.addDepartment(department);
        return bool;

    }

    public boolean delDepartment(String d_Id) throws SQLException {
        DepartmentDao departmentDao = new DepartmentDao();
        boolean bool = departmentDao.delDepartment(d_Id);
        return bool;
    }

    public boolean changeDepartment(Department department) throws SQLException {
        DepartmentDao departmentDao = new DepartmentDao();
        boolean bool = departmentDao.changeDepartment(department);
        return bool;
    }
}
