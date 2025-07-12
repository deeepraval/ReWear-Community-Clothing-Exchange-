package com.util;

import java.io.IOException;
import java.nio.file.*;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtil {

    public static String saveImage(String uploadDir, MultipartFile imageFile) throws IOException {
        String filename = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();

        Path uploadPath = Paths.get(uploadDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(filename);
        Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        return filename;
    }
}
