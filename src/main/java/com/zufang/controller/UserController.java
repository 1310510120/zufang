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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

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
    public String addUser(HttpServletRequest request) throws IOException {
        //把带二进制表单数据的request对象交给spring转换 得到一个文件和普通数据分开的新request对象
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        // 获取from表单参数
        String nickname = multipartRequest.getParameter("nickname");
        String password = multipartRequest.getParameter("password");
        String email = multipartRequest.getParameter("email");
        String phone_number = multipartRequest.getParameter("phone_number");

        //获得Request中的图片 photo 是from表单文件的name
        MultipartFile file = (MultipartFile) multipartRequest.getFile("portrait");
        //存储图片的地址到数据库中,TODO未完成图片名称重命名。
        //提前创建图片父级文件夹
        String parentFileName="D:/springUpload/";
        File parentFile=new File(parentFileName);
        parentFile.mkdirs();
        String portrait=parentFileName+file.getOriginalFilename();
        file.transferTo(new File(parentFileName+file.getOriginalFilename()));
//手动将数据存入User对象中
        User user=new User();
        user.setNickname(nickname);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone_number(phone_number);
        user.setPortrait(portrait);
//调用接口
        userService.InsertUser(user);
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/add")
    public String addUserPage(){
        return "user/user-add";
    }



}

