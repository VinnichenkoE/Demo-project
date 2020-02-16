package project.dao;

import project.entities.Order;
import project.entities.Product;
import project.entities.UserInfo;

import java.util.List;

public interface Dao {
    void saveUser(UserInfo user);
    List<UserInfo> getUsersListByLogin(String login);
    UserInfo getUserById(int id);
    List<Product> selectAllProducts();
    void update(Product product);
    void saveOrder(Order order);
    Order getOrderById(int id);
    void deleteOrder(Order order);
    Product getProductById(int id);
    void saveProduct(Product product);
    List<Order> selectAllOrders();
    void updateOrder(Order order);
}
