package in.sp.main.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NotificationController {

	
	@RequestMapping(value="/notify", method=RequestMethod.GET)
	@ResponseBody
	public String notifyUsers(){
	    return "New job posted!";
	}
}
