/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.model.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
    @NamedQuery(name = "Relazione.findAll", query = "SELECT r FROM Relazione r"),
    @NamedQuery(name = "Relazione.findByUtente1", query = "SELECT r FROM Relazione r WHERE r.relazionePK.utente1 = :utente1"),
    @NamedQuery(name = "Relazione.findByUtente2", query = "SELECT r FROM Relazione r WHERE r.relazionePK.utente2 = :utente2"),
    @NamedQuery(name = "Relazione.findByApprovato", query = "SELECT r FROM Relazione r WHERE r.approvato = :approvato"),
    @NamedQuery(name = "Relazione.findByRaccomandato", query = "SELECT r FROM Relazione r WHERE r.raccomandato = :raccomandato"),
    @NamedQuery(name = "Relazione.findByDaValutare", query = "SELECT r FROM Relazione r WHERE r.daValutare = :daValutare"),
    @NamedQuery(name = "Relazione.findByDaValutareData", query = "SELECT r FROM Relazione r WHERE r.daValutareData = :daValutareData")})
public class Relazione implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected RelazionePK relazionePK;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int approvato;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int raccomandato;
    @Basic(optional = false)
    @NotNull
    @Column(name = "da_valutare", nullable = false)
    private int daValutare;
    @Size(max = 256)
    @Column(name = "da_valutare_data", length = 256)
    private String daValutareData;

    public Relazione() {
    }

    public Relazione(RelazionePK relazionePK) {
        this.relazionePK = relazionePK;
    }

    public Relazione(RelazionePK relazionePK, int approvato, int raccomandato, int daValutare) {
        this.relazionePK = relazionePK;
        this.approvato = approvato;
        this.raccomandato = raccomandato;
        this.daValutare = daValutare;
    }

    public Relazione(String utente1, String utente2) {
        this.relazionePK = new RelazionePK(utente1, utente2);
    }

    public RelazionePK getRelazionePK() {
        return relazionePK;
    }

    public void setRelazionePK(RelazionePK relazionePK) {
        this.relazionePK = relazionePK;
    }

    public int getApprovato() {
        return approvato;
    }

    public void setApprovato(int approvato) {
        this.approvato = approvato;
    }

    public int getRaccomandato() {
        return raccomandato;
    }

    public void setRaccomandato(int raccomandato) {
        this.raccomandato = raccomandato;
    }

    public int getDaValutare() {
        return daValutare;
    }

    public void setDaValutare(int daValutare) {
        this.daValutare = daValutare;
    }

    public String getDaValutareData() {
        return daValutareData;
    }

    public void setDaValutareData(String daValutareData) {
        this.daValutareData = daValutareData;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (relazionePK != null ? relazionePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Relazione)) {
            return false;
        }
        Relazione other = (Relazione) object;
        if ((this.relazionePK == null && other.relazionePK != null) || (this.relazionePK != null && !this.relazionePK.equals(other.relazionePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Relazione[ relazionePK=" + relazionePK + " ]";
    }
    
}
