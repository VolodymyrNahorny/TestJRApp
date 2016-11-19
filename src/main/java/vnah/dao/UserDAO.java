package vnah.dao;

import vnah.model.User;

import java.util.List;

/**
 * Created by dell on 11.11.16.
 */
public interface UserDAO {
    /*   deprecated
       List<User> getAllUsers();
       List<User> getUserByName(String name);
       */
    User getUserById(int id);

    void createUser(User user);

    void updateUser(User user);

    void deleteUser(int id);

    int getUsersCount();

    int getUsersCountWithName(String name);

    List<User> getUsersPage(int pageNumber, int totalPageCount);

    List<User> getUsersPageWithName(int pageNumber, int totalPageCount, String name);
}
