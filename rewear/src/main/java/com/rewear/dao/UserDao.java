package com.rewear.dao;

import com.rewear.bean.UserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {

    @Autowired
    JdbcTemplate stmt;

    @Autowired
    PasswordEncoder passwordEncoder;

    // ✅ Register user
    public boolean addUser(UserBean user) {
        // Check if user already exists
        if (isEmailRegistered(user.getEmail())) {
            return false; // Email already exists
        }

        // Proceed with insertion
        String sql = "INSERT INTO users (name, email, password, gender, created_at) VALUES (?, ?, ?, ?, NOW())";
        stmt.update(sql, user.getName(), user.getEmail(),
                passwordEncoder.encode(user.getPassword()), user.getGender());
        return true;
    }


    // ✅ Get all users
    public List<UserBean> getAllUsers() {
        return stmt.query("SELECT * FROM users", new BeanPropertyRowMapper<>(UserBean.class));
    }

    // ✅ Login authentication
    public boolean authenticate(String email, String password) {
        try {
            UserBean user = getUserByEmail(email);
            return user != null && passwordEncoder.matches(password, user.getPassword());
        } catch (Exception e) {
            return false;
        }
    }

    // ✅ Get user by email
    public UserBean getUserByEmail(String email) {
        try {
            String sql = "SELECT * FROM users WHERE email = ?";
            return stmt.query(sql, new BeanPropertyRowMapper<>(UserBean.class), email)
                    .stream().findFirst().orElse(null);
        } catch (Exception e) {
            return null;
        }
    }

    // ✅ Check if email is already registered
    public boolean isEmailRegistered(String email) {
        return getUserByEmail(email) != null;
    }

    // ✅ Delete user by email
    public int deleteUserByEmail(String email) {
        String sql = "DELETE FROM users WHERE email = ?";
        return stmt.update(sql, email);
    }

    // ✅ Get role by email
    public String getRoleByEmail(String email) {
        try {
            String sql = "SELECT role FROM users WHERE email = ?";
            return stmt.queryForObject(sql, String.class, email);
        } catch (Exception e) {
            return "";
        }
    }

    // ✅ Get total user count
    public int getTotalUserCount() {
        String sql = "SELECT COUNT(*) FROM users";
        return stmt.queryForObject(sql, Integer.class);
    }
}
