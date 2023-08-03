DROP TABLE IF EXISTS `docker_access_token`;
CREATE TABLE `docker_access_token` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) DEFAULT 'micr.cloud.mioffice.cn',
  `username` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username_domain` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=90002;

DROP TABLE IF EXISTS `gitlab_access_token`;
CREATE TABLE `gitlab_access_token` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `domain` varchar(255) DEFAULT 'git.n.xiaomi.com',
  `type` int(2) DEFAULT '0' COMMENT '账户类型:0个人账户;1公共账户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username_domain` (`username`,`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=300260;

DROP TABLE IF EXISTS `sidecar_operator`;
CREATE TABLE `sidecar_operator` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `sidecarName` varchar(128) DEFAULT NULL,
  `sidecarAuthor` varchar(128) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `sidecarYml` varchar(3100) DEFAULT NULL,
  `sidecarType` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sidecarName` (`sidecarName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=90001;

DROP TABLE IF EXISTS `miline_pipeline`;
CREATE TABLE `miline_pipeline` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(64) DEFAULT NULL,
  `pipeline_name` varchar(128) DEFAULT NULL,
  `pipeline_cname` varchar(128) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `git_url` varchar(1024) DEFAULT NULL,
  `git_branch` varchar(64) DEFAULT NULL,
  `git_commitId` varchar(128) DEFAULT NULL,
  `creator` varchar(128) DEFAULT NULL,
  `updater` varchar(128) DEFAULT NULL,
  `create_time` bigint(64) DEFAULT NULL,
  `update_time` bigint(64) DEFAULT NULL,
  `phase_setting` json DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `pipeline_deploy_id` bigint(64) DEFAULT NULL,
  `env` varchar(64) DEFAULT NULL,
  `mone_env_id` bigint(64) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `deploy_env_group` varchar(30) DEFAULT NULL COMMENT '部署环境标识',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1140000;

DROP TABLE IF EXISTS `miline_pipeline_deploy`;
CREATE TABLE `miline_pipeline_deploy` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `pipeline_id` bigint(64) DEFAULT NULL,
  `pipeline_record_id` bigint(64) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `start_time` bigint(64) DEFAULT NULL,
  `pipeline_base_param` json DEFAULT NULL,
  `runner` varchar(128) DEFAULT NULL,
  `deploy_machines` json DEFAULT NULL,
  `deploy_batches` json DEFAULT NULL,
  `last_deploy_offline_machines` json DEFAULT NULL,
  `container_name` varchar(255) DEFAULT NULL,
  `jar_name` varchar(255) DEFAULT NULL,
  `jar_download_url` varchar(350) DEFAULT NULL,
  `deploy_type` int(4) DEFAULT NULL,
  `env` varchar(32) DEFAULT NULL,
  `deploy_status` json DEFAULT NULL,
  `deploy_setting` json DEFAULT NULL,
  `user_fort_status` int(4) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `rollback_pipeline_record_id` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipeline_record_id` (`pipeline_record_id`),
  KEY `pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240001;

DROP TABLE IF EXISTS `miline_pipeline_exp`;
CREATE TABLE `miline_pipeline_exp` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(64) DEFAULT NULL,
  `pipeline_id` bigint(64) NOT NULL,
  `create_time` bigint(64) DEFAULT NULL,
  `health_check_result` json DEFAULT NULL,
  `health_check_url` varchar(255) DEFAULT NULL,
  `health_check_task_id` bigint(32) DEFAULT NULL,
  `process_monitor_task_id` bigint(32) DEFAULT NULL,
  `env` varchar(64) DEFAULT NULL,
  `auto_scale` tinyint(1) DEFAULT NULL,
  `pipeline_record_id` bigint(64) DEFAULT NULL,
  `health_check_status` int(4) DEFAULT NULL,
  `process_monitor_status` int(4) DEFAULT '1',
  `notice_type` int(2) DEFAULT NULL,
  `pipeline_trigger` json DEFAULT NULL,
  `tenement` varchar(30) DEFAULT NULL COMMENT '机房区分标识',
  `auto_nginx` json DEFAULT NULL,
  `scale_type` json DEFAULT NULL COMMENT '允许部署的机器标签',
  `clusters` varchar(32) DEFAULT NULL COMMENT '部署集群 多个用,分隔',
  PRIMARY KEY (`id`),
  KEY `pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=240001;

DROP TABLE IF EXISTS `miline_pipeline_record`;
CREATE TABLE `miline_pipeline_record` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(64) DEFAULT NULL,
  `pipeline_id` bigint(64) DEFAULT NULL,
  `rollback_id` bigint(64) DEFAULT NULL,
  `pipeline_name` varchar(128) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `runner` varchar(128) DEFAULT NULL,
  `start_time` bigint(64) DEFAULT NULL,
  `duration` bigint(64) DEFAULT NULL,
  `pipeline_base_param` json DEFAULT NULL,
  `pipeline_phase_record` json DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `canceler` varchar(128) DEFAULT NULL,
  `cancel_time` bigint(64) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `env` varchar(32) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `trigger_type` int(2) DEFAULT '0' COMMENT '执行类型 0手动执行、1自动触发',
  PRIMARY KEY (`id`),
  KEY `pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=323140;

DROP TABLE IF EXISTS `miline_scale_order`;
CREATE TABLE `miline_scale_order` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(64) DEFAULT NULL,
  `pipeline_id` bigint(64) NOT NULL,
  `status` int(2) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `creator` varchar(128) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `progresses` json DEFAULT NULL,
  `content` json DEFAULT NULL,
  `env` varchar(64) DEFAULT NULL,
  `currentProgressIndex` int(4) DEFAULT NULL,
  `currentProcessor` varchar(32) DEFAULT NULL COMMENT '当前处理人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=90001;

DROP TABLE IF EXISTS `miline_project_git_webhook`;
CREATE TABLE `miline_project_git_webhook` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `projectId` int(32) DEFAULT NULL,
  `env` varchar(128) DEFAULT NULL,
  `gitAddress` varchar(256) DEFAULT NULL,
  `branch` varchar(256) DEFAULT NULL,
  `gitWebhookUrl` varchar(256) DEFAULT NULL,
  `gitSecretToken` varchar(256) DEFAULT NULL,
  `gitWebhookId` varchar(256) DEFAULT NULL,
  `pushEvents` tinyint(1) DEFAULT NULL,
  `tagPushEvents` tinyint(1) DEFAULT NULL,
  `mergeRequestsEvents` tinyint(1) DEFAULT NULL,
  `status` int(4) DEFAULT '0',
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `creator` varchar(64) DEFAULT NULL,
  `updater` varchar(64) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `webhookUrl` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `k_projectId` (`projectId`),
  KEY `k_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=30001;

DROP TABLE IF EXISTS `miline_pipeline_template_snapshot`;
CREATE TABLE `miline_pipeline_template_snapshot` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `pipeline_id` bigint(64) DEFAULT NULL,
  `pipeline_record_id` bigint(64) DEFAULT NULL,
  `template_name` varchar(64) DEFAULT NULL,
  `template_title` varchar(64) DEFAULT NULL,
  `template_order` int(4) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `duration` bigint(64) DEFAULT NULL,
  `import_data` json DEFAULT NULL,
  `export_data` json DEFAULT NULL,
  `start_time` bigint(64) DEFAULT NULL,
  `template_record_log_meta_data` json DEFAULT NULL,
  `ctx_attachment` json DEFAULT NULL,
  `step_params` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pipeline_record_id` (`pipeline_record_id`),
  KEY `pipeline_id` (`pipeline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240001;

DROP TABLE IF EXISTS `mione_custom_config`;
CREATE TABLE `mione_custom_config` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=210001;


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
  `project_gen` json DEFAULT NULL,
  `deploy_limit` int(32) NOT NULL DEFAULT '3',
  `iam_tree_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `project_role` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `projectId` int(32) DEFAULT NULL,
  `accountId` int(32) DEFAULT NULL,
  `roleType` int(32) DEFAULT NULL,
  `ctime` bigint(64) DEFAULT NULL,
  `utime` bigint(64) DEFAULT NULL,
  `status` int(32) DEFAULT NULL,
  `version` int(32) DEFAULT NULL,
  `userName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_project_id_user_name_role_type` (`projectId`,`userName`,`roleType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;


CREATE TABLE `project_top` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_name_project_id` (`user_name`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户置顶项目';

