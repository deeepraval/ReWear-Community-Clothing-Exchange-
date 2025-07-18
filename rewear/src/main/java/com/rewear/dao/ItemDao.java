package com.rewear.dao;

import com.rewear.bean.ItemBean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
    
    public List<ItemBean> getItemsByUserId(Long userId) {
        String sql = "SELECT * FROM items WHERE user_id = ? ORDER BY created_at DESC";
        return stmt.query(sql, new BeanPropertyRowMapper<>(ItemBean.class), userId);
    }
    
    public ItemBean getItemById(Long id) {
        String sql = "SELECT * FROM items WHERE id = ?";
        try {
            return stmt.queryForObject(sql, new BeanPropertyRowMapper<>(ItemBean.class), id);
        } catch (Exception e) {
            return null;
        }
    }
    
    public void updateItem(ItemBean item) {
        String sql = "UPDATE items SET name=?, description=?, category=?, size=?, `condition`=?, image=? WHERE id=?";
        stmt.update(sql, item.getName(), item.getDescription(), item.getCategory(),
                item.getSize(), item.getCondition(), item.getImage(), item.getId());
    }
    
    public void deleteItem(long itemId) {
        String sql = "DELETE FROM items WHERE id = ?";
        stmt.update(sql, itemId);
    }

    public List<ItemBean> getAvailableItemsForSwap(Long excludeUserId) {
        String sql = "SELECT * FROM items WHERE user_id != ?";
        return stmt.query(sql, new BeanPropertyRowMapper<>(ItemBean.class), excludeUserId);
    }

}
