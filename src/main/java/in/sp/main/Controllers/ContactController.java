package in.sp.main.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.ContactRequest;
import in.sp.main.Repositories.ContactRepository;

@Controller
public class ContactController {

	@Autowired
	private ContactRepository contactRepository;
	
	@RequestMapping(value="/contact", method=RequestMethod.GET)
	public String contactPage(){
	    return "contact";
	}

	@RequestMapping(value="/contact", method=RequestMethod.POST)
	public String submit(@RequestParam String name,
	                     @RequestParam String email,
	                     @RequestParam String phone,
	                     @RequestParam String type,
	                     @RequestParam String message){

	    ContactRequest c = new ContactRequest();

	    c.setName(name);
	    c.setEmail(email);
	    c.setPhone(phone);
	    c.setType(type);
	    c.setMessage(message);

	    contactRepository.save(c);

	    return "redirect:/contact?success=true";
	}
}
