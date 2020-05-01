package managementSystem.service;

import managementSystem.bean.NewWorker;
import managementSystem.dao.NewWorkerDao;

import java.sql.SQLException;
import java.util.List;

public class NewWorkerService {
    public boolean newWorker(NewWorker newWorker) throws SQLException {
        NewWorkerDao newWorkerDao = new NewWorkerDao();
        boolean bool = newWorkerDao.newWorker(newWorker);
        return bool;
    }

    public List<NewWorker> checkNewWorkerInformation() throws SQLException {
        NewWorkerDao newWorkerDao = new NewWorkerDao();
        List<NewWorker> newWorkers = newWorkerDao.checkNewWorkerInformation();
        return newWorkers;
    }

    public boolean setThough(String newWorkerName) throws SQLException {
        NewWorkerDao newWorkerDao = new NewWorkerDao();
        boolean bool = newWorkerDao.setThrough(newWorkerName);
        return bool;
    }

    public boolean setWithdraw(String newWorkerName) throws SQLException {
        NewWorkerDao newWorkerDao = new NewWorkerDao();
        boolean bool = newWorkerDao.setWithdraw(newWorkerName);
        return bool;
    }

    public NewWorker checkOnlyNewWorkerInformation(String newWorkerName) throws SQLException {
        NewWorkerDao newWorkerDao = new NewWorkerDao();
        NewWorker newWorker = newWorkerDao.checkOnlyNewWorkerInformation(newWorkerName);
        return newWorker;
    }
}