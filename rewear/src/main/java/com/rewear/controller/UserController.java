package com.rewear.controller;

import com.rewear.bean.UserBean;
import com.rewear.util.ViewPaths;
import com.rewear.dao.UserDao;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    // Show registration form
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new UserBean());
        return ViewPaths.USER_REGISTER;
    }

    // Handle registration form submission
    @PostMapping("/register")
    public String handleRegister(
            @Valid @ModelAttribute("user") UserBean user,
            BindingResult result,
            Model model
    ) {
        if (result.hasErrors()) {
            model.addAttribute("errors", result);
            return ViewPaths.USER_REGISTER;
        }

        if (!userDao.addUser(user)) {
            model.addAttribute("emailExists", "Email already registered!");
            return ViewPaths.USER_REGISTER;
        }

        return "redirect:/login";
    }

    // Show login page
    @GetMapping("/login")
    public String showLoginPage(Model model) {
        model.addAttribute("loginError", "");
        return ViewPaths.USER_LOGIN;
    }

    // Handle login form
    @PostMapping("/login")
    public String handleLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model
    ) {
        boolean valid = userDao.authenticate(email, password);

        if (valid) {
            UserBean user = userDao.getUserByEmail(email);
            session.setAttribute("userId", user.getId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userEmail", email);
            return ViewPaths.USER_DASHBOARD;
        } else {
            model.addAttribute("loginError", "Invalid email or password");
            return ViewPaths.USER_LOGIN;
        }
    }

    // Show user dashboard
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            return "redirect:/login";
        }

        model.addAttribute("userEmail", email);
        return ViewPaths.USER_DASHBOARD;
    }
}
