/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */
@Service("msgfactoryService")

public class MsgFactory implements IMsgFactory {


    @Override
    public ISendEmail getBuildedEmail(IMsgFactory.type type){
        switch(type){
            case CambiaPassword : {
                return (ISendEmail) new SendEmailCambiaPassword();
            }            
            case ConfermaRegistrazione : {
                return (ISendEmail) new SendEmailConfermaRegistrazione();
            }
            default : {
                return null;
            }
        }
    }
    
}
