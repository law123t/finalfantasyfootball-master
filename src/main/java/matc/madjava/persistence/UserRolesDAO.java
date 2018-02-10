package matc.madjava.persistence;

import matc.madjava.entity.UserRoles;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.List;

public class UserRolesDAO {

    private final Logger log = Logger.getLogger(this.getClass());

    public List<UserRoles> getAllUserRoles() {
        List<UserRoles> userRoles = new ArrayList<UserRoles>();
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            userRoles = session.createCriteria(UserRoles.class).list();
        } catch (HibernateException he) {
            log.error("Error getting all user roles", he);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return userRoles;
    }

    public UserRoles getUserRoleByID(int userRoleID) {
        UserRoles user = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            user = (UserRoles) session.get(UserRoles.class, userRoleID);
        } catch (HibernateException he) {
            log.error("Error getting user role with id: " + userRoleID, he);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return user;
    }

    public List<UserRoles> getByRoleName(String roleName) {
        List<UserRoles> userRoles = new ArrayList<UserRoles>();
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            Criteria criteria = session.createCriteria(UserRoles.class);
            criteria.add(Restrictions.eq("userName", roleName));
            userRoles = criteria.list();
        } catch (HibernateException he) {
            log.error("Couldn't find role name " + roleName, he);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return userRoles;
    }

    public void updateUserRoles(UserRoles userRoles) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = SessionFactoryProvider.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(userRoles);
            transaction.commit();
        } catch (HibernateException he){
            if (transaction != null) {
                try {
                    transaction.rollback();
                } catch (HibernateException he2) {
                    log.error("Error rolling back save of user role: " + userRoles, he2);
                }
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public void deleteUserRolesByID(int id) {
        Transaction transaction = null;
        Session session = null;
        UserRoles userRoles = null;
        try {

            session = SessionFactoryProvider.getSessionFactory().openSession();
            userRoles = (UserRoles) session.get(UserRoles.class, id);
            transaction = session.beginTransaction();
            session.delete(userRoles);
            transaction.commit();
        } catch (HibernateException he){
            if (transaction != null) {
                try {
                    transaction.rollback();
                } catch (HibernateException he2) {
                    log.error("Error rolling back save of user roles: " + userRoles, he2);
                }
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public UserRoles insertUserRoles(UserRoles userRoles) {
        Session session = SessionFactoryProvider.getSessionFactory().openSession();
        Transaction transaction = null;
        try{
            transaction = session.beginTransaction();
            userRoles = new UserRoles( userRoles.getUserRoleId(), userRoles.getUserName(), userRoles.getRoleName());
            session.save(userRoles);
            transaction.commit();
        }catch (HibernateException e) {
            if (transaction!=null) transaction.rollback();
            log.error("error adding user role", e);
        }finally {
            session.close();
        }
        return userRoles;
    }
}
