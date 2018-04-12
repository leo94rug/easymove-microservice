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
@Table(name = "utente_tipologia", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UtenteTipologia.findAll", query = "SELECT u FROM UtenteTipologia u"),
    @NamedQuery(name = "UtenteTipologia.findById", query = "SELECT u FROM UtenteTipologia u WHERE u.id = :id"),
    @NamedQuery(name = "UtenteTipologia.findByDescrizione", query = "SELECT u FROM UtenteTipologia u WHERE u.descrizione = :descrizione")})
public class UtenteTipologia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer id;
    @Size(max = 256)
    @Column(length = 256)
    private String descrizione;

    public UtenteTipologia() {
    }

    public UtenteTipologia(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
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
        if (!(object instanceof UtenteTipologia)) {
            return false;
        }
        UtenteTipologia other = (UtenteTipologia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.UtenteTipologia[ id=" + id + " ]";
    }
    
}
