package vnah.dao.daoImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import vnah.dao.UserDAO;
import vnah.model.User;

import java.util.List;

/**
 * Created by dell on 11.11.16.
 */
public class UserDAOImpl implements UserDAO {


    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
/* deprecated
    public List<User> getAllUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("FROM User").list();
        return userList;
    }
    public List<User> getUserByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User WHERE name = :name");
        query.setParameter("name", name);
        List<User> userList = query.list();
        return userList;
    }
*/

    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        System.out.println("Selected user: "+user);
        return user;
    }
    public void createUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    public void deleteUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (user != null) session.delete(user);
    }

    public int getUsersCount() {
        Session session = this.sessionFactory.getCurrentSession();
        return ((Long)session.createQuery("SELECT count(*) FROM User").uniqueResult()).intValue();
    }

    public int getUsersCountWithName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT count(*) FROM User user WHERE user.name = :name");
        query.setParameter("name", name);
        return ((Long)query.uniqueResult()).intValue();
    }

    public List<User> getUsersPage(int pageNumber, int totalPageCount) {
        int firstRowNumber = (pageNumber-1) * 10;
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User user order by user.name");
        query.setFirstResult(firstRowNumber);
        query.setMaxResults(10);
        List<User> usersPage = query.list();
        return usersPage;
    }

    public List<User> getUsersPageWithName(int pageNumber, int totalPageCount, String name) {
        int firstRowNumber = (pageNumber-1) * 10;
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User user WHERE user.name = :name");
        query.setParameter("name", name);
        query.setFirstResult(firstRowNumber);
        query.setMaxResults(10);
        List<User> usersPage = query.list();
        return usersPage;
    }
}
