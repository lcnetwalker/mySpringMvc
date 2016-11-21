package com.springstudy.utils;

import com.gmk.framework.common.utils.*;
import com.gmk.framework.dao.ConfigDAO;
import com.gmk.framework.model.Config;

/**
 * 系统配置信息
 * Created by zzh on 14-12-23.
 */
public class ConfigUtils {

    private static ConfigDAO configDAO = SpringContextHolder.getBean(ConfigDAO.class);

    public static String getPropValue(String propKey) {
        if (com.gmk.framework.common.utils.StringUtils.isNotBlank(propKey)) {
            Config config = configDAO.getConfig(propKey);
            if (config == null) {
                config = new Config();
                config.setPropkey(propKey);
                config.setRemark("警告：需要设置此系统属性！");
                configDAO.add(config);
            }
            return config.getPropvalue();
        }
        return null;
    }
}
