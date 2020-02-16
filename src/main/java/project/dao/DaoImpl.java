package project.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.entities.Order;
import project.entities.Product;
import project.entities.UserInfo;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Repository
public class DaoImpl implements Dao{
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void saveUser(UserInfo user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    public List<UserInfo> getUsersListByLogin(String login) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from UserInfo where login = :login");
        query.setParameter("login", login);
        return query.list();
    }

    public UserInfo getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        UserInfo user = session.find(UserInfo.class, id);
        return user;
    }

    public List<Product> selectAllProducts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Product", Product.class).list();
    }
    public void update(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.update(product);
    }
    public void saveOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.save(order);
    }
    public Order getOrderById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Order order = session.find(Order.class, id);
        return order;
    }
    public void deleteOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(order);
    }
    public Product getProductById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = session.find(Product.class, id);
        return product;
    }
    public void saveProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.save(product);
    }
    public List<Order> selectAllOrders() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Order", Order.class).list();
    }

    @Override
    public void updateOrder(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.update(order);
    }
}
