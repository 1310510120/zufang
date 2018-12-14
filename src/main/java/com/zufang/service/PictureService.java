package com.zufang.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface PictureService {

    public String uploadPicture(MultipartFile file);
}
