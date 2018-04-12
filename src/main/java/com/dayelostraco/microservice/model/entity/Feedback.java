/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.model.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author leo
 */
@Entity
@Table(catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedback.findAll", query = "SELECT f FROM Feedback f"),
    @NamedQuery(name = "Feedback.findById", query = "SELECT f FROM Feedback f WHERE f.id = :id"),
    @NamedQuery(name = "Feedback.findByValutazioneGuida", query = "SELECT f FROM Feedback f WHERE f.valutazioneGuida = :valutazioneGuida"),
    @NamedQuery(name = "Feedback.findByValutazionePuntualita", query = "SELECT f FROM Feedback f WHERE f.valutazionePuntualita = :valutazionePuntualita"),
    @NamedQuery(name = "Feedback.findByValutazioneDisponibilita", query = "SELECT f FROM Feedback f WHERE f.valutazioneDisponibilita = :valutazioneDisponibilita"),
    @NamedQuery(name = "Feedback.findByData", query = "SELECT f FROM Feedback f WHERE f.data = :data"),
    @NamedQuery(name = "Feedback.findByUtenteRecensore", query = "SELECT f FROM Feedback f WHERE f.utenteRecensore = :utenteRecensore"),
    @NamedQuery(name = "Feedback.findByUtenteRecensito", query = "SELECT f FROM Feedback f WHERE f.utenteRecensito = :utenteRecensito")})
public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String id;
    @Column(name = "valutazione_guida")
    private Integer valutazioneGuida;
    @Column(name = "valutazione_puntualita")
    private Integer valutazionePuntualita;
    @Column(name = "valutazione_disponibilita")
    private Integer valutazioneDisponibilita;
    @Lob
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String testo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String data;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_recensore", nullable = false, length = 256)
    private String utenteRecensore;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_recensito", nullable = false, length = 256)
    private String utenteRecensito;

    public Feedback() {
    }

    public Feedback(String id) {
        this.id = id;
    }

    public Feedback(String id, String data, String utenteRecensore, String utenteRecensito) {
        this.id = id;
        this.data = data;
        this.utenteRecensore = utenteRecensore;
        this.utenteRecensito = utenteRecensito;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getValutazioneGuida() {
        return valutazioneGuida;
    }

    public void setValutazioneGuida(Integer valutazioneGuida) {
        this.valutazioneGuida = valutazioneGuida;
    }

    public Integer getValutazionePuntualita() {
        return valutazionePuntualita;
    }

    public void setValutazionePuntualita(Integer valutazionePuntualita) {
        this.valutazionePuntualita = valutazionePuntualita;
    }

    public Integer getValutazioneDisponibilita() {
        return valutazioneDisponibilita;
    }

    public void setValutazioneDisponibilita(Integer valutazioneDisponibilita) {
        this.valutazioneDisponibilita = valutazioneDisponibilita;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getUtenteRecensore() {
        return utenteRecensore;
    }

    public void setUtenteRecensore(String utenteRecensore) {
        this.utenteRecensore = utenteRecensore;
    }

    public String getUtenteRecensito() {
        return utenteRecensito;
    }

    public void setUtenteRecensito(String utenteRecensito) {
        this.utenteRecensito = utenteRecensito;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Feedback[ id=" + id + " ]";
    }
    
}
