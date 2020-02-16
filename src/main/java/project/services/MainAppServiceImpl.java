package project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import project.dao.Dao;
import project.entities.Order;
import project.entities.Product;
import project.entities.UserInfo;

import java.util.List;

@Service
public class MainAppServiceImpl implements MainAppService {

    private Dao dao;

    @Autowired
    public void setDao(Dao dao) {
        this.dao = dao;
    }


    @Override
    @Transactional
    public void saveUser(UserInfo user) {
        dao.saveUser(user);
    }

    @Override
    @Transactional
    public List<UserInfo> getUsersListByLogin(String login) {
        return dao.getUsersListByLogin(login);
    }

    @Override
    @Transactional
    public UserInfo getUserById(int id) {
        return dao.getUserById(id);
    }

    @Override
    @Transactional
    public List<Product> selectAllProducts() {
        return dao.selectAllProducts();
    }

    @Override
    @Transactional
    public void update(Product product) {
        dao.update(product);
    }

    @Override
    @Transactional
    public void saveOrder(Order order) {
        dao.saveOrder(order);
    }

    @Override
    @Transactional
    public Order getOrderById(int id) {
        return dao.getOrderById(id);
    }

    @Override
    @Transactional
    public void deleteOrder(Order order) {
        dao.deleteOrder(order);
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        return dao.getProductById(id);
    }

    @Override
    @Transactional
    public void saveProduct(Product product) {
        dao.saveProduct(product);
    }

    @Override
    @Transactional
    public List<Order> selectAllOrders() {
        return dao.selectAllOrders();
    }

    @Override
    public void updateOrder(Order order) {
        dao.updateOrder(order);
    }

}
