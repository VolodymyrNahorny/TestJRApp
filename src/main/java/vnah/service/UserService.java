package vnah.service;

import vnah.model.User;

import java.util.List;

/**
 * Created by dell on 11.11.16.
 */
public interface UserService {
    void createUser(User user);

    void updateUser(User user);

    User getUserById(int id);

    void deleteUser(int id);

    int getUsersCount();

    int getPageCount(int usersCount);

    int getUsersCountWithName(String name);

    int getPageCountForName(int usersCountWithName);

    List<User> getUsersPage(int pageNumber, int totalPageCount);

    List<User> getUsersPageWithName(int pageNumber, int totalPageCount, String name);

}
