package com.Controller;

import com.bean.UserBean;
import com.service.UserService;
import com.util.ImageUploadUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Timestamp;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    private static final String UPLOAD_DIR = "uploads/profile/";

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new UserBean());
        return "user/register";
    }

    @PostMapping("/register")
    public String registerUser(
            @ModelAttribute("user") UserBean user,
            @RequestParam("profileImageFile") MultipartFile file,
            Model model) {

        if (file.isEmpty()) {
            model.addAttribute("error", "Profile image is required.");
            return "user/register";
        }

        if (userService.emailExists(user.getEmail())) {
            model.addAttribute("error", "Email already exists.");
            return "user/register";
        }

        try {
            String savedFileName = ImageUploadUtil.saveImage(UPLOAD_DIR, file);
            user.setProfileImage(savedFileName);
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            userService.saveUser(user);

            model.addAttribute("success", "Registered successfully! Please login.");
            return "user/login";

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "File upload failed.");
            return "user/register";
        }
    }
}
