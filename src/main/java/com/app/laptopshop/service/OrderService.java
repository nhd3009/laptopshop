package com.app.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.app.laptopshop.domain.Cart;
import com.app.laptopshop.domain.CartDetail;
import com.app.laptopshop.domain.Order;
import com.app.laptopshop.domain.OrderDetail;
import com.app.laptopshop.domain.User;
import com.app.laptopshop.repository.CartDetailRepository;
import com.app.laptopshop.repository.CartRepository;
import com.app.laptopshop.repository.OrderDetailRepository;
import com.app.laptopshop.repository.OrderRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository,
            CartRepository cartRepository, CartDetailRepository cartDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public List<Order> fetchAllOrders() {
        return orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id) {
        return orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order curOrder = orderOptional.get();
            curOrder.setStatus(order.getStatus());
            orderRepository.save(curOrder);
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String recipientName, String recipientAddress,
            String recipientPhone) {

        Cart cart = cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                Order order = new Order();
                order.setUser(user);
                order.setRecipientName(recipientName);
                order.setRecipientAddress(recipientAddress);
                order.setRecipientPhone(recipientPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cartDetail : cartDetails) {
                    sum += cartDetail.getPrice() * cartDetail.getQuantity();
                }
                order.setTotalPrice(sum);

                order = orderRepository.save(order);

                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProduct());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetail.setQuantity(cartDetail.getQuantity());

                    orderDetailRepository.save(orderDetail);
                }

                for (CartDetail cartDetail : cartDetails) {
                    cartDetailRepository.deleteById(cartDetail.getId());
                }

                cartRepository.deleteById(cart.getId());

                session.setAttribute("sum", 0);
            }
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

}
