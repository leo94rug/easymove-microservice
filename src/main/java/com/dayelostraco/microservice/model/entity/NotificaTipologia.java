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
@Table(name = "notifica_tipologia", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NotificaTipologia.findAll", query = "SELECT n FROM NotificaTipologia n"),
    @NamedQuery(name = "NotificaTipologia.findByIdTipologia", query = "SELECT n FROM NotificaTipologia n WHERE n.idTipologia = :idTipologia"),
    @NamedQuery(name = "NotificaTipologia.findByValore", query = "SELECT n FROM NotificaTipologia n WHERE n.valore = :valore"),
    @NamedQuery(name = "NotificaTipologia.findByDescrizione", query = "SELECT n FROM NotificaTipologia n WHERE n.descrizione = :descrizione"),
    @NamedQuery(name = "NotificaTipologia.findByBottone1", query = "SELECT n FROM NotificaTipologia n WHERE n.bottone1 = :bottone1"),
    @NamedQuery(name = "NotificaTipologia.findByBottone2", query = "SELECT n FROM NotificaTipologia n WHERE n.bottone2 = :bottone2"),
    @NamedQuery(name = "NotificaTipologia.findByTitolo", query = "SELECT n FROM NotificaTipologia n WHERE n.titolo = :titolo")})
public class NotificaTipologia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_tipologia", nullable = false)
    private Integer idTipologia;
    @Size(max = 256)
    @Column(length = 256)
    private String valore;
    @Size(max = 256)
    @Column(length = 256)
    private String descrizione;
    @Size(max = 256)
    @Column(name = "bottone_1", length = 256)
    private String bottone1;
    @Size(max = 256)
    @Column(name = "bottone_2", length = 256)
    private String bottone2;
    @Size(max = 256)
    @Column(length = 256)
    private String titolo;

    public NotificaTipologia() {
    }

    public NotificaTipologia(Integer idTipologia) {
        this.idTipologia = idTipologia;
    }

    public Integer getIdTipologia() {
        return idTipologia;
    }

    public void setIdTipologia(Integer idTipologia) {
        this.idTipologia = idTipologia;
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

    public String getBottone1() {
        return bottone1;
    }

    public void setBottone1(String bottone1) {
        this.bottone1 = bottone1;
    }

    public String getBottone2() {
        return bottone2;
    }

    public void setBottone2(String bottone2) {
        this.bottone2 = bottone2;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipologia != null ? idTipologia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NotificaTipologia)) {
            return false;
        }
        NotificaTipologia other = (NotificaTipologia) object;
        if ((this.idTipologia == null && other.idTipologia != null) || (this.idTipologia != null && !this.idTipologia.equals(other.idTipologia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.NotificaTipologia[ idTipologia=" + idTipologia + " ]";
    }
    
}
