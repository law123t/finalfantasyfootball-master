package matc.madjava.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * The type User role.
 */
@Entity
@Table(name = "user_roles")
public class UserRoles {

    private int userRoleId;
    private String userName;
    private String roleName;

    /**
     * Instantiates a new User role.
     */
    public UserRoles() {

    }

    /**
     * Instantiates a new User role.
     *
     * @param userRoleId   the role id
     * @param userName the user name
     * @param roleName the role name
     */
    public UserRoles(int userRoleId, String userName, String roleName) {
        this.userRoleId = userRoleId;
        this.userName = userName;
        this.roleName = roleName;

    }

    /**
     * Gets role id.
     *
     * @return the role id
     */
    @Id
    @GeneratedValue(generator="increment")
    @GenericGenerator(name="increment", strategy = "increment")
    @Column (name="userrole_id")
    public int getUserRoleId() {
        return userRoleId;
    }

    /**
     * Sets role id.
     *
     * @param userRoleId the role id
     */
    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    /**
     * Gets user name.
     *
     * @return the user name
     */
    @Basic
    @Column(name = "user_name")
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
     * Gets role name.
     *
     * @return the role name
     */
    @Basic
    @Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    /**
     * Sets role name.
     *
     * @param roleName the role name
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }







    @Override
    public String toString() {
        return "User{" +
                "userName ='" + userName + '\'' +
                ", roleName ='" + roleName + '\'' +
                '}';
    }
}
