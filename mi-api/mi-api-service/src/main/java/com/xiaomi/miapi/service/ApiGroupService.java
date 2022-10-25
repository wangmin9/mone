package com.xiaomi.miapi.service;

import com.xiaomi.miapi.common.Result;
import com.xiaomi.miapi.common.pojo.ApiGroup;

import java.util.List;
import java.util.Map;

/**
 * 接口分组
 */
public interface ApiGroupService
{
	//新增接口分组
	public Result<Boolean> addApiGroup(ApiGroup apiGroup, String opUsername);

	//删除接口分组
	public Result<Boolean> deleteGroup(Integer projectID, Integer groupID, String username);

	//获取分组列表
	public List<Map<String, Object>> getGroupList(Integer projectID);

	//修好接口分组
	public boolean editGroup(ApiGroup apiGroup);

}
