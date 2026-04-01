package in.sp.main.ServicesImpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.User;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.AuthService;
import in.sp.main.dto.LoginRequest;
import in.sp.main.dto.RegisterRequest;
import jakarta.transaction.Transactional;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public User register(RegisterRequest request) {

        System.out.println("Role received: " + request.getRole());

        if (request.getRole() == null) {
            throw new RuntimeException("Role is missing");
        }

        // Email duplicate check
        if (request.getEmail() != null &&
                userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new RuntimeException("Email already registered. Please login.");
        }

        // Phone duplicate check
        if (request.getPhone() != null &&
                userRepository.findByPhone(request.getPhone()).isPresent()) {
            throw new RuntimeException("Phone already registered. Please login.");
        }

        User user = new User();

        user.setFullName(request.getFullName());
        user.setEmail(request.getEmail());
        user.setPhone(request.getPhone());
        user.setPassword(request.getPassword());
        user.setRole(request.getRole());
        user.setActive(true);

        return userRepository.save(user);
    }

    @Override
    public User login(LoginRequest request) {

        Optional<User> userOptional =
                userRepository.findByEmail(request.getEmailOrPhone());

        if (userOptional.isEmpty()) {
            userOptional = userRepository.findByPhone(request.getEmailOrPhone());
        }

        if (userOptional.isEmpty()) {
            throw new RuntimeException("User not found");
        }

        User user = userOptional.get();

        if (!user.getPassword().equals(request.getPassword())) {
            throw new RuntimeException("Invalid credentials");
        }

        return user;
    }
}