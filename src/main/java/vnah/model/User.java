package vnah.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by dell on 11.11.16.
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private int age;
    @Column(name = "is_admin")
    private boolean admin;
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated_time = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public Date getUpdated_time() {
        return updated_time;
    }

    public void setUpdated_time(Date updated_time) {
        this.updated_time = updated_time;
    }

    @Override
    public String toString() {
        return String.format("id: %d  |  name: %s  |  age: %d  |  is_admin: %s  |  updated_time:  %s", id, name, age, admin, updated_time);
    }
}
