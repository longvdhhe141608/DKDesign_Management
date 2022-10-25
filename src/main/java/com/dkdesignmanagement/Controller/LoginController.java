package com.dkdesignmanagement.Controller;

import com.dkdesignmanagement.Respository.AccountDao;
import com.dkdesignmanagement.Service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.security.auth.login.AccountNotFoundException;


@Controller
public class LoginController {
    @Autowired
    AccountDao dao;

    @Autowired
    private IAccountService iAccountService;

    @RequestMapping("/Login")

    public ModelAndView Login() throws AccountNotFoundException {
        ModelAndView v = new ModelAndView("login");
        v.addObject("mess", iAccountService.getAllAccount());
        return v;
    }


}
