package project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import project.entities.Order;
import project.entities.Product;
import project.entities.Status;
import project.entities.UserInfo;
import project.services.MainAppService;

import java.security.Principal;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@Transactional
public class AppController {

    private MainAppService mainAppService;

    @Autowired
    public void setDao(MainAppService mainAppService) {
        this.mainAppService = mainAppService;
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public ModelAndView enter() {
        List<Product> products;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        products = mainAppService.selectAllProducts();
        modelAndView.addObject("products", products);
        return modelAndView;
    }

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public String buy(@ModelAttribute("product") Product product, @ModelAttribute("quantityToBuy") Double quantityToBuy, Principal principal) {
        if(product.getQuantity()<quantityToBuy){
            return "redirect: index?error=true";
        }
        String title = product.getTitle();
        List<Order> orders = mainAppService.selectAllOrders();
        if(!(orders.stream().filter(e->e.getProduct().getTitle().equals(title)).collect(Collectors.toList()).isEmpty())){
            Order order= orders.stream().filter(e->e.getProduct().getTitle().equals(title)).collect(Collectors.toList()).get(0);
            order.setQuantity(order.getQuantity()+quantityToBuy);
            mainAppService.updateOrder(order);

        } else {
        Order newOrder = new Order();
        newOrder.setProduct(product);
        newOrder.setUserInfo(mainAppService.getUsersListByLogin(principal.getName()).get(0));
        newOrder.setQuantity(quantityToBuy);
        mainAppService.saveOrder(newOrder);
        }
        product.setQuantity((product.getQuantity() - quantityToBuy));
        mainAppService.update(product);
        return "redirect: index";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "registration", method = RequestMethod.GET)
    public String goRegistration() {
        return "registration";
    }

    @RequestMapping(value = "registration", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("userInfo") UserInfo userInfo, Status status) {
        if(!mainAppService.getUsersListByLogin(userInfo.getLogin()).isEmpty()){
            return "redirect: registration?error=true";
        }
        userInfo.setStatus(status);
        mainAppService.saveUser(userInfo);
        return "redirect: index";
    }

    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public ModelAndView goToBasket(Principal principal) {
        Set<Order> orders;
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("basket");
        String login = principal.getName();
        UserInfo userInfo = mainAppService.getUsersListByLogin(login).get(0);
        orders = userInfo.getOrders();
        int amount = orders.size();
        modelAndView.addObject("amount", amount);
        modelAndView.addObject("orders", orders);
        return modelAndView;
    }

    @RequestMapping(value = "deleteOrder", method = RequestMethod.POST)
    public String deleteUser(int id, Double quantityOfOrder) {
        Order order = mainAppService.getOrderById(id);
        Product product = mainAppService.getProductById(order.getProduct().getId());
        product.setQuantity(product.getQuantity() + quantityOfOrder);
        mainAppService.update(product);
        mainAppService.deleteOrder(order);
        return "redirect: basket";
    }

    @RequestMapping(value = "updateProduct/{id}", method = RequestMethod.GET)
    public ModelAndView updateProduct(@PathVariable("id") int id) {
        Product product = mainAppService.getProductById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("updateProduct");
        modelAndView.addObject("product", product);
        return modelAndView;
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("product") Product product) {
        mainAppService.update(product);
        return "redirect: index";
    }

    @RequestMapping(value = "addProduct", method = RequestMethod.GET)
    public String toAddProductPage() {
        return "addProduct";
    }

    @RequestMapping(value = "addProduct", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("product") Product product) {
        if(mainAppService.selectAllProducts().stream().filter(e->e.getTitle().equals(product.getTitle())).findAny().isPresent()){
            return "redirect: addProduct?error=true";
        }
        mainAppService.saveProduct(product);
        return "redirect: index";
    }
}
