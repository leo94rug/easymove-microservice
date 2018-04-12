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
@Table(name = "viaggio_auto_tipologia", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ViaggioAutoTipologia.findAll", query = "SELECT v FROM ViaggioAutoTipologia v"),
    @NamedQuery(name = "ViaggioAutoTipologia.findById", query = "SELECT v FROM ViaggioAutoTipologia v WHERE v.id = :id"),
    @NamedQuery(name = "ViaggioAutoTipologia.findByValore", query = "SELECT v FROM ViaggioAutoTipologia v WHERE v.valore = :valore"),
    @NamedQuery(name = "ViaggioAutoTipologia.findByDescrizione", query = "SELECT v FROM ViaggioAutoTipologia v WHERE v.descrizione = :descrizione")})
public class ViaggioAutoTipologia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String valore;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String descrizione;

    public ViaggioAutoTipologia() {
    }

    public ViaggioAutoTipologia(Integer id) {
        this.id = id;
    }

    public ViaggioAutoTipologia(Integer id, String valore, String descrizione) {
        this.id = id;
        this.valore = valore;
        this.descrizione = descrizione;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValore() {
        return valore;
    }

    public void setValore(String valore) {
        this.valore = valore;
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
        if (!(object instanceof ViaggioAutoTipologia)) {
            return false;
        }
        ViaggioAutoTipologia other = (ViaggioAutoTipologia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.ViaggioAutoTipologia[ id=" + id + " ]";
    }
    
}
