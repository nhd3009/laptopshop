package com.app.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.laptopshop.domain.Cart;
import com.app.laptopshop.domain.CartDetail;
import com.app.laptopshop.domain.Order;
import com.app.laptopshop.domain.User;
import com.app.laptopshop.service.CartService;
import com.app.laptopshop.service.OrderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller("clientOrderController")
public class OrderController {

    private final CartService cartService;
    private final OrderService orderService;

    public OrderController(CartService cartService, OrderService orderService) {
        this.cartService = cartService;
        this.orderService = orderService;
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = cartService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/order/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String handleCheckoutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        cartService.handleCartBeforeCheckOut(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request, @RequestParam("recipientName") String recipientName,
            @RequestParam("recipientAddress") String recipientAddress,
            @RequestParam("recipientPhone") String recipientPhone) {
        HttpSession session = request.getSession(false);
        User currentUser = new User();
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        orderService.handlePlaceOrder(currentUser, session, recipientName, recipientAddress, recipientPhone);

        return "redirect:thank-you";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        List<Order> orders = orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);

        return "client/order/order-history";
    }

    @GetMapping("/thank-you")
    public String getThanksPage(Model model) {
        return "client/order/thanks";
    }
}
