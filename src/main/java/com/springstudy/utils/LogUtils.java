package com.springstudy.utils;

import com.gmk.framework.common.utils.*;
import com.gmk.framework.dao.LogDAO;
import com.gmk.framework.model.Log;
import com.gmk.framework.model.User;
import net.paoding.rose.web.Invocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: ZZH
 * Date: 14-1-16
 * Time: 下午2:22
 * To change this template use File | Settings | File Templates.
 */
public class LogUtils {
    private static final Logger logger = LoggerFactory.getLogger(LogUtils.class);

    private static LogDAO logDAO = SpringContextHolder.getBean(LogDAO.class);

    public static void save(Invocation inv, Throwable ex, Long endBegin) {
        HttpServletRequest request = inv.getRequest();
        String requestRri = request.getRequestURI();
        String uriPrefix = request.getContextPath();
        if ((com.gmk.framework.common.utils.StringUtils.startsWith(requestRri, uriPrefix) && (!com.gmk.framework.common.utils.StringUtils.endsWith(requestRri, "login"))) || ex != null) {
            User user = UserUtils.getUser();
            if (user != null && user.getId() != null) {
                StringBuilder params = new StringBuilder();
                int index = 0;
                for (Object param : request.getParameterMap().keySet()) {
                    params.append((index++ == 0 ? "" : "&") + param + "=");
                    params.append(com.gmk.framework.common.utils.StringUtils.abbr(com.gmk.framework.common.utils.StringUtils.endsWithIgnoreCase((String) param, "password")
                            ? "" : request.getParameter((String) param), 100));
                }
                try {
                    Log log = new Log();
                    log.setType(ex == null ? Log.TYPE_ACCESS : Log.TYPE_EXCEPTION);
                    log.setCreateBy(user.getId());
                    log.setCreateDate(new Date());
                    log.setRemoteAddr(com.gmk.framework.common.utils.StringUtils.getRemoteAddr(request));
                    String agent = request.getHeader("user-agent");
                    if(agent != null && agent.length() > 250){
                        agent = agent.substring(0,250);
                    }
                    log.setUserAgent(agent);
                    log.setRequestUri(request.getRequestURI());
                    log.setMethod(request.getMethod());
                    log.setParams(params.toString());
                    log.setException(ex != null ? ex.toString() : "");
                    log.setExetime(endBegin);
                    logDAO.save(log);
                } catch (Exception e) {
                    logger.error("日志记录添加失败", e);
                }
//                logger.info("save log {type: {}, loginName: {}, uri: {}}, ", log.getType(), user.getLoginName(), log.getRequestUri());

            }
        }
    }
}
