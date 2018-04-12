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
@Table(name = "notifica_stato", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NotificaStato.findAll", query = "SELECT n FROM NotificaStato n"),
    @NamedQuery(name = "NotificaStato.findById", query = "SELECT n FROM NotificaStato n WHERE n.id = :id"),
    @NamedQuery(name = "NotificaStato.findByValore", query = "SELECT n FROM NotificaStato n WHERE n.valore = :valore"),
    @NamedQuery(name = "NotificaStato.findByDescrizione", query = "SELECT n FROM NotificaStato n WHERE n.descrizione = :descrizione")})
public class NotificaStato implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer id;
    @Size(max = 256)
    @Column(length = 256)
    private String valore;
    @Size(max = 256)
    @Column(length = 256)
    private String descrizione;

    public NotificaStato() {
    }

    public NotificaStato(Integer id) {
        this.id = id;
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
        if (!(object instanceof NotificaStato)) {
            return false;
        }
        NotificaStato other = (NotificaStato) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.NotificaStato[ id=" + id + " ]";
    }
    
}
