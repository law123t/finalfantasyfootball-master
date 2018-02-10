package matc.madjava.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "user_id")
    private int userId;
    @Column(name = "user_name")
    private String userName;
    @Column(name = "user_pass")
    private String userPass;


    /**
     * Instantiates a new User.
     */
    public User() {
    }

    /**
     * Instantiates a new User.
     *
     * @param userId   the user id
     * @param userName the user name
     * @param userPass the user password
     */
    public User(int userId, String userName, String userPass) {
        this.userId = userId;
        this.userName = userName;
        this.userPass = userPass;

    }

    /**
     * Gets user name.
     *
     * @return the user name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets user name.
     *
     * @param userName the user name
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets user pass.
     *
     * @return the user pass
     */
    public String getUserPass() {
        return userPass;
    }

    /**
     * Sets user pass.
     *
     * @param userPass the user pass
     */
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    /**
     * Gets user id.
     *
     * @return the user id
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "User")
    public int getUserId() {
        return userId;
    }

    /**
     * Sets user id.
     *
     * @param userId the user id
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }


    @Override
    public String toString() {
        return "User{" +
                "userName ='" + userName + '\'' +
                ", userPass ='" + userPass + '\'' +
                '}';
    }
}