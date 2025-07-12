package com.rewear.controller;

import com.rewear.bean.ItemBean;
import com.rewear.util.ViewPaths;
import com.rewear.dao.ItemDao;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.rewear.util.ImageUploadUtil;

@Controller
public class ItemController {

    @Autowired
    ItemDao itemDao;

    @GetMapping("/item/add")
    public String showAddItemForm(Model model) {
        model.addAttribute("item", new ItemBean());
        return ViewPaths.ITEM_ADD;
    }

    @PostMapping("/item/add")
    public String saveItem(
            @ModelAttribute("item") ItemBean item,
            @RequestParam("imageFile") MultipartFile imageFile,
            HttpSession session,
            Model model
    ) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        try {
            String savedFileName = ImageUploadUtil.saveImage(imageFile);
            item.setImage(savedFileName);
        } catch (Exception e) {
            model.addAttribute("error", "Upload failed: " + e.getMessage());
            return "item/addItem";
        }

        item.setUserId(userId);
        itemDao.addItem(item);
        return "redirect:/dashboard";
    }



}
