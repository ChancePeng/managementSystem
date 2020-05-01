package managementSystem.bean;

public class Reimbursement {
    private String R_id;
    private String workerId;
    private String R_price;
    private String Reason;
    private String state;
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }



    public String getR_id() {
        return R_id;
    }

    public void setR_id(String r_id) {
        R_id = r_id;
    }

    public String getWorkerId() {
        return workerId;
    }

    public void setWorkerId(String workerId) {
        this.workerId = workerId;
    }

    public String getR_price() {
        return R_price;
    }

    public void setR_price(String r_price) {
        R_price = r_price;
    }

    public String getReason() {
        return Reason;
    }

    public void setReason(String reason) {
        Reason = reason;
    }
}
