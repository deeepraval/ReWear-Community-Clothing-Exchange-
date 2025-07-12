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
//@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    // Show registration form
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new UserBean());
        return ViewPaths.USER_REGISTER;  // maps to /WEB-INF/views/user/register.jsp
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

        // Check for duplicate email
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
            Model model,
            HttpSession session // add session to track login
    ) {
        boolean valid = userDao.authenticate(email, password);

        if (valid) {
            // Store user email (or ID) in session
            session.setAttribute("userEmail", email);
            return "redirect:/dashboard";
        } else {
            model.addAttribute("loginError", "Invalid email or password");
            return ViewPaths.USER_LOGIN;
        }
    }
    
    
    //dashboard
    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            return "redirect:/login";
        }

        model.addAttribute("userEmail", email); // can show in JSP
        return ViewPaths.USER_DASHBOARD;
    }

    

}
