package in.sp.main.ServicesImpl;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import in.sp.main.Configuration.FileUploadConfig;
import in.sp.main.Entities.User;
import in.sp.main.Services.CertificateService;

@Service
public class CertificateServiceImpl implements CertificateService {

    @Autowired
    private FileUploadConfig fileUploadConfig;

    @Override
    public String generateCertificate(User user) {

        try {

            System.out.println("=== GENERATE CERTIFICATE START ===");

            String baseDir = fileUploadConfig.getUploadDir() + "/certificates/";
            System.out.println("Base Dir: " + baseDir);

            File folder = new File(baseDir);

            if (!folder.exists()) {
                boolean created = folder.mkdirs();
                System.out.println("Folder created: " + created);
            }

            String fileName = "certificate_" + user.getId() + ".pdf";
            String fullPath = baseDir + fileName;

            System.out.println("Full Path: " + fullPath);

            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, new FileOutputStream(fullPath));

            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 28, Font.BOLD);
            Font nameFont = new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD);
            Font contentFont = new Font(Font.FontFamily.HELVETICA, 14);

            Paragraph title = new Paragraph("INTERNSHIP CERTIFICATE", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);

            Paragraph space = new Paragraph("\n\n\n");

            Paragraph name = new Paragraph(user.getFullName(), nameFont);
            name.setAlignment(Element.ALIGN_CENTER);

            Paragraph content = new Paragraph(
                    "\nThis is to certify that " + user.getFullName() +
                    " has successfully completed the internship program.\n\n" +
                    "Date: " + java.time.LocalDate.now(),
                    contentFont);

            content.setAlignment(Element.ALIGN_CENTER);

            document.add(title);
            document.add(space);
            document.add(name);
            document.add(space);
            document.add(content);

            document.close();

            System.out.println("=== CERTIFICATE GENERATED SUCCESS ===");

            return "certificates/" + fileName;

        } catch (Exception e) {

            System.out.println("=== ERROR IN CERTIFICATE ===");
            e.printStackTrace();  // 🔥 IMPORTANT
            throw new RuntimeException("Certificate generation failed");
        }
    }
}