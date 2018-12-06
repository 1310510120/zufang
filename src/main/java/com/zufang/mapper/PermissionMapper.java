package com.zufang.mapper;


import com.zufang.pojo.Permission;

import java.util.List;

public interface PermissionMapper {
	public List<Permission> listPermissionsByUserName(String AdminName);
	
}
