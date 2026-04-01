package in.sp.main.Services;

import in.sp.main.Entities.User;
import in.sp.main.dto.LoginRequest;
import in.sp.main.dto.RegisterRequest;

public interface AuthService {

    User register(RegisterRequest request);

    User login(LoginRequest request);
}
