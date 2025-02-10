package com.app.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.laptopshop.domain.Product;
import com.app.laptopshop.domain.Product_;
import com.app.laptopshop.domain.DTO.ProductCriteriaDTO;
import com.app.laptopshop.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller("clientProductController")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String getAllProductsPage(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {

            }
        } catch (Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 24);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("increasing")) {
                pageable = PageRequest.of(page - 1, 24, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("decreasing")) {
                pageable = PageRequest.of(page - 1, 24, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> products = productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> listProducts = products.getContent().size() > 0 ? products.getContent()
                : new ArrayList<Product>();

        String query = request.getQueryString();
        if (query != null && !query.isBlank()) {
            query = query.replace("page=" + page, "");
        }
        model.addAttribute("products", listProducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("queryString", query);
        return "client/product/show";
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = productService.fetchProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

}
