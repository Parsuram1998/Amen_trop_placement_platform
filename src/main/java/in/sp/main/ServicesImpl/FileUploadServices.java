package in.sp.main.ServicesImpl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Configuration.FileUploadConfig;

@Service
public class FileUploadServices {

    @Autowired
    private FileUploadConfig fileUploadConfig;

    public String saveFile(MultipartFile file) throws IOException {

        if (file == null || file.isEmpty()) {
            return null;
        }

        String uploadDir = fileUploadConfig.getUploadDir();

        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
        File destination = new File(directory, fileName);

        file.transferTo(destination);

        return fileName;
    }
}