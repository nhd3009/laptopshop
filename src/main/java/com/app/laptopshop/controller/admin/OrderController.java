package com.app.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.laptopshop.domain.Order;
import com.app.laptopshop.service.OrderService;

@Controller("adminOrderController")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderDashboard(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {

        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<Order> orders = orderService.fetchAllOrders(pageable);
        List<Order> listOrders = orders.getContent();
        model.addAttribute("orders", listOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orders.getTotalPages());
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = orderService.fetchOrderById(id).get();

        model.addAttribute("order", order);
        model.addAttribute("id", id);
        model.addAttribute("orderDetails", order.getOrderDetails());

        return "admin/order/detail";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        Order deleteOrder = orderService.fetchOrderById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("deleteOrder", deleteOrder);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String handleDeleteOrder(@ModelAttribute("deleteOrder") Order order) {
        orderService.deleteOrderById(order.getId());
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order currentOrder = orderService.fetchOrderById(id).get();
        model.addAttribute("updateOrder", currentOrder);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String handleUpdateOrder(@ModelAttribute("updateOrder") Order order) {
        orderService.updateOrder(order);
        return "redirect:/admin/order";
    }
}
