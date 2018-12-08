package com.zufang.controller;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 根据用户角色，跳转到不同的页面
 */
@Controller
@RequestMapping("")
public class LoginController {
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Model model, String name, String password) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(name, password);
        try {  
            subject.login(token);
            Session session=subject.getSession();
            session.setAttribute("subject", subject);

            if (subject.hasRole("admin")) {
                return "redirect:/user/list";
            } else if (subject.hasRole("productManager")) {

                return "redirect:/house/list";
            }
            return "/login";
            
        } catch (AuthenticationException e) {
            model.addAttribute("error", "验证失败");  
            return "login";
        }  
	}

    //登录跳转
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "login";
    }

    @RequestMapping("unauthorized")
    public String noPerms(){
        return "unauthorized";
    }
	


}
