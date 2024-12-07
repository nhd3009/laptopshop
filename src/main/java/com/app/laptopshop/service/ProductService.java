package com.app.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.app.laptopshop.domain.Product;
import com.app.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public List<Product> fetchProducts() {
        return productRepository.findAll();
    }

    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    public Product fetchProductById(long id) {
        return productRepository.findById(id).get();
    }
}
