package managementSystem.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import managementSystem.bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public List<User> checkUsers() throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from user";
        List<User> query = queryRunner.query(sql, new BeanListHandler<User>(User.class));
        return query;


    }

    public boolean delUser(String userName) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "delete from user where userName = ?";
        int row = queryRunner.update(sql, userName);
        return row>0;
    }

    public boolean changeUser(User user) throws SQLException {
        ComboPooledDataSource comboPooledDataSource = new ComboPooledDataSource();
        QueryRunner queryRunner = new QueryRunner(comboPooledDataSource);
        String sql = "select * from user where userId = ?";
        String sqlDel = "delete from user where userId = ?";
        String sqlIns = "insert into user value(?,?,?,?,?,?,?,?)";
        boolean row = false;
        User query = queryRunner.query(sql, new BeanHandler<User>(User.class), user.getUserId());
        if(query!=null){
            System.out.println("查询到用户数据");
            String password =  query.getPassWord();
            int row1 = queryRunner.update(sqlDel, user.getUserId());
            if(row1>0){
                System.out.println("删除用户数据成功");
                int row2 = queryRunner.update(sqlIns, user.getUserId(), user.getUserName(), password, user.getSex(), user.getBirthday(), user.getTel(), user.getEmail(), user.getPlace());
                row = row2>0;
            }else{
                System.out.println("删除数据失败");
                row = false;
            }
        }else{
            System.out.println("没有查询到用户数据");
            row = false;
        }
        return row;
    }
}
