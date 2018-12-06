package com.zufang.controller;

import com.zufang.pojo.User;
import com.zufang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

//    @RequiresRoles("admin")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getUserList(Model model){
        List<User> list = userService.getUserList();
        model.addAttribute("list",list);
        return "user-list";
    }
//    @RequiresRoles("productManager")
    @RequestMapping(value = "/{userId}/detail",method = RequestMethod.GET)
    public String getUserById(Model model,@PathVariable("userId") long userId){
        User user = userService.getUserById(userId);
        model.addAttribute("user",user);
        return "user-edit";
    }

    @RequestMapping(value = "/{userId}/edit",method = RequestMethod.POST)
    public String UpdateUserByUser(User user){
        userService.UpdateUserByUser(user);
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/{userId}/delete")
    public String deleteByUserId(@PathVariable("userId") long userId){
        int result = userService.deleteUserById(userId);

            return "redirect:/user/list";

    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addUser(User user){
        userService.InsertUser(user);
        return "redirect:/user/list";
    }



    @RequestMapping(value = "/add")
    public String addUserPage(){
        return "user-add";
    }



}

