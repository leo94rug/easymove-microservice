/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.model.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    @NamedQuery(name = "Messaggio.findAll", query = "SELECT m FROM Messaggio m"),
    @NamedQuery(name = "Messaggio.findById", query = "SELECT m FROM Messaggio m WHERE m.id = :id"),
    @NamedQuery(name = "Messaggio.findByOraData", query = "SELECT m FROM Messaggio m WHERE m.oraData = :oraData"),
    @NamedQuery(name = "Messaggio.findByViaggio", query = "SELECT m FROM Messaggio m WHERE m.viaggio = :viaggio"),
    @NamedQuery(name = "Messaggio.findByUtente", query = "SELECT m FROM Messaggio m WHERE m.utente = :utente")})
public class Messaggio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(nullable = false, length = 2147483647)
    private String testo;
    @Column(name = "ora_data")
    @Temporal(TemporalType.TIMESTAMP)
    private Date oraData;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int viaggio;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int utente;

    public Messaggio() {
    }

    public Messaggio(Integer id) {
        this.id = id;
    }

    public Messaggio(Integer id, String testo, int viaggio, int utente) {
        this.id = id;
        this.testo = testo;
        this.viaggio = viaggio;
        this.utente = utente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public Date getOraData() {
        return oraData;
    }

    public void setOraData(Date oraData) {
        this.oraData = oraData;
    }

    public int getViaggio() {
        return viaggio;
    }

    public void setViaggio(int viaggio) {
        this.viaggio = viaggio;
    }

    public int getUtente() {
        return utente;
    }

    public void setUtente(int utente) {
        this.utente = utente;
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
        if (!(object instanceof Messaggio)) {
            return false;
        }
        Messaggio other = (Messaggio) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Messaggio[ id=" + id + " ]";
    }
    
}
