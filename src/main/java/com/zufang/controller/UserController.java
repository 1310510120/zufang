package com.zufang.controller;

import com.zufang.pojo.User;
import com.zufang.service.PictureService;
import com.zufang.service.UserService;
import com.zufang.utils.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户列表，@RequiresRoles("admin")代表只有管理员角色才能进入
     * @param model
     * @param current
     * @return
     */
//    @RequiresRoles("admin")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getUserList(Model model,Integer current){
        //根据当前页码和总行数，可以得出总页数，起始行
        int total = userService.countUser();
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        List<User> list = userService.getUserList(pageVo.getStartRow(),pageVo.getPageSize());

        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);

        return "user/userList";
    }

    /**
     * 点击编辑返回用户编辑页面
     * @param model
     * @param userId
     * @return
     */
//    @RequiresRoles("productManager")
    @RequestMapping(value = "/{userId}/edit",method = RequestMethod.GET)
    public String getUserById(Model model,@PathVariable("userId") Integer userId){
        User user = userService.getUserById(userId);
        model.addAttribute("user",user);
        return "user/user-edit";
    }

    /**
     * 更新用户表
     * @param user
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String UpdateUserByUser(User user){
        userService.UpdateUserByUser(user);
        return "redirect:/user/list";
    }

    /**
     * 删除用户id
     * @param userId
     * @return
     */
    @RequestMapping(value = "/{userId}/delete")
    public String deleteByUserId(@PathVariable("userId") Integer userId){
        int result = userService.deleteUserById(userId);

            return "redirect:/user/list";

    }
    /**
     * 增加用户
     * @param user
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String addUser(User user){
        int count = userService.InsertUser(user);
        return "redirect:/user/list";

    }

    /**
     * 跳转到增加用户页面
     * @return
     */
    @RequestMapping(value = "/add")
    public String addUserPage(){
        return "user/user-add";
    }



}

