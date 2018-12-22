package com.zufang.controller;

import com.zufang.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("picture")
public class PictureController {

    @Autowired
    private PictureService pictureService;

    /**
     * 上传图片方法，
     * @param file
     * @return 返回一个地址和一个状态码，0表示成功，1表示失败
     */
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> uploadPicture(MultipartFile file){
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            String url = pictureService.uploadPicture(file);
            result.put("url",url);
            result.put("code",0);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("code",1);
            result.put("message","上传失败请联系管理员");
        }
        return result;
    }
}
