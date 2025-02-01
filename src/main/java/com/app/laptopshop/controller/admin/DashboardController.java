package com.app.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.laptopshop.service.MiscService;

@Controller
public class DashboardController {

    private final MiscService miscService;

    public DashboardController(MiscService miscService) {
        this.miscService = miscService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", miscService.countUsers());
        model.addAttribute("countProducts", miscService.countProducts());
        model.addAttribute("countOrders", miscService.countOrders());
        return "admin/dashboard/show";
    }
}
