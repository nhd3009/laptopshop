package com.app.laptopshop.service;

import org.springframework.stereotype.Service;

import com.app.laptopshop.repository.OrderRepository;
import com.app.laptopshop.repository.ProductRepository;
import com.app.laptopshop.repository.UserRepository;

@Service
public class MiscService {

    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;

    public MiscService(UserRepository userRepository, OrderRepository orderRepository,
            ProductRepository productRepository) {
        this.userRepository = userRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

}
