package com.rewear.controller;

import com.rewear.bean.ItemBean;
import com.rewear.util.ViewPaths;
import com.rewear.dao.ItemDao;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

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

    @GetMapping("/item/list")
    public String showItems(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        List<ItemBean> items = itemDao.getItemsByUserId(userId);
        model.addAttribute("items", items);
        return ViewPaths.ITEM_LIST;
    }

    @GetMapping("/item/{id}")
    public String viewItem(@PathVariable("id") Long itemId, Model model) {
        ItemBean item = itemDao.getItemById(itemId);
        if (item == null) {
            return ViewPaths.ERROR_404;
        }
        model.addAttribute("item", item);
        return ViewPaths.ITEM_DETAIL; // item/itemDetail.jsp
    }
    
    @GetMapping("/item/edit")
    public String editItem(@RequestParam("id") long id, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        ItemBean item = itemDao.getItemById(id);

        if (item == null || !item.getUserId().equals(userId)) {
            return "redirect:/item/list";
        }

        model.addAttribute("item", item);
        return ViewPaths.ITEM_EDIT;
    }

    @PostMapping("/item/edit")
    public String updateItem(
            @ModelAttribute ItemBean item,
            @RequestParam("imageFile") MultipartFile imageFile,
            HttpSession session
    ) throws IOException {
        Long userId = (Long) session.getAttribute("userId");

        ItemBean oldItem = itemDao.getItemById(item.getId());
        item.setUserId(userId);

        if (!imageFile.isEmpty()) {
            String newImage = ImageUploadUtil.replaceImage(imageFile, oldItem.getImage());
            item.setImage(newImage);
        } else {
            item.setImage(oldItem.getImage()); // keep old image
        }

        itemDao.updateItem(item);
        return "redirect:/item/list";
    }
    
    @GetMapping("/item/delete")
    public String deleteItem(@RequestParam("id") long itemId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        
        ItemBean item = itemDao.getItemById(itemId);
        
        if (item != null && item.getUserId().equals(userId)) {
        	ImageUploadUtil.deleteImage(item.getImage()); // Optional
            itemDao.deleteItem(itemId);
        }

        return "redirect:/item/list";
    }




}
