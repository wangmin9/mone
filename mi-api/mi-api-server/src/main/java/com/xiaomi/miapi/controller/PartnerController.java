package com.xiaomi.miapi.controller;

import com.xiaomi.miapi.util.SessionAccount;
import com.xiaomi.miapi.service.PartnerService;
import com.xiaomi.miapi.service.impl.LoginService;
import com.xiaomi.miapi.common.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 项目协作管理控制器
 */
@Controller
@RequestMapping("/Partner")
public class PartnerController {
    @Resource
    private PartnerService partnerService;

    @Autowired
    private LoginService loginService;

    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectController.class);

    /**
     * 获取个人信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getUserInfo")
    public Result<SessionAccount> getUserInfo(HttpServletRequest request,
                                       HttpServletResponse response) throws IOException {
        SessionAccount account = loginService.getAccountFromSession(request);

        if (null == account) {
            LOGGER.warn("[AccountController.getUserInfo] current user not have valid account info in session");
            response.sendError(401, "未登录或者无权限");
            return null;
        }
        return Result.success(account);
    }

}
