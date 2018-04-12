/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import com.dayelostraco.microservice.model.dto.UtenteDTO;
import com.dayelostraco.microservice.model.entity.Utente;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.concurrent.ExecutionException;
import javax.naming.NamingException;

/**
 *
 * @author leo
 */
public interface UserService {
    
    void deleteUser(String id);

    boolean existingUser(String email)throws InterruptedException, ExecutionException;

    Utente formalize(Utente utente) throws CloneNotSupportedException, Exception;

    //String getFermataSuccessiva(int i, String viaggio_fk) throws SQLException;

    String getNomeCognome(String id) throws SQLException;

    //int getTravelNumber(String id, Date date) throws SQLException;

    UtenteDTO getUtente(String id) throws SQLException, ParseException;

    Utente getUtenteByEmail(String email) throws InterruptedException, ExecutionException;

    void insert(Utente utenteRqt)throws Exception;

    int setPassword(String id, String psw) throws SQLException, Exception;

    int updateUser(Utente anagrafica, String id) throws SQLException;

    void updateUserEmailStatus(String id) throws SQLException;

    int updateUtenteImage(String id, String immagine, String path) throws SQLException;

    boolean userConfirm(String email) throws SQLException;
    
}
