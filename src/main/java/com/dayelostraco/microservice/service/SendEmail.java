/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import javax.mail.MessagingException;
import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */
@Service("sendemailService")

public class SendEmail implements ISendEmail {

    private String content;
    private String subject;

    @Override
    public void buildEmail( String[] params) {
        content = String.format(content, (Object[]) params);
    }

    @Override
    public void sendEmail(String[] userEmails) throws MessagingException {
        MsgSender message = new MsgSender();
        message.sendTextMessage(content, subject, userEmails);
    }    
    @Override
    public void sendEmail(String userEmail) throws MessagingException {
        MsgSender message = new MsgSender();
        message.sendTextMessage(content, subject, new String[]{userEmail});
    }

    protected void setContent(String content) {
        this.content = content;
    }

    protected void setSubject(String subject) {
        this.subject = subject;
    }
    
}
