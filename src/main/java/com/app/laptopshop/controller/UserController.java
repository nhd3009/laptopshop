package com.app.laptopshop.controller;

import com.app.laptopshop.domain.User;
import com.app.laptopshop.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUsers();
        System.out.println(listUser);
        return "Index";
    }

    // Show List User
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    // Show create User page
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Handle creating user
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String handleCreateUser(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("Run here " + user);
        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Handle and Get User Detail page
    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // Get Update user page
    @RequestMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User currUser = this.userService.getUserById(id);
        model.addAttribute("updateUser", currUser);
        return "admin/user/update";
    }

    // Handle Update User
    @PostMapping("/admin/user/update")
    public String handleUpdateUser(Model model, @ModelAttribute("updateUser") User user) {
        User updateUser = this.userService.getUserById(user.getId());
        if (updateUser != null) {
            updateUser.setAddress(user.getAddress());
            updateUser.setFullName(user.getFullName());
            updateUser.setPhone(user.getPhone());
            this.userService.handleSaveUser(updateUser);
        }
        return "redirect:/admin/user";
    }

    // Get Delete user page
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User deleteUser = this.userService.getUserById(id);

        model.addAttribute("id", id);
        model.addAttribute("deleteUser", deleteUser);
        return "admin/user/delete";
    }

    // Handle Delete user
    @PostMapping("/admin/user/delete")
    public String handleDeleteUserPage(Model model, @ModelAttribute("deleteUser") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
