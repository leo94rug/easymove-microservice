/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

/**
 *
 * @author leo
 */
public interface ICrypt {
    String encrypt(String strClearText) throws Exception;

    String decrypt(String strEncrypted) throws Exception;
}
