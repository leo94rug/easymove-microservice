/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import javax.mail.MessagingException;

/**
 *
 * @author leo
 */
public interface ISendEmail {

    void buildEmail(String[] params);

    void sendEmail(String[] userEmails) throws MessagingException;

    void sendEmail(String userEmail) throws MessagingException;
    
}
