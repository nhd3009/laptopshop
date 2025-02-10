package com.app.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.app.laptopshop.domain.Product;
import com.app.laptopshop.domain.DTO.ProductCriteriaDTO;
import com.app.laptopshop.repository.ProductRepository;
import com.app.laptopshop.specs.ProductSpecs;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    // fetch by Name
    public Page<Product> fetchProductsWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combinedSpecs = Specification.where(null);
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpecs = combinedSpecs.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpecs = combinedSpecs.and(currentSpecs);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpecs = combinedSpecs.and(currentSpecs);
        }
        return productRepository.findAll(combinedSpecs, pageable);
    }

    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;

            switch (p) {
                case "under-500":
                    min = 1;
                    max = 500;
                    break;
                case "500-700":
                    min = 500;
                    max = 700;
                    break;
                case "700-1000":
                    min = 700;
                    max = 1000;
                    break;
                case "over-1000":
                    min = 1000;
                    max = Integer.MAX_VALUE;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpecs = ProductSpecs.matchMultiplePrice(min,
                        max);
                combinedSpec = combinedSpec.or(rangeSpecs);
            }
        }
        return combinedSpec;
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
