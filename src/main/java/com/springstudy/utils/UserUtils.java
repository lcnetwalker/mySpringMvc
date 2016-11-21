package com.springstudy.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.gmk.framework.common.config.Global;
import com.gmk.framework.common.security.shiro.Principal;
import com.gmk.framework.common.utils.*;
import com.gmk.framework.common.utils.ConfigUtils;
import com.gmk.framework.common.utils.HttpClientUtils;
import com.gmk.framework.dao.MenuDAO;
import com.gmk.framework.dao.RoleDAO;
import com.gmk.framework.dao.RoleToOrgPositionDAO;
import com.gmk.framework.dao.UserDAO;
import com.gmk.framework.model.Menu;
import com.gmk.framework.model.Role;
import com.gmk.framework.model.User;
import com.google.common.collect.Maps;
import net.paoding.rose.web.Invocation;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

public class UserUtils {

    private static final Logger logger = LoggerFactory.getLogger(UserUtils.class);

    public static final UserDAO userDAO = com.gmk.framework.common.utils.SpringContextHolder.getBean(UserDAO.class);
    public static final MenuDAO menuDAO = com.gmk.framework.common.utils.SpringContextHolder.getBean(MenuDAO.class);
    public static final RoleDAO roleDAO = com.gmk.framework.common.utils.SpringContextHolder.getBean(RoleDAO.class);
    public static final String CACHE_USER = "user";
    public static final String CACHE_MENU_LIST = "menuList";
    public static final String CACHE_ORGMENU_LIST = "orgmenuList";
    public static final String SESSION_FORCE_LOGOUT_KEY = "session.force.logout";
    public static final RoleToOrgPositionDAO roleToOrgPositionDAO = com.gmk.framework.common.utils.SpringContextHolder.getBean(RoleToOrgPositionDAO.class);

    /**
     * 获取当前登录用户
     *
     * @return
     */
    public static User getUser() {
        User user = (User) getCache(CACHE_USER);
        if (user == null) {
            Principal principal = (Principal) SecurityUtils.getSubject()
                    .getPrincipal();
            if (principal != null) {
                user = userDAO.findOne(principal.getId());
                putCache(CACHE_USER, user);
            }
        }
        if (user == null) {
            user = new User();
            SecurityUtils.getSubject().logout();
        }
        return user;
    }

    public static User getUser(boolean isRefresh) {
        if (isRefresh) {
            removeCache(CACHE_USER);
        }
        return getUser();
    }

    /**
     * 根据登陆id获取用户姓名
     *
     * @param loginName
     * @return
     */
    public static String getNameByLoginName(String loginName) {
        try {
            return userDAO.getNameByLoginName(loginName);
        } catch (Exception ex) {
            logger.error(loginName + " 没有此用户");
        }
        return "";
    }

    /**
     * 根据用户id获取用户姓名
     *
     * @param userID
     * @return
     */
    public static String getNameByUserID(Long userID) {
        try {
            return userDAO.getNameByUserID(userID);
        } catch (Exception ex) {
            logger.error(userID + " 没有此用户");
        }
        return "";
    }

    public static List<Menu> getMenuList() {
        @SuppressWarnings("unchecked")
        List<Menu> menuList = (List<Menu>) getCache(CACHE_MENU_LIST);

        if (menuList == null) {
            User user = getUser();
            if (user.isAdmin()) {
                menuList = menuDAO.findAllList();
            } else {
                menuList = menuDAO.findByUserId(user.getId());

                //加入用户对应岗位组织
                long[] orgPositionRole = getAllRoleIdByOrgPositionId();//获取当前用户岗位组织对应的所有角色id
                //加入管理者默认角色
                long[] roleIds2 = getAllRoleIdByLeader();//获取当前管理者所有角色id
                if (ArrayUtils.isNotEmpty(roleIds2)) {
                    orgPositionRole = ArrayUtils.addAll(orgPositionRole, roleIds2);
                }
                if (ArrayUtils.isNotEmpty(orgPositionRole)) {
                    menuList.addAll(menuDAO.findAllByRoleIds(orgPositionRole));
                }

                int size = menuList.size();
                Long[] menus = new Long[size];
                for (int i = 0; i < size; i++) {
                    menus[i] = menuList.get(i).getId();
                }
                menuList = menuDAO.findListByIds(menus);
            }


            putCache(CACHE_MENU_LIST, menuList);
        }

        return menuList;
    }
    /**
     * 根据登陆用户岗位组织获取对应角色
     *
     * @return
     * @author ldd
     * @date 2015年1月27日 下午4:43:16
     */
    public static long[] getAllRoleIdByOrgPositionId() {
        String oahr = com.gmk.framework.common.utils.ConfigUtils.getPropValue("OAHR");
        if (UserUtils.getUser().isAdmin() || UserUtils.getUser().getId() == null || oahr == null) {
            return null;
        }
        String url = oahr + "/authapi/orgpositionapi/json/orgposition?loginName=" + UserUtils.getUser().getLoginName();
//    	String loginName = UserUtils.getUser().getLoginName();
        List<String> otjIdStrings = null;
        long[] roleIds = null;
        try {
            String json = com.gmk.framework.common.utils.HttpClientUtils.doGet(url, Global.getConfig("api.user"), UserUtils.getPwByLoginName(Global.getConfig("api.user")));
            //解析json
            JSONObject result = JSON.parseObject(json);
            Object object = result.get("otjIds");
            if (object != null) {
                JSONArray jsons = (JSONArray) object;
                otjIdStrings = JSON.parseArray(jsons.toJSONString(), String.class);

                roleIds = roleToOrgPositionDAO.findAllRoleIdByOrgpositionid(otjIdStrings);

//                for (String otjid : otjIdStrings) {
//                    otjid = otjid.replaceAll(" ", "");
//                    long[] rId = roleToOrgPositionDAO.findAllRoleIdByOrgpositionid(otjid);
//                    roleIds = ArrayUtils.addAll(roleIds, rId);//合并
//                }
            }

        } catch (Exception e) {
            logger.error("获取hr系统岗位组织编号失败" + url, e);
        }
        return roleIds;
    }
    /**
     * 根据登陆用户是否是管理者获取对应角色
     *
     * @return
     * @author ldd
     * @date 2015年1月27日 下午4:43:16
     */
    public static long[] getAllRoleIdByLeader() {
        String oahr = com.gmk.framework.common.utils.ConfigUtils.getPropValue("OAHR");
        if (UserUtils.getUser().isAdmin() || UserUtils.getUser().getId() == null || oahr == null) {
            return null;
        }
        String url = oahr + "/api/repl/json/isRepLLeaderByLoginName/" + UserUtils.getUser().getLoginName();
        boolean isLeader = false;
        long[] roleIds = null;
        try {
            String json = com.gmk.framework.common.utils.HttpClientUtils.doGet(url, Global.getConfig("api.user"), UserUtils.getPwByLoginName(Global.getConfig("api.user")));
            //解析json
            JSONObject result = JSON.parseObject(json);
            Object object = result.get("isLeader");
            if (object != null) {
                isLeader = (boolean)object;
            }
            //判断登陆者是否为领导，若是则用户角色中默认要加入管理者角色
            if (isLeader) {
                Role defaultRole = roleDAO.findByName("hr_managemenu");//系统中创建了默认的管理者角色，name为hr_managemenu
                long[] defaultroleId = {defaultRole.getId()};
                return defaultroleId;
            }

        } catch (Exception e) {
            logger.error("获取hr系统岗位组织编号失败" + url, e);
        }
        return roleIds;
    }

    /**
     * 2015-02-05
     * 需要传入用户信息，用于接口的方法
     *
     * @return
     */
    public static long[] getAllRoleIdByOrgPositionIdOfPortal(String loginName) {
        String oahr = ConfigUtils.getPropValue("OAHR");
        if(oahr == null){
            return null;
        }
        String url = oahr + "/authapi/orgpositionapi/json/orgposition?loginName=" + loginName;
        List<String> otjIdStrings = null;
        long[] roleIds = null;
        try {
            String json = HttpClientUtils.doGet(url, Global.getConfig("api.user"), UserUtils.getPwByLoginName(Global.getConfig("api.user")));
            //解析json
            JSONObject result = JSON.parseObject(json);
            Object object = result.get("otjIds");
            if (object != null) {
                JSONArray jsons = (JSONArray) object;
                otjIdStrings = JSON.parseArray(jsons.toJSONString(), String.class);

                roleIds = roleToOrgPositionDAO.findAllRoleIdByOrgpositionid(otjIdStrings);
//                for (String otjid : otjIdStrings) {
//                    otjid = otjid.replaceAll(" ", "");
//                    long[] rId = roleToOrgPositionDAO.findAllRoleIdByOrgpositionid(otjid);
//                    roleIds = ArrayUtils.addAll(roleIds, rId);//合并
//                }
            }

        } catch (Exception e) {
            logger.error("获取hr系统岗位组织编号失败" + url, e);
        }
        return roleIds;
    }
    // ============== User Cache ==============

    public static Object getCache(String key) {
        return getCache(key, null);
    }

    public static Object getCache(String key, Object defaultValue) {
        Object obj = getCacheMap().get(key);
        return obj == null ? defaultValue : obj;
    }

    public static void putCache(String key, Object value) {
        getCacheMap().put(key, value);
    }

    public static void removeCache(String key) {
        getCacheMap().remove(key);
    }

    public static Map<String, Object> getCacheMap() {
        Map<String, Object> map = Maps.newHashMap();
        try {
            Subject subject = SecurityUtils.getSubject();
            Principal principal = (Principal) subject.getPrincipal();
            return principal != null ? principal.getCacheMap() : map;
        } catch (UnavailableSecurityManagerException e) {
            return map;
        }
    }

//	@Override
//	public void postProcessBeanFactory(ConfigurableListableBeanFactory bf)
//			throws BeansException {
//		logger.debug("执行postProcessBeanFactory方法");
//		userDAO = SpringUtils.getBean(bf, "com.gmk.framework.dao.UserDAO");
//		menuDAO = SpringUtils.getBean(bf, "com.gmk.framework.dao.MenuDAO");
//		
//	}

//	@Override
//	public void setApplicationContext(ApplicationContext applicationContext)
//			throws BeansException {
//		logger.debug("执行postProcessBeanFactory方法");
//		userDAO = SpringUtils.getBean(applicationContext, "com.gmk.framework.dao.UserDAO");
//		menuDAO = SpringUtils.getBean(applicationContext, "com.gmk.framework.dao.MenuDAO");
//		
//	}

    public static User findUserByLoginName(String loginName) {
        return userDAO.findByLoginName(loginName);
    }

    /**
     * 根据session获取用户名
     *
     * @param session
     * @return
     */
    public static String principal(Session session) {
        try {
            PrincipalCollection principalCollection =
                    (PrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            Principal principal = (Principal) principalCollection.getPrimaryPrincipal();

            return principal != null ? principal.getName() : "无";
        } catch (Exception e) {

        }
        return null;
    }

    /**
     * 强制退出
     *
     * @param session
     * @return
     */
    public static boolean isForceLogout(Session session) {
        return "OK".equals(session.getAttribute(UserUtils.SESSION_FORCE_LOGOUT_KEY));
    }

    /**
     * 根据登陆名获取用户加密密码 api调用
     *
     * @param loginName
     * @return
     */
    public static String getPwByLoginName(String loginName) {
        User user = findUserByLoginName(loginName);
        return user != null && !"1".equals(user.getDelFlag()) ? user.getPassword() : "";
    }

    /**
     * 获取shiro SessionDAO
     *
     * @param inv
     * @return
     */
    public static SessionDAO getSessionDAO(Invocation inv) {
        //WebEnvironment environment = WebUtils.getRequiredWebEnvironment(inv.getServletContext());
        DefaultSecurityManager securityManager = (DefaultSecurityManager) SecurityUtils.getSecurityManager();
        DefaultWebSessionManager sessionManager = (DefaultWebSessionManager) securityManager.getSessionManager();
        return sessionManager.getSessionDAO();
    }
}
