package com.springstudy.controller;

import com.gmk.platform.utils.Reflections;
import org.apache.batik.dom.AbstractEntity;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by admin on 16/11/8.
 */
public abstract class BaseController<M extends AbstractEntity> {
    protected final Class<M> entityClass = Reflections.findParameterizedType(this.getClass(), 0);
    private String viewPrefix;

    protected BaseController() {
        this.setViewPrefix(this.defaultViewPrefix());
    }

    protected void setCommonData(Model model) {
    }

    public void setViewPrefix(String viewPrefix) {
        if(viewPrefix.startsWith("/")) {
            viewPrefix = viewPrefix.substring(1);
        }

        this.viewPrefix = viewPrefix;
    }

    public String getViewPrefix() {
        return this.viewPrefix;
    }

    protected M newModel() {
        try {
            return (M)this.entityClass.newInstance();
        } catch (Exception var2) {
            throw new IllegalStateException("can not instantiated model : " + this.entityClass, var2);
        }
    }

    public String viewName(String suffixName) {
        if(!suffixName.startsWith("/")) {
            suffixName = "/" + suffixName;
        }

        return this.getViewPrefix() + suffixName;
    }

    protected boolean hasError(M m, BindingResult result) {
        Assert.notNull(m);
        return result.hasErrors();
    }

    protected String redirectToUrl(String backURL) {
        if(StringUtils.isEmpty(backURL)) {
            backURL = this.getViewPrefix();
        }

        if(!backURL.startsWith("/") && !backURL.startsWith("http")) {
            backURL = "/" + backURL;
        }

        return "redirect:" + backURL;
    }

    protected String defaultViewPrefix() {
        String currentViewPrefix = "";
        RequestMapping requestMapping = (RequestMapping) AnnotationUtils.findAnnotation(this.getClass(), RequestMapping.class);
        if(requestMapping != null && requestMapping.value().length > 0) {
            currentViewPrefix = requestMapping.value()[0];
        }

        return currentViewPrefix;
    }
}
