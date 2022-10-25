package com.xiaomi.miapi.service.impl;

import com.xiaomi.miapi.mapper.ProjectOperationLogMapper;
import com.xiaomi.miapi.service.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * 项目成员[业务处理层]
 */
@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="java.lang.Exception")
public class PartnerServiceImpl implements PartnerService
{
	@Autowired
	private ProjectOperationLogMapper projectOperationLogMapper;
}
