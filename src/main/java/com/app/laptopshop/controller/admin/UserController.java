package com.app.laptopshop.controller.admin;

import com.app.laptopshop.domain.User;
import com.app.laptopshop.service.UploadService;
import com.app.laptopshop.service.UserService;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;

    private final UploadService uploadService;

    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Show List User
    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    // Show create User page
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Handle creating user
    @PostMapping(value = "/admin/user/create")
    public String handleCreateUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("avatarFile") MultipartFile file) {

        String avatar = uploadService.handleUploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(userService.getRoleByName(user.getRole().getName()));

        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Handle and Get User Detail page
    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // Get Update user page
    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User currUser = this.userService.getUserById(id);
        model.addAttribute("updateUser", currUser);
        return "admin/user/update";
    }

    // Handle Update User
    @PostMapping("/admin/user/update")
    public String handleUpdateUser(Model model, @ModelAttribute("updateUser") User user,
            @RequestParam("avatarFile") MultipartFile file) {
        User updateUser = this.userService.getUserById(user.getId());
        if (updateUser != null) {
            updateUser.setAddress(user.getAddress());
            updateUser.setFullName(user.getFullName());
            updateUser.setPhone(user.getPhone());
            updateUser.setRole(userService.getRoleByName(user.getRole().getName()));
            if (file != null && !file.isEmpty()) {
                String oldAvatarPath = updateUser.getAvatar();

                updateUser.setAvatar(uploadService.handleUploadFile(file, "avatar"));

                if (oldAvatarPath != null && !oldAvatarPath.isEmpty()) {
                    uploadService.deleteFile(oldAvatarPath);
                }
            }

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
