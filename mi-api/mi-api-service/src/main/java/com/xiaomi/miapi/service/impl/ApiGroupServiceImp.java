package com.xiaomi.miapi.service.impl;

import com.xiaomi.miapi.common.pojo.ApiGroup;
import com.xiaomi.miapi.common.pojo.ProjectOperationLog;
import com.xiaomi.miapi.mapper.ApiGroupMapper;
import com.xiaomi.miapi.mapper.ApiMapper;
import com.xiaomi.miapi.mapper.ApiCacheMapper;
import com.xiaomi.miapi.mapper.ProjectOperationLogMapper;
import com.xiaomi.miapi.service.ApiGroupService;
import com.xiaomi.miapi.common.Result;
import com.xiaomi.miapi.common.exception.CommonError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 接口分组业务处理层
 *
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "java.lang.Exception")
public class ApiGroupServiceImp implements ApiGroupService {

	@Autowired
    ApiGroupMapper apiGroupMapper;
	@Autowired
    ApiMapper apiMapper;
	@Autowired
	ProjectOperationLogMapper projectOperationLogMapper;

	/**
	 * 新建分组
	 */
	@Override
	public Result<Boolean> addApiGroup(ApiGroup apiGroup, String opUsername)
	{
		apiGroup.setSystemGroup(false);
		int result = apiGroupMapper.addApiGroup(apiGroup);
		if (result > 0)
		{
			Date date = new Date();
			Timestamp nowTime = new Timestamp(date.getTime());
			ProjectOperationLog projectOperationLog = new ProjectOperationLog();
			projectOperationLog.setOpProjectID(apiGroup.getProjectID());
			projectOperationLog.setOpDesc("添加项目分组 '" + apiGroup.getGroupName() + "'");
			projectOperationLog.setOpTarget(ProjectOperationLog.OP_TARGET_API_GROUP);
			projectOperationLog.setOpTargetID(apiGroup.getGroupID());
			projectOperationLog.setOpTime(nowTime);
			projectOperationLog.setOpType(ProjectOperationLog.OP_TYPE_ADD);
			projectOperationLog.setOpUsername(opUsername);
			projectOperationLogMapper.addProjectOperationLog(projectOperationLog);
			return Result.success(true);
		} else{
			return Result.fail(CommonError.UnknownError);
		}
	}

	/**
	 * 删除分组
	 */
	@Transactional
	@Override
	public Result<Boolean> deleteGroup(Integer projectID, Integer groupID,String username)
	{
		ApiGroup apiGroup = apiGroupMapper.getGroupByID(groupID);
		List<Integer> groupIDS = new ArrayList<>();
		groupIDS.add(groupID);
		Date date = new Date();
		Timestamp nowTime = new Timestamp(date.getTime());
		apiMapper.deleteApiByGroupID(groupIDS, nowTime);

		ApiGroup group = apiGroupMapper.getGroupByID(groupID);
		if (group == null){
			return Result.fail(CommonError.InvalidIDParamError);
		}
		int result = apiGroupMapper.deleteGroup(groupIDS);
		if (result > 0)
		{
			// 添加操作记录
			ProjectOperationLog projectOperationLog = new ProjectOperationLog();
			projectOperationLog.setOpProjectID(projectID);
			projectOperationLog.setOpDesc("删除项目分组  '" + apiGroup.getGroupName() + "'");
			projectOperationLog.setOpTarget(ProjectOperationLog.OP_TARGET_API_GROUP);
			projectOperationLog.setOpTargetID(groupID);
			projectOperationLog.setOpTime(nowTime);
			projectOperationLog.setOpType(ProjectOperationLog.OP_TYPE_DELETE);
			projectOperationLog.setOpUsername(username);
			projectOperationLogMapper.addProjectOperationLog(projectOperationLog);
			return Result.success(true);
		} else {
			return Result.fail(CommonError.UnknownError);
		}
	}

	/**
	 * 获取分组列表
	 */
	@Override
	public List<Map<String, Object>> getGroupList(Integer projectID)
	{
		List<Map<String, Object>> groupList = apiGroupMapper.getGroupList(projectID);
		return (groupList != null && !groupList.isEmpty()) ? groupList : new ArrayList<>();
	}

	/**
	 * 修改分组
	 */
	@Override
	public boolean editGroup(ApiGroup apiGroup)
	{
		apiGroup.setSystemGroup(false);
		int result = apiGroupMapper.editGroup(apiGroup);
		if (result > 0)
		{
			Date date = new Date();
			Timestamp nowTime = new Timestamp(date.getTime());
			ProjectOperationLog projectOperationLog = new ProjectOperationLog();
			projectOperationLog.setOpProjectID(apiGroup.getProjectID());
			projectOperationLog.setOpDesc("修改项目分组  '" + apiGroup.getGroupName() + "'");
			projectOperationLog.setOpTarget(ProjectOperationLog.OP_TARGET_API_GROUP);
			projectOperationLog.setOpTargetID(apiGroup.getGroupID());
			projectOperationLog.setOpTime(nowTime);
			projectOperationLog.setOpType(ProjectOperationLog.OP_TYPE_UPDATE);
			projectOperationLog.setOpUsername(apiGroup.getUsername());
			projectOperationLogMapper.addProjectOperationLog(projectOperationLog);
			return true;
		}
		else {
			return false;
		}
	}

}
