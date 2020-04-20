package com.niit.controller;

import java.security.Principal;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.User;
import com.niit.others.Email;
import com.niit.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController
{
	User u;
	
	@Autowired
	UserService userService;
	
   @RequestMapping("/register")
  public String register(ModelMap map)
  {
	  map.addAttribute("user",new User());
	  return "register";
  }
   
   @RequestMapping(value = {"/register"},method = RequestMethod.POST)
  public String registerUser(@ModelAttribute("user") User u)
  {
	userService.addUser(u);
	return "redirect:/user/login";
  }
   
  @RequestMapping("/login") 
  public String login()
  {
	  return "login";
  }
  
  @RequestMapping("/enterusername")
  public String username()
  {
	  return "enterusername";
  }
  
  @RequestMapping("/forgot")
  public String forgot(@RequestParam("username") String username,ModelMap map)
  {
	  u=userService.displayByUsername(username);
	  Random r=new Random(); 
	  int random=r.nextInt(8999)+1000;
	  Email email=new Email(u.getEmail(),"Password Reset","OTP: "+random);
	  email.sendEmail();
	  map.addAttribute("otp",random);
	  return "conformotp";
  }
  
  @RequestMapping("/conformotp")
  public String conformotp(@RequestParam("userotp") int userotp,@RequestParam("otp") int otp)
  {
	  if(userotp==otp)
	  {
		   return "resetpassword";
	  }
	  else
	  {
		  return "conformotp";
	  }
  }
  
  @RequestMapping("/updatepassword")
  public String updatepassword(@RequestParam("pass") String pass,@RequestParam("cpass") String cpass) 
  {
	  if(pass.equals(cpass))
	  {
		  pass=new BCryptPasswordEncoder().encode(pass);
		  u.setPassword(pass);
		  userService.updateUser(u);
		  return "redirect:/user/login";
	  }
	  else
	  {
		  return "resetpassword";
	  }
  }
  
  @RequestMapping("/profile")
  public String profile(Principal principal,ModelMap map)
  {
	  String name=principal.getName();
	  User user=userService.displayByUsername(name);
	  map.addAttribute("user",user);
	  return "profile";
  }
}
