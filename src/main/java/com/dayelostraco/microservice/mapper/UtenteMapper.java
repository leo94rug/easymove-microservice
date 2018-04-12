/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.mapper;

import com.dayelostraco.microservice.model.dto.UtenteDTO;
import com.dayelostraco.microservice.model.entity.Utente;
import com.dayelostraco.microservice.service.IDateString;
import com.dayelostraco.microservice.service.Ijwt;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */
@Service("utenteMapper")

public class UtenteMapper implements IUtenteMapper {

    @Autowired
    @Qualifier("jwtService")
    Ijwt jwtService;
    @Autowired
    @Qualifier("dateService")
    IDateString dateString;

    @Override
    public UtenteDTO getDTO(Utente utente) throws ParseException, UnsupportedEncodingException {
        UtenteDTO utenteDTO = new UtenteDTO();
        utenteDTO.setId(utente.getId());
        utenteDTO.setEmail(utente.getEmail());
        utenteDTO.setNome(utente.getNome());
        utenteDTO.setCognome(utente.getCognome());
        utenteDTO.setProfessione(utente.getProfessione());
        utenteDTO.setAnnoNascita(utente.getAnnoNascita());
        utenteDTO.setTelefono1(utente.getTelefono1());
        utenteDTO.setBiografia(utente.getBiografia());
        utenteDTO.setFotoUtente(utente.getFotoUtente());
        utenteDTO.setSesso(utente.getSesso());
        utenteDTO.setTipo(utente.getTipo());
        utenteDTO.setMediaFeedback(utente.getMediaFeedback());
        utenteDTO.setToken(jwtService.encodeToken(utente.getId()));
        utenteDTO.setEta(dateString.calcoloEta(utente.getAnnoNascita()));
        utenteDTO.setNomeCognome(utente.getNome() + " " + utente.getCognome());
        return utenteDTO;
    }   
    @Override
    public Utente getDAO(UtenteDTO utenteDTO) throws ParseException, UnsupportedEncodingException {
        Utente utente = new Utente();
        utente.setEmail(utenteDTO.getEmail());
        utente.setNome(utenteDTO.getNome());
        utente.setCognome(utenteDTO.getCognome());
        utente.setProfessione(utenteDTO.getProfessione());
        utente.setAnnoNascita(utenteDTO.getAnnoNascita());
        utente.setTelefono1(utenteDTO.getTelefono1());
        utente.setBiografia(utenteDTO.getBiografia());
        utente.setFotoUtente(utenteDTO.getFotoUtente());
        utente.setSesso(utenteDTO.getSesso());
        utente.setTipo(utenteDTO.getTipo());
        utente.setMediaFeedback(utenteDTO.getMediaFeedback());
        return utente;
    }
}
