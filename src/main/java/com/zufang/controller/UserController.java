package com.zufang.controller;

import com.zufang.pojo.User;
import com.zufang.service.UserService;
import com.zufang.utils.PageVo;
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
    public String getUserList(Model model,Integer current){
        PageVo pageVo = new PageVo();
        //设置当前页,如过为null就设置为1
        if(current==null || current <=0){
            current=1;
            pageVo.setCurrent(current);
        }else{
            pageVo.setCurrent(current);
        }

        //根据总行计算总页
        int total = userService.countUser();
        if(total % pageVo.getPageSize()>0){
            pageVo.setPageCount(total/pageVo.getPageSize() + 1);
        }else{
            pageVo.setPageCount(total/pageVo.getPageSize());
        }

        //计算起始行配合limit多少行开始取多少个
        int startRow = (current-1)*pageVo.getPageSize();
        List<User> list = userService.getUserList(startRow,pageVo.getPageSize());

        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);

        return "user/userList";
    }
//    @RequiresRoles("productManager")
    @RequestMapping(value = "/{userId}/detail",method = RequestMethod.GET)
    public String getUserById(Model model,@PathVariable("userId") Integer userId){
        User user = userService.getUserById(userId);
        model.addAttribute("user",user);
        return "user/user-edit";
    }

    @RequestMapping(value = "/{userId}/edit",method = RequestMethod.POST)
    public String UpdateUserByUser(User user){
        userService.UpdateUserByUser(user);
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/{userId}/delete")
    public String deleteByUserId(@PathVariable("userId") Integer userId){
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
        return "user/user-add";
    }



}

