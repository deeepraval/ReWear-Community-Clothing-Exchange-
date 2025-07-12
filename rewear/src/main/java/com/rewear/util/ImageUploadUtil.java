package com.rewear.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

public class ImageUploadUtil {

    private static final String[] allowedExtensions = {"jpg", "jpeg", "png", "webp"};

    public static String saveImage(MultipartFile file) throws IOException {
        String originalName = file.getOriginalFilename();

        if (originalName == null || originalName.isEmpty()) {
            throw new IllegalArgumentException("Image file name is empty.");
        }

        // Check extension
        String extension = originalName.substring(originalName.lastIndexOf('.') + 1).toLowerCase();
        boolean allowed = Arrays.stream(allowedExtensions).anyMatch(ext -> ext.equals(extension));

        if (!allowed) {
            throw new IllegalArgumentException("Only JPG, PNG, or WEBP files are allowed.");
        }

        // Generate unique filename
        String uniqueFileName = UUID.randomUUID() + "." + extension;

        // ✅ Runtime-safe absolute path (inside project folder)
        String uploadDir = new File("uploads").getAbsolutePath();
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        File saveFile = new File(dir, uniqueFileName);
        file.transferTo(saveFile);

        return uniqueFileName;
    }
}
