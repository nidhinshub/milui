package com.aws.poc.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aws.poc.entity.User;
import com.aws.poc.model.AccountTransaction;
import com.aws.poc.service.TransationService;
import com.aws.poc.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;
    
	@Autowired
	private TransationService service;

    @RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error){
        ModelAndView modelAndView = new ModelAndView();
        if(error != null && error.equals("true")) {
        	 modelAndView.addObject("error", "Email or password is incorrect, try again or register first !");
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }


    @RequestMapping(value="/registration", method = RequestMethod.GET)
    public ModelAndView registration(){
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByEmail(user.getEmail());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
            modelAndView.addObject("fail", "User has already been registered, try again with other user");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        } else {
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully, Please login");
            modelAndView.addObject("user", user);
            modelAndView.setViewName("success");

        }
        return modelAndView;
    }

    @RequestMapping(value="/transaction", method = RequestMethod.GET)
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView();
        
        
        List<AccountTransaction> list =  service.getSevenDayTRansaction();
        
        modelAndView.addObject("transactionList", list);
        modelAndView.setViewName("transaction");
        return modelAndView;
    }
    @RequestMapping(value="/postTransaction", method = RequestMethod.GET)
    public ModelAndView postTransaction(){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        List<AccountTransaction> list =  service.get();
        
        modelAndView.addObject("transactionList", list);
        modelAndView.setViewName("postTransaction");
        return modelAndView;
    }


}
