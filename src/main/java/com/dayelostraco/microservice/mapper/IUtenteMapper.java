/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.mapper;

import com.dayelostraco.microservice.model.dto.UtenteDTO;
import com.dayelostraco.microservice.model.entity.Utente;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;

/**
 *
 * @author leo
 */
public interface IUtenteMapper {

    Utente getDAO(UtenteDTO utenteDTO) throws ParseException, UnsupportedEncodingException;

    UtenteDTO getDTO(Utente utente) throws ParseException, UnsupportedEncodingException;
    
}
