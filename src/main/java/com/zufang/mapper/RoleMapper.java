package com.zufang.mapper;



import com.zufang.pojo.Role;

import java.util.List;

public interface RoleMapper {
	public List<Role> listRolesByUserName(String userName);
	
}
