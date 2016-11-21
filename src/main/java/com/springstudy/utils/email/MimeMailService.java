/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.springstudy.utils.email;

import com.gmk.framework.common.config.Global;
import com.gmk.framework.common.utils.ListUtils;
import com.gmk.framework.common.utils.email.*;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * MIME邮件服务类.
 * <p/>
 * 演示由Freemarker引擎生成的的html格式邮件, 并带有附件.
 *
 * @author calvin
 */
public class MimeMailService {

    private static final String DEFAULT_ENCODING = "utf-8";

    private static Logger logger = LoggerFactory.getLogger(MimeMailService.class);

    private JavaMailSender mailSender;

    private FreeMarkerConfigurer freeMarkerConfigurer;

    /**
     * 发送MIME格式的用户修改通知邮件.
     */
    public boolean sendNotificationMail(com.gmk.framework.common.utils.email.Email email) {
        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(msg, true, DEFAULT_ENCODING);
            //设置邮件发送地址及显示名称
            String from = Global.getConfig("productName");
            if (StringUtils.isNotEmpty(email.getFrom())) {
                from = from + "-" + email.getFrom();
            }
            helper.setFrom(Global.getConfig("mailFrom"), from);
            helper.setTo(email.getAddress());
            if (StringUtils.isNotEmpty(email.getCc())) {
                String cc[] = email.getCc().split(";");
                helper.setCc(cc);//抄送
            }
            //主题
            helper.setSubject(email.getSubject());
            //邮件内容
            if (StringUtils.isNotEmpty(email.getTemplate())) {
                String content = generateContent(email.getTemplate(), email.getContentMap());
                helper.setText(content, true);
            } else {
                helper.setText(email.getContent());
            }
            //邮件附件
            if (ListUtils.isNotEmpty(email.getAttachment())) {
                for (File file : email.getAttachment()) {
                    helper.addAttachment(MimeUtility.encodeWord(file.getName()), file);
                }
            }
            mailSender.send(msg);
            logger.info("HTML版邮件已发送");
            return true;
        } catch (MessagingException e) {
            logger.error(email.getAddressee() + "-" + email.getSubject() + "-" + "构造邮件失败", e);
        } catch (Exception e) {
            logger.error(email.getAddressee() + "-" + email.getSubject() + "-" + "发送邮件失败", e);
        }
        return false;
    }

    /**
     * 使用Freemarker生成html格式内容.
     */
    private String generateContent(String template, Map context) throws MessagingException {
        try {
            Template template1 = freeMarkerConfigurer.getConfiguration().getTemplate(template, DEFAULT_ENCODING);
            return FreeMarkerTemplateUtils.processTemplateIntoString(template1, context);
        } catch (IOException e) {
            logger.error("生成邮件内容失败, FreeMarker模板不存在", e);
            throw new MessagingException("FreeMarker模板不存在", e);
        } catch (TemplateException e) {
            logger.error("生成邮件内容失败, FreeMarker处理失败", e);
            throw new MessagingException("FreeMarker处理失败", e);
        }
    }

    /**
     * 获取classpath中的附件.
     */
    private File generateAttachment() throws MessagingException {
        try {
            Resource resource = new ClassPathResource("/email/mailAttachment.txt");
            return resource.getFile();
        } catch (IOException e) {
            logger.error("构造邮件失败,附件文件不存在", e);
            throw new MessagingException("附件文件不存在", e);
        }
    }

    /**
     * Spring的MailSender.
     */
    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    /**
     * 注入Freemarker引擎配置,构造Freemarker 邮件内容模板.
     */
    /*public void setFreemarkerConfiguration(Configuration freemarkerConfiguration) throws IOException {
        // 根据freemarkerConfiguration的templateLoaderPath载入文件.
		template = freemarkerConfiguration.getTemplate("mailTemplate.ftl", DEFAULT_ENCODING);
	}*/
    public void setFreeMarkerConfigurer(FreeMarkerConfigurer freeMarkerConfigurer) {
        this.freeMarkerConfigurer = freeMarkerConfigurer;
    }
}
