package managementSystem.service;

import managementSystem.bean.Worker;
import managementSystem.dao.StaffDao;

import java.sql.SQLException;

public class StaffService {
    public Boolean changeWorker(Worker worker) throws SQLException {
        StaffDao staffDao = new StaffDao();
        Boolean bool = staffDao.changeWorker(worker);
        return  bool;

    }
}
