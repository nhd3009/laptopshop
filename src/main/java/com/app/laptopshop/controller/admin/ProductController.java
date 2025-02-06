package com.app.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.app.laptopshop.domain.Product;
import com.app.laptopshop.service.ProductService;
import com.app.laptopshop.service.UploadService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller("adminProductController")
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    // Get List Product
    @GetMapping("/admin/product")
    public String getDashboard(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {

        }

        Pageable pageable = PageRequest.of(page - 1, 2);

        Page<Product> products = productService.fetchProducts(pageable);

        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/product/show";
    }

    // Get Create product Page
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // Handle create Product
    @PostMapping("/admin/product/create")
    public String handleCreateProduct(@ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult, @RequestParam("avatarFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String image = uploadService.handleUploadFile(file, "product");
        product.setImage(image);

        // Create Product
        productService.saveProduct(product);

        return "redirect:/admin/product";
    }

    // Get update Product Page
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currProduct = productService.fetchProductById(id);
        model.addAttribute("currProduct", currProduct);
        return "/admin/product/update";
    }

    // Handle update Product
    @PostMapping("/admin/product/update")
    public String handleUpdateProduct(@ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult, @RequestParam("avatarFile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product currProduct = productService.fetchProductById(product.getId());
        if (file != null && !file.isEmpty()) {
            String oldImagePath = currProduct.getImage();

            currProduct.setImage(uploadService.handleUploadFile(file, "product"));

            if (oldImagePath != null && !oldImagePath.isEmpty()) {
                uploadService.deleteFile(oldImagePath, "product");
            }

            currProduct.setName(product.getName());
            currProduct.setPrice(product.getPrice());
            currProduct.setQuantity(product.getQuantity());
            currProduct.setDetailDesc(product.getDetailDesc());
            currProduct.setShortDesc(product.getShortDesc());
            currProduct.setFactory(product.getFactory());
            currProduct.setTarget(product.getTarget());

            productService.saveProduct(currProduct);
        }

        return "redirect:/admin/product";
    }

    // gEt Detail Product Page
    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = productService.fetchProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    // Get Delete Product Page
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product deleteProduct = productService.fetchProductById(id);
        model.addAttribute("id", id);
        model.addAttribute("deleteProduct", deleteProduct);
        return "admin/product/delete";
    }

    // Handle Delete Product
    @PostMapping("/admin/product/delete")
    public String handleDeleteProduct(Model model, @ModelAttribute("deleteProduct") Product product) {
        Product deleteProduct = productService.fetchProductById(product.getId());
        String oldImagePath = deleteProduct.getImage();
        if (oldImagePath != null && !oldImagePath.isEmpty()) {
            uploadService.deleteFile(oldImagePath, "product");
        }
        productService.deleteProduct(product.getId());
        return "redirect:/admin/product";
    }

}
