package com.rewear.dao;

import com.rewear.bean.ItemBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {

    @Autowired
    JdbcTemplate stmt;

    public void addItem(ItemBean item) {
        String sql = "INSERT INTO items (user_id, name, description, category, size, `condition`, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt.update(sql, item.getUserId(), item.getName(), item.getDescription(),
                item.getCategory(), item.getSize(), item.getCondition(), item.getImage());
    }
}
