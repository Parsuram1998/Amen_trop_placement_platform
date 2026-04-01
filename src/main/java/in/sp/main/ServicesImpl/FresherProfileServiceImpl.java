package in.sp.main.ServicesImpl;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.User;
import in.sp.main.Enums.FresherStatus;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.FresherProfileService;
import jakarta.servlet.http.HttpSession;

@Service
public class FresherProfileServiceImpl implements FresherProfileService {

    @Autowired
    private FresherProfileRepository fresherProfileRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private FileUploadServices fileUploadServices;

    @Override
    public void saveProfile(HttpSession session,
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
                            MultipartFile aadhar) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            throw new RuntimeException("Session expired. Please login again.");
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Optional<FresherProfile> optionalProfile =
                fresherProfileRepository.findByUser(user);

        FresherProfile profile = optionalProfile.orElse(new FresherProfile());

        profile.setUser(user);
        profile.setSkillSet(skillSet);
        profile.setDomainInterested(domainInterested);
        profile.setTenthPercentage(tenth);
        profile.setTwelfthPercentage(twelfth);
        profile.setDegreePercentage(degree);
        profile.setPreferredLocations(preferredLocations);
        profile.setReadyForBond(readyForBond);
        profile.setStatus(FresherStatus.IN_PROGRESS);

        try {

            String resumeFile = fileUploadServices.saveFile(resume);
            if (resumeFile != null) {
                profile.setResumePath(resumeFile);
            }

            String videoFile = fileUploadServices.saveFile(video);
            if (videoFile != null) {
                profile.setVideoResumePath(videoFile);
            }

            String photoFile = fileUploadServices.saveFile(photo);
            if (photoFile != null) {
                profile.setPhotoPath(photoFile);
            }

            String aadharFile = fileUploadServices.saveFile(aadhar);
            if (aadharFile != null) {
                profile.setAadharPath(aadharFile);
            }

        } catch (IOException e) {
            throw new RuntimeException("File upload failed: " + e.getMessage());
        }

        fresherProfileRepository.save(profile);
    }
}