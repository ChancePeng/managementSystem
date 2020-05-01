package managementSystem.service;

import managementSystem.bean.Reimbursement;
import managementSystem.dao.ReimbursementDao;

import java.sql.SQLException;
import java.util.List;

public class ReimbursementService {
    public List<Reimbursement> checkReimbursements() throws SQLException {
        ReimbursementDao reimbursementDao = new ReimbursementDao();
        List<Reimbursement> reimbursements = reimbursementDao.checkReimbursements();
        return reimbursements;

    }

    public boolean throughReimbursement(String r_id) throws SQLException {
        ReimbursementDao reimbursementDao = new ReimbursementDao();
        boolean bool = reimbursementDao.throughReimbursement(r_id);
        return bool;

    }

    public boolean withdrawReimbursement(String r_id) throws SQLException {
        ReimbursementDao reimbursementDao = new ReimbursementDao();
        boolean bool = reimbursementDao.withdrawReimbursement(r_id);
        return bool;
    }

    public List<Reimbursement> checkReimbursement(String workerId) throws SQLException {
        ReimbursementDao reimbursementDao = new ReimbursementDao();
        List<Reimbursement> reimbursements = reimbursementDao.checkReimbursement(workerId);
        return reimbursements;
    }

    public boolean addReimbursement(Reimbursement reimbursement) throws SQLException {
        ReimbursementDao reimbursementDao = new ReimbursementDao();
        boolean bool = reimbursementDao.addReimbursement(reimbursement);
        return bool;
    }
}
