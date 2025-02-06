package com.app.laptopshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public Page<Product> fetchProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    public Product fetchProductById(long id) {
        return productRepository.findById(id).get();
    }

}
