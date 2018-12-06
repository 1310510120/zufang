package com.zufang.service.Impl;

import com.zufang.mapper.AdminMapper;
import com.zufang.mapper.UserMapper;
import com.zufang.pojo.Admin;
import com.zufang.pojo.User;
import com.zufang.service.AdminService;
import com.zufang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl  implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public String getPassword(String name) {
		// TODO Auto-generated method stub
		Admin u  = adminMapper.getByName(name);
		if(null==u)
			return null;
		return u.getPassword();
	}

}
