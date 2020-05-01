package managementSystem.service;

import managementSystem.bean.User;
import managementSystem.dao.UserDao;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    public List<User> checkUsers() throws SQLException {
        UserDao userDao = new UserDao();
        List<User> users = userDao.checkUsers();
        return users;
    }

    public boolean delUser(String userName) throws SQLException {
        UserDao userDao = new UserDao();
        boolean bool = userDao.delUser(userName);
        return bool;
    }

    public boolean changeUser(User user) throws SQLException {
        UserDao userDao = new UserDao();
        boolean bool = userDao.changeUser(user);
        return bool;
    }
}
