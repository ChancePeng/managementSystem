package managementSystem.service;

import managementSystem.bean.NewWorker;
import managementSystem.bean.Worker;
import managementSystem.dao.WorkerDao;

import java.sql.SQLException;
import java.util.List;

public class WorkerService {
    public Worker login(Worker worker) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        Worker login = workerDao.login(worker);
        return login;

    }

    public Worker checkWorkerInformation(Worker worker) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        Worker worker1 = workerDao.checkWorkerInformation(worker);
        return worker1;
    }
    public List<Worker> checkWorkers() throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        List<Worker> workers = workerDao.checkWorkers();
        return workers;
    }

    public Worker addWorker(NewWorker newWorker) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        Worker worker = workerDao.addWorker(newWorker);
        return worker;
    }

    public Worker checkWorker(String newWorkerName) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        Worker worker = workerDao.checkWorker(newWorkerName);
        return worker;
    }

    public boolean setAuthority(String workerId,String d_Name) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        boolean bool = workerDao.setAuthority(workerId,d_Name);
        return bool;
    }

    public boolean changeCode(String workerId,String newPassword) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        boolean bool = workerDao.changeCode(workerId, newPassword);
        return bool;
    }

    public boolean changeWorkerDepartment(String oldName,String newName) throws SQLException {
        WorkerDao workerDao = new WorkerDao();
        boolean bool = workerDao.changeWorkerDepartment(oldName, newName);
        return bool;
    }
}
