package in.sp.main.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {

    	 return "redirect:/index.html";
    }
    @GetMapping("/session-expired")
    public String sessionExpired() {

    	 return "redirect:/index.html";
    }

}