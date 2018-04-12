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
@Table(name = "tratta_auto", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TrattaAuto.findAll", query = "SELECT t FROM TrattaAuto t"),
    @NamedQuery(name = "TrattaAuto.findById", query = "SELECT t FROM TrattaAuto t WHERE t.id = :id"),
    @NamedQuery(name = "TrattaAuto.findByOrarioPartenza", query = "SELECT t FROM TrattaAuto t WHERE t.orarioPartenza = :orarioPartenza"),
    @NamedQuery(name = "TrattaAuto.findByEnumerazione", query = "SELECT t FROM TrattaAuto t WHERE t.enumerazione = :enumerazione"),
    @NamedQuery(name = "TrattaAuto.findByData", query = "SELECT t FROM TrattaAuto t WHERE t.data = :data"),
    @NamedQuery(name = "TrattaAuto.findByViaggioFk", query = "SELECT t FROM TrattaAuto t WHERE t.viaggioFk = :viaggioFk"),
    @NamedQuery(name = "TrattaAuto.findByPrezzo", query = "SELECT t FROM TrattaAuto t WHERE t.prezzo = :prezzo"),
    @NamedQuery(name = "TrattaAuto.findByDistanza", query = "SELECT t FROM TrattaAuto t WHERE t.distanza = :distanza"),
    @NamedQuery(name = "TrattaAuto.findByPosti", query = "SELECT t FROM TrattaAuto t WHERE t.posti = :posti"),
    @NamedQuery(name = "TrattaAuto.findByLatPartenza", query = "SELECT t FROM TrattaAuto t WHERE t.latPartenza = :latPartenza"),
    @NamedQuery(name = "TrattaAuto.findByLngPartenza", query = "SELECT t FROM TrattaAuto t WHERE t.lngPartenza = :lngPartenza"),
    @NamedQuery(name = "TrattaAuto.findByLatArrivo", query = "SELECT t FROM TrattaAuto t WHERE t.latArrivo = :latArrivo"),
    @NamedQuery(name = "TrattaAuto.findByLngArrivo", query = "SELECT t FROM TrattaAuto t WHERE t.lngArrivo = :lngArrivo"),
    @NamedQuery(name = "TrattaAuto.findByDenominazionePartenza", query = "SELECT t FROM TrattaAuto t WHERE t.denominazionePartenza = :denominazionePartenza"),
    @NamedQuery(name = "TrattaAuto.findByDenominazioneArrivo", query = "SELECT t FROM TrattaAuto t WHERE t.denominazioneArrivo = :denominazioneArrivo")})
public class TrattaAuto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "orario_partenza", nullable = false, length = 256)
    private String orarioPartenza;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int enumerazione;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String data;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "viaggio_fk", nullable = false, length = 256)
    private String viaggioFk;
    private Integer prezzo;
    private Integer distanza;
    private Integer posti;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lat_partenza", nullable = false)
    private double latPartenza;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lng_partenza", nullable = false)
    private double lngPartenza;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lat_arrivo", nullable = false)
    private double latArrivo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lng_arrivo", nullable = false)
    private double lngArrivo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "denominazione_partenza", nullable = false, length = 256)
    private String denominazionePartenza;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "denominazione_arrivo", nullable = false, length = 256)
    private String denominazioneArrivo;

    public TrattaAuto() {
    }

    public TrattaAuto(String id) {
        this.id = id;
    }

    public TrattaAuto(String id, String orarioPartenza, int enumerazione, String data, String viaggioFk, double latPartenza, double lngPartenza, double latArrivo, double lngArrivo, String denominazionePartenza, String denominazioneArrivo) {
        this.id = id;
        this.orarioPartenza = orarioPartenza;
        this.enumerazione = enumerazione;
        this.data = data;
        this.viaggioFk = viaggioFk;
        this.latPartenza = latPartenza;
        this.lngPartenza = lngPartenza;
        this.latArrivo = latArrivo;
        this.lngArrivo = lngArrivo;
        this.denominazionePartenza = denominazionePartenza;
        this.denominazioneArrivo = denominazioneArrivo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrarioPartenza() {
        return orarioPartenza;
    }

    public void setOrarioPartenza(String orarioPartenza) {
        this.orarioPartenza = orarioPartenza;
    }

    public int getEnumerazione() {
        return enumerazione;
    }

    public void setEnumerazione(int enumerazione) {
        this.enumerazione = enumerazione;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getViaggioFk() {
        return viaggioFk;
    }

    public void setViaggioFk(String viaggioFk) {
        this.viaggioFk = viaggioFk;
    }

    public Integer getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Integer prezzo) {
        this.prezzo = prezzo;
    }

    public Integer getDistanza() {
        return distanza;
    }

    public void setDistanza(Integer distanza) {
        this.distanza = distanza;
    }

    public Integer getPosti() {
        return posti;
    }

    public void setPosti(Integer posti) {
        this.posti = posti;
    }

    public double getLatPartenza() {
        return latPartenza;
    }

    public void setLatPartenza(double latPartenza) {
        this.latPartenza = latPartenza;
    }

    public double getLngPartenza() {
        return lngPartenza;
    }

    public void setLngPartenza(double lngPartenza) {
        this.lngPartenza = lngPartenza;
    }

    public double getLatArrivo() {
        return latArrivo;
    }

    public void setLatArrivo(double latArrivo) {
        this.latArrivo = latArrivo;
    }

    public double getLngArrivo() {
        return lngArrivo;
    }

    public void setLngArrivo(double lngArrivo) {
        this.lngArrivo = lngArrivo;
    }

    public String getDenominazionePartenza() {
        return denominazionePartenza;
    }

    public void setDenominazionePartenza(String denominazionePartenza) {
        this.denominazionePartenza = denominazionePartenza;
    }

    public String getDenominazioneArrivo() {
        return denominazioneArrivo;
    }

    public void setDenominazioneArrivo(String denominazioneArrivo) {
        this.denominazioneArrivo = denominazioneArrivo;
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
        if (!(object instanceof TrattaAuto)) {
            return false;
        }
        TrattaAuto other = (TrattaAuto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.TrattaAuto[ id=" + id + " ]";
    }
    
}
