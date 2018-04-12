/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.model.dto;

import com.dayelostraco.microservice.model.entity.Utente;

/**
 *
 * @author leo
 */
public class UtenteDTO {

    private String id;
    private String email;
    private String nome;
    private String cognome;
    private String psw;
    private String professione;
    private String annoNascita;
    private String telefono1;
    private String telefono2;
    private String biografia;
    private String fotoUtente;
    private String imagePath;
    private String sesso;
    private Integer fumare;
    private Integer animali;
    private int tipo;
    private Double mediaFeedback;
    private String data;
    public String token;
    public int eta;
    public String nomeCognome;



    public String getNomeCognome() {
        return nomeCognome;
    }

    public void setNomeCognome(String nomeCognome) {
        this.nomeCognome = nomeCognome;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getProfessione() {
        return professione;
    }

    public void setProfessione(String professione) {
        this.professione = professione;
    }

    public String getAnnoNascita() {
        return annoNascita;
    }

    public void setAnnoNascita(String annoNascita) {
        this.annoNascita = annoNascita;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getFotoUtente() {
        return fotoUtente;
    }

    public void setFotoUtente(String fotoUtente) {
        this.fotoUtente = fotoUtente;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getSesso() {
        return sesso;
    }

    public void setSesso(String sesso) {
        this.sesso = sesso;
    }

    public Integer getFumare() {
        return fumare;
    }

    public void setFumare(Integer fumare) {
        this.fumare = fumare;
    }

    public Integer getAnimali() {
        return animali;
    }

    public void setAnimali(Integer animali) {
        this.animali = animali;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Double getMediaFeedback() {
        return mediaFeedback;
    }

    public void setMediaFeedback(Double mediaFeedback) {
        this.mediaFeedback = mediaFeedback;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getEta() {
        return eta;
    }

    public void setEta(int eta) {
        this.eta = eta;
    }


}
