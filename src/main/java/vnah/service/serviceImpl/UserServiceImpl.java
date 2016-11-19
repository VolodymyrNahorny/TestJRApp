package vnah.service.serviceImpl;

import org.springframework.transaction.annotation.Transactional;
import vnah.dao.UserDAO;
import vnah.model.User;
import vnah.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 11.11.16.
 */
public class UserServiceImpl implements UserService {
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /* deprecated
        @Transactional
        public List<User> getAllUsers() {
            return this.userDAO.getAllUsers();
        }
        @Transactional
        public List<User> getUserByName(String name) {
            return this.userDAO.getUserByName(name);
        }
    */
    @Transactional
    public void createUser(User user) {
        this.userDAO.createUser(user);
    }

    @Transactional
    public void updateUser(User user) {
        this.userDAO.updateUser(user);
    }

    @Transactional
    public void deleteUser(int id) {
        this.userDAO.deleteUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }

    @Transactional
    public int getUsersCount() {
        return this.userDAO.getUsersCount();
    }

    @Transactional
    public int getUsersCountWithName(String name) {
        return this.userDAO.getUsersCountWithName(name);
    }

    @Transactional
    public List<User> getUsersPage(int pageNumber, int totalPageCount) {
        List<User> users = new ArrayList<User>();
        if (pageNumber <= totalPageCount)
            users = this.userDAO.getUsersPage(pageNumber, totalPageCount);
        else if (pageNumber > totalPageCount)
            users = this.userDAO.getUsersPage(1, totalPageCount);
        return users;
    }

    @Transactional
    public int getPageCount(int usersCount) {
        int totalPageCount = usersCount > 0 ? 1 : 0;
        if (usersCount > 10)
            totalPageCount = usersCount % 10 == 0 ? usersCount / 10 : usersCount / 10 + 1;
        return totalPageCount;
    }

    @Transactional
    public List<User> getUsersPageWithName(int pageNumber, int totalPageCount, String name) {
        List<User> users = new ArrayList<User>();
        if (pageNumber <= totalPageCount)
            users = this.userDAO.getUsersPageWithName(pageNumber, totalPageCount, name);
        else if (pageNumber > totalPageCount)
            users = this.userDAO.getUsersPageWithName(1, totalPageCount, name);
        return users;
    }

    @Transactional
    public int getPageCountForName(int usersCountWithName) {
        int totalPageCount = usersCountWithName > 0 ? 1 : 0;
        if (usersCountWithName > 10)
            totalPageCount = usersCountWithName % 10 == 0 ? usersCountWithName / 10 : usersCountWithName / 10 + 1;
        return totalPageCount;
    }
}
