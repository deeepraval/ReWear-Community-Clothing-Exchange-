package com.dao;

import com.bean.UserBean;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<UserBean, Long> {
    boolean existsByEmail(String email);

    UserBean findByEmail(String email);
}
