// COMMON LOGOUT CONTROLLER

package in.sp.main.Controllers;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        // DESTROY SESSION

        session.invalidate();

        // REDIRECT TO INDEX PAGE

        return "redirect:/";
    }

}