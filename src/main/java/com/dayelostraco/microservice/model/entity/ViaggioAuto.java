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
@Table(name = "viaggio_auto", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ViaggioAuto.findAll", query = "SELECT v FROM ViaggioAuto v"),
    @NamedQuery(name = "ViaggioAuto.findById", query = "SELECT v FROM ViaggioAuto v WHERE v.id = :id"),
    @NamedQuery(name = "ViaggioAuto.findByAuto", query = "SELECT v FROM ViaggioAuto v WHERE v.auto = :auto"),
    @NamedQuery(name = "ViaggioAuto.findByDescrizione", query = "SELECT v FROM ViaggioAuto v WHERE v.descrizione = :descrizione"),
    @NamedQuery(name = "ViaggioAuto.findByRitardoMax", query = "SELECT v FROM ViaggioAuto v WHERE v.ritardoMax = :ritardoMax"),
    @NamedQuery(name = "ViaggioAuto.findByBagaglioMax", query = "SELECT v FROM ViaggioAuto v WHERE v.bagaglioMax = :bagaglioMax"),
    @NamedQuery(name = "ViaggioAuto.findByDisponibilitaDeviazioni", query = "SELECT v FROM ViaggioAuto v WHERE v.disponibilitaDeviazioni = :disponibilitaDeviazioni"),
    @NamedQuery(name = "ViaggioAuto.findByRipetitivo", query = "SELECT v FROM ViaggioAuto v WHERE v.ripetitivo = :ripetitivo"),
    @NamedQuery(name = "ViaggioAuto.findByUtenteFk", query = "SELECT v FROM ViaggioAuto v WHERE v.utenteFk = :utenteFk"),
    @NamedQuery(name = "ViaggioAuto.findByData", query = "SELECT v FROM ViaggioAuto v WHERE v.data = :data"),
    @NamedQuery(name = "ViaggioAuto.findByTipologia", query = "SELECT v FROM ViaggioAuto v WHERE v.tipologia = :tipologia"),
    @NamedQuery(name = "ViaggioAuto.findByVisibile", query = "SELECT v FROM ViaggioAuto v WHERE v.visibile = :visibile")})
public class ViaggioAuto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String id;
    @Size(max = 256)
    @Column(length = 256)
    private String auto;
    @Size(max = 256)
    @Column(length = 256)
    private String descrizione;
    @Size(max = 256)
    @Column(name = "ritardo_max", length = 256)
    private String ritardoMax;
    @Size(max = 256)
    @Column(name = "bagaglio_max", length = 256)
    private String bagaglioMax;
    @Size(max = 256)
    @Column(name = "disponibilita_deviazioni", length = 256)
    private String disponibilitaDeviazioni;
    private Integer ripetitivo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_fk", nullable = false, length = 256)
    private String utenteFk;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String data;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int tipologia;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int visibile;

    public ViaggioAuto() {
    }

    public ViaggioAuto(String id) {
        this.id = id;
    }

    public ViaggioAuto(String id, String utenteFk, String data, int tipologia, int visibile) {
        this.id = id;
        this.utenteFk = utenteFk;
        this.data = data;
        this.tipologia = tipologia;
        this.visibile = visibile;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAuto() {
        return auto;
    }

    public void setAuto(String auto) {
        this.auto = auto;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getRitardoMax() {
        return ritardoMax;
    }

    public void setRitardoMax(String ritardoMax) {
        this.ritardoMax = ritardoMax;
    }

    public String getBagaglioMax() {
        return bagaglioMax;
    }

    public void setBagaglioMax(String bagaglioMax) {
        this.bagaglioMax = bagaglioMax;
    }

    public String getDisponibilitaDeviazioni() {
        return disponibilitaDeviazioni;
    }

    public void setDisponibilitaDeviazioni(String disponibilitaDeviazioni) {
        this.disponibilitaDeviazioni = disponibilitaDeviazioni;
    }

    public Integer getRipetitivo() {
        return ripetitivo;
    }

    public void setRipetitivo(Integer ripetitivo) {
        this.ripetitivo = ripetitivo;
    }

    public String getUtenteFk() {
        return utenteFk;
    }

    public void setUtenteFk(String utenteFk) {
        this.utenteFk = utenteFk;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getTipologia() {
        return tipologia;
    }

    public void setTipologia(int tipologia) {
        this.tipologia = tipologia;
    }

    public int getVisibile() {
        return visibile;
    }

    public void setVisibile(int visibile) {
        this.visibile = visibile;
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
        if (!(object instanceof ViaggioAuto)) {
            return false;
        }
        ViaggioAuto other = (ViaggioAuto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.ViaggioAuto[ id=" + id + " ]";
    }
    
}
