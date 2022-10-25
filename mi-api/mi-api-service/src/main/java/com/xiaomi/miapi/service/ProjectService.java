package com.xiaomi.miapi.service;

import com.xiaomi.miapi.common.bo.ApiEnvBo;
import com.xiaomi.miapi.common.bo.ProjectGroupBo;
import com.xiaomi.miapi.common.pojo.ApiEnv;
import com.xiaomi.miapi.common.pojo.BusProjectGroup;
import com.xiaomi.miapi.common.pojo.Project;
import com.xiaomi.miapi.common.Result;
import com.xiaomi.miapi.vo.BusProjectVo;

import java.util.List;
import java.util.Map;

/**
 * 自动化测试用例
 */
public interface ProjectService
{

	// 新增项目
	Result<Boolean> addProject(Project project, String username);

	boolean focusProject(Integer projectId,String username);

	Result<Boolean> unFocusProject(Integer projectId,String username);

	List<BusProjectVo> getFocusProject(String username);

	// 删除项目
	boolean deleteProject(Integer projectID,String username);

	// 获取项目列表
	Result<List<BusProjectVo>> getProjectList(String username);

	Result<Map<String,List<Map<String,Object>>>> indexSearch(String keyword);

	Result<List<BusProjectVo>> getProjectListByProjectGroupId(Integer projectGroupID,String username);

	// 修改项目
	boolean editProject(Project project,String username);

	//获取项目详情
	Result<Map<String, Object>> getProject(Integer projectID,String username);

	List<BusProjectVo> getRecentlyProjectList(String username);

	Result<Map<String,Object>> getMyProjects(String username);
	//获取项目日志列表
	List<Map<String, Object>> getProjectLogList(Integer projectID, Integer page, Integer pageSize);

	//获取项目日志条数
	int getProjectLogCount(Integer projectID, int dayOffset);

	//获取接口数量
	int getApiNum(Integer projectID);

	//===========项目组相关==========
	Result<Boolean> createProjectGroup(ProjectGroupBo projectGroupBo,String username);

	Result<Boolean> updateProjectGroup(ProjectGroupBo projectGroupBo);

	List<BusProjectGroup> getAllProjectGroup();

	Result<BusProjectGroup> getProjectGroupById(Integer id);

	Result<Boolean> deleteProjectGroup(Integer projectGroupId, String userName);

	Result<Boolean> addApiEnv(ApiEnvBo bo, String opUsername);

	Result<Boolean> editApiEnv(ApiEnvBo bo,String opUsername);

	Result<Boolean> deleteApiEnv(Integer envID,String opUsername);

	Result<ApiEnv> getApiEnv(Integer envID);

	Result<List<ApiEnv>> getApiEnvList(Integer projectID);

}
