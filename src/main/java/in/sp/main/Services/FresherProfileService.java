package in.sp.main.Services;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;

public interface FresherProfileService {

    void saveProfile(
            HttpSession session,
            String skillSet,
            String domainInterested,
            Double tenth,
            Double twelfth,
            Double degree,
            String preferredLocations,
            boolean readyForBond,
            MultipartFile resume,
            MultipartFile video,
            MultipartFile photo,
            MultipartFile aadhar
    );
}