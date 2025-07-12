package com.service;

import com.bean.UserBean;
import com.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public boolean emailExists(String email) {
        return userDao.existsByEmail(email);
    }

    public UserBean saveUser(UserBean user) {
        return userDao.save(user);
    }
}
