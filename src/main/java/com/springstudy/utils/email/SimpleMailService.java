/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.springstudy.utils.email;

import com.gmk.framework.common.config.Global;
import com.gmk.framework.common.utils.email.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

/**
 * 纯文本邮件服务类.
 * 
 * @author calvin
 */
public class SimpleMailService {
	private static Logger logger = LoggerFactory.getLogger(SimpleMailService.class);

	private JavaMailSender mailSender;
	private String textTemplate;

	/**
	 * 发送纯文本的用户修改通知邮件.
	 */
	public boolean sendNotificationMail(com.gmk.framework.common.utils.email.Email email) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom(Global.getConfig("mailFrom"));
		msg.setTo(email.getAddress());
        if(StringUtils.isNotEmpty(email.getCc())){
            String cc[] = email.getCc().split(";");
            msg.setCc(cc);//抄送
        }
		msg.setSubject(email.getSubject());

		// 将用户名与当期日期格式化到邮件内容的字符串模板
//		String content = String.format(textTemplate, userName, new Date());
        String content = email.getContent();
		msg.setText(content);
		try {
			mailSender.send(msg);
			if (logger.isInfoEnabled()) {
				logger.info("纯文本邮件已发送至{}", StringUtils.join(msg.getTo(), ","));
			}
			return true;
		} catch (Exception e) {
			logger.error(email.getAddressee() + "-" + email.getSubject() + "-" + "发送邮件失败", e);
		}
		return false;
	}

	/**
	 * Spring的MailSender.
	 */
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	/**
	 * 邮件内容的字符串模板.
	 */
	public void setTextTemplate(String textTemplate) {
		this.textTemplate = textTemplate;
	}
}
