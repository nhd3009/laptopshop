package com.app.laptopshop.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class UserController {

    @GetMapping("/")
    public String getHomePage() {
        return "Hello from Controller";
    }

}
