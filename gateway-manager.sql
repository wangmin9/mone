CREATE TABLE `mione_custom_config` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=210001;
INSERT INTO `mione_custom_config` VALUES (1, 'tenement', '[{\"label\": \"中国区\", \"value\": \"first_dept\"},{\"label\": \"创新部\", \"value\": \"innov_dept\"}]', 0, 1619434562117, 1619597244732);


USE `gateway`;

DROP TABLE IF EXISTS `api_group_info`;
CREATE TABLE `api_group_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `description` varchar(1023) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组描述',
  `gid` int(11) NOT NULL,
  `base_url` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组的基础url',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间（毫秒）',
  `utime` bigint(20) NOT NULL COMMENT '更新时间（毫秒）',
  PRIMARY KEY (`id`),
  KEY `idx_gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=40000042 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `api_info`;
CREATE TABLE `api_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'api名称',
  `description` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT 'api描述',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '请求路径',
  `http_method` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '提交方式',
  `path` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `route_type` tinyint(4) DEFAULT NULL,
  `group_id` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '分组Id',
  `service_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '服务名称',
  `method_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名称',
  `service_group` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'RPC服务分组',
  `service_version` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '服务的版本号',
  `param_template` text COLLATE utf8_bin NOT NULL COMMENT '参数模板，json模板',
  `status` int(100) NOT NULL,
  `creator` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '更新者',
  `content_type` varchar(127) COLLATE utf8_bin NOT NULL COMMENT '返回结果类型，用于mock',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '低四位自低向高依次为：是否mock:是否缓存:是否打印日志:是否使用脚本',
  `invoke_limit` int(11) NOT NULL DEFAULT '600' COMMENT '每分钟调用次数限制',
  `qps_limit` int(11) NOT NULL DEFAULT '1000' COMMENT 'qps限制',
  `timeout` int(11) NOT NULL DEFAULT '1000' COMMENT '超时时间（毫秒）',
  `cache_expire` int(11) NOT NULL DEFAULT '0' COMMENT '缓存过期时间(毫秒)',
  `token` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '调用token',
  `ctime` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间（毫秒）',
  `utime` bigint(20) NOT NULL DEFAULT '0' COMMENT '修改时间（毫秒）',
  `plugin_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ds_ids` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ip_anti_brush_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'ip防刷限制',
  `uid_anti_brush_limit` int(11) NOT NULL DEFAULT '0' COMMENT 'uid防刷限制',
  `filter_params` text COLLATE utf8_bin,
  `priority` int(32) DEFAULT NULL,
  `application` varchar(400) COLLATE utf8_bin NOT NULL DEFAULT 'tesla',
  `app_src` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '应用来源',
  `api_src` int(4) unsigned NOT NULL DEFAULT '0' COMMENT 'api来源',
  `tenement` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `attachment` json DEFAULT NULL,
  `is_force_sign_in` tinyint(1) DEFAULT '0',
  `token_effective_time` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_url` (`url`,`tenement`),
  KEY `idx_group` (`group_id`),
  KEY `idx_tenement` (`tenement`)
) ENGINE=InnoDB AUTO_INCREMENT=40004847 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `approval`;
CREATE TABLE `approval` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `projectId` int(32) DEFAULT NULL,
  `applicantId` int(32) DEFAULT NULL,
  `auditorId` int(32) DEFAULT NULL,
  `reason` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `type` int(32) DEFAULT NULL,
  `biz_id` int(32) DEFAULT NULL,
  `applicant_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `commit_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `env_id` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `debug_record`;
CREATE TABLE `debug_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT 'api id',
  `url` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '请求目标路径',
  `http_method` varchar(32) COLLATE utf8_bin DEFAULT 'post' COMMENT '请求方法，默认post',
  `headers` text COLLATE utf8_bin COMMENT 'headers',
  `timeout` int(11) NOT NULL DEFAULT '1000' COMMENT '超时设置，毫秒',
  `params` text COLLATE utf8_bin COMMENT '请求参数，JSON',
  `ctime` bigint(21) NOT NULL DEFAULT '0' COMMENT '创建时间，毫秒',
  `utime` bigint(21) DEFAULT NULL COMMENT '更新时间，毫秒',
  `result` text COLLATE utf8_bin COMMENT 'debug结果',
  `ext` text COLLATE utf8_bin COMMENT '扩展字段，JSON',
  `gateway_svr_url` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_aid` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=238101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '域名',
  `description` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(255) NOT NULL COMMENT '创建人',
  `updater` varchar(255) NOT NULL COMMENT '更新人',
  `deleted` int(2) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `tenant` varchar(30) DEFAULT NULL COMMENT '租户',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间（毫秒）',
  `utime` bigint(20) NOT NULL COMMENT '更新时间（毫秒）',
  PRIMARY KEY (`id`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30060014 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filter_info`;
CREATE TABLE `filter_info` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `version` varchar(20) COLLATE utf8_bin NOT NULL,
  `author` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `desc` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `git_address` varchar(128) COLLATE utf8_bin NOT NULL,
  `params` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `data` mediumblob,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `creator` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `project_id` int(32) DEFAULT NULL,
  `cname` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `next_version_data` mediumblob,
  `online_status` int(32) DEFAULT NULL,
  `is_system` tinyint(1) DEFAULT '0',
  `git_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `git_group` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `commit_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `compile_id` bigint(64) DEFAULT NULL,
  `groups` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `tenement` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `compile_pipeline_id` int(20) DEFAULT '0' COMMENT '在miline编译的pipelineId',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`,`tenement`)
) ENGINE=InnoDB AUTO_INCREMENT=70090110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `gateway_server_info`;
CREATE TABLE `gateway_server_info` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `host` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `port` int(32) DEFAULT NULL,
  `group` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `key` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  `utime` bigint(20) DEFAULT NULL,
  `tenant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `httpIp` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `httpPort` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `cluster` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '区分是中国区or创新部or...,历史遗留问题,这些集群都在中国区租户下',
  `enabled` tinyint(1) DEFAULT '1' COMMENT 'agent是否对外提供服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120750 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `gw_group_info`;
CREATE TABLE `gw_group_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `description` varchar(1023) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组描述',
  `creation_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `tenement` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `website_id` int(11) NOT NULL DEFAULT '0',
  `base_url` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40120080 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='网关分组信息表';

DROP TABLE IF EXISTS `gw_user_info`;
CREATE TABLE `gw_user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户邮箱前缀',
  `user_phone` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户电话',
  `gids` varchar(900) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '0',
  `tenant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40360984 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='网关分组用户映射表';

DROP TABLE IF EXISTS `metadata`;
CREATE TABLE `metadata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '元数据名称',
  `description` varchar(1023) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '元数据描述',
  `type` int(11) NOT NULL COMMENT '元数据类型 1-分组集合group_cluster,2-域名domain',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间（毫秒）',
  `utime` bigint(20) NOT NULL COMMENT '更新时间（毫秒）',
  `refer_header` varchar(1024) COLLATE utf8_bin DEFAULT '' COMMENT 'referheader',
  `tenant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=30060002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `metadata_relation`;
CREATE TABLE `metadata_relation` (
  `id` bigint(21) unsigned NOT NULL AUTO_INCREMENT,
  `source` bigint(21) NOT NULL COMMENT 'source 表主键id,只能是metadata表的主键',
  `target` bigint(21) NOT NULL COMMENT 'target 表主键id，可以是metadata表的主键或者其他表的主键',
  `type` int(11) NOT NULL COMMENT '元数据类型 1-group_cluster(metadata):api_gourp;2-group_cluster(metadata):domain(metadata);',
  PRIMARY KEY (`id`),
  KEY `idx_key` (`source`,`target`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=30030002 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `mione_auditing`;
CREATE TABLE `mione_auditing` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `operator` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `attachment` text COLLATE utf8_bin,
  `version` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=270355 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `mione_custom_config`;
CREATE TABLE `mione_custom_config` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `version` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240047 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `mione_menu`;
CREATE TABLE `mione_menu` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT,
  `priority` int(32) DEFAULT NULL,
  `role` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `menu` text COLLATE utf8_bin,
  `version` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` bigint(21) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_name` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '应用名称',
  `user_name` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '操作人/用户名',
  `data_id` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '资源标识',
  `data_before` varchar(1000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作前数据',
  `data_after` text COLLATE utf8mb4_bin COMMENT '操作后数据',
  `create_time` bigint(64) DEFAULT '0' COMMENT '操作时间',
  `type` int(11) DEFAULT '0' COMMENT '类型,1:创建, 2:删除, 3:更改',
  `remark` varchar(1000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

DROP TABLE IF EXISTS `plugin_data`;
CREATE TABLE `plugin_data` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(32) DEFAULT NULL,
  `data` mediumblob,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `version` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `stauts` int(32) DEFAULT NULL,
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `compile_id` bigint(64) DEFAULT NULL,
  `commit_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40000071 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `plugin_info`;
CREATE TABLE `plugin_info` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `data_id` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `creator` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `desc` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `group_info` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `flow_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `git_group` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `git_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `git_domain` varchar(255) COLLATE utf8_bin DEFAULT 'git.n.xiaomi.com',
  `tenant` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40000010 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `gitAddress` varchar(200) DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `git_group` varchar(128) DEFAULT NULL,
  `git_name` varchar(128) DEFAULT NULL,
  `deploy_limit` int(32) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tesla_ds`;
CREATE TABLE `tesla_ds` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `type` int(32) DEFAULT NULL,
  `driver_class` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `data_source_url` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `pass_wd` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `pool_size` int(32) DEFAULT NULL,
  `max_pool_size` int(32) DEFAULT NULL,
  `min_pool_size` int(32) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `state` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `creator` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `jar_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `ioc_package` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `reg_address` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `redis_type` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `nacos_data_id` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `nacos_group` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mongo_database` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(400) COLLATE utf8_bin DEFAULT NULL,
  `api_package` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `threads` int(32) DEFAULT NULL,
  `tenement` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40000011 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection` (
  `id` bigint(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `apiInfoId` int(11) DEFAULT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  `utime` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40000097 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

DROP TABLE IF EXISTS `user_rate`;
CREATE TABLE `user_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `the_rate_id` int(32) DEFAULT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `type` int(32) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90011 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户评分表';

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '站点名称',
  `description` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `owners` varchar(1024) DEFAULT '' COMMENT '拥有者',
  `deleted` int(2) DEFAULT '0' COMMENT '0:未删除 1:已删除',
  `tenant` varchar(30) DEFAULT NULL COMMENT '租户',
  `creator` varchar(255) NOT NULL COMMENT '创建人',
  `updater` varchar(255) NOT NULL COMMENT '更新人',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间（毫秒）',
  `utime` bigint(20) NOT NULL COMMENT '更新时间（毫秒）',
  PRIMARY KEY (`id`),
  KEY `key_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30030018 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `website_audit`;
CREATE TABLE `website_audit` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) DEFAULT NULL COMMENT '站点id',
  `status` int(2) NOT NULL COMMENT '状态',
  `type` int(2) NOT NULL COMMENT '修改类型 1:modify,2:delete',
  `creator` varchar(128) NOT NULL COMMENT '申请提交人',
  `ctime` bigint(64) NOT NULL COMMENT '创建时间（毫秒）',
  `utime` bigint(64) NOT NULL COMMENT '更新时间（毫秒）',
  `progresses` json NOT NULL COMMENT '审批流程',
  `currentProgressIndex` int(4) DEFAULT NULL COMMENT '当前流程阶段index',
  `currentProcessor` varchar(128) DEFAULT NULL COMMENT '当前处理人',
  `content_before` json DEFAULT NULL COMMENT '申请修改前的站点内容',
  `content_after` json DEFAULT NULL COMMENT '申请修改后的站点内容',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `tenant` varchar(30) DEFAULT NULL COMMENT '租户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `website_domain_relation`;
CREATE TABLE `website_domain_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_id` int(11) DEFAULT '0' COMMENT '站点id',
  `domain_id` int(11) DEFAULT '0' COMMENT '域名id',
  `tenant` varchar(30) DEFAULT NULL COMMENT '租户',
  `creator` varchar(255) NOT NULL COMMENT '创建人',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间（毫秒）',
  PRIMARY KEY (`id`),
  KEY `key_website_domain` (`website_id`,`domain_id`),
  KEY `key_domain` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
