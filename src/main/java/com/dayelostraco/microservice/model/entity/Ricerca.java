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
@Table(catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ricerca.findAll", query = "SELECT r FROM Ricerca r"),
    @NamedQuery(name = "Ricerca.findById", query = "SELECT r FROM Ricerca r WHERE r.id = :id"),
    @NamedQuery(name = "Ricerca.findByLatP", query = "SELECT r FROM Ricerca r WHERE r.latP = :latP"),
    @NamedQuery(name = "Ricerca.findByLatA", query = "SELECT r FROM Ricerca r WHERE r.latA = :latA"),
    @NamedQuery(name = "Ricerca.findByLngP", query = "SELECT r FROM Ricerca r WHERE r.lngP = :lngP"),
    @NamedQuery(name = "Ricerca.findByLngA", query = "SELECT r FROM Ricerca r WHERE r.lngA = :lngA"),
    @NamedQuery(name = "Ricerca.findByCambio", query = "SELECT r FROM Ricerca r WHERE r.cambio = :cambio"),
    @NamedQuery(name = "Ricerca.findByDateSearch", query = "SELECT r FROM Ricerca r WHERE r.dateSearch = :dateSearch"),
    @NamedQuery(name = "Ricerca.findByDistanza", query = "SELECT r FROM Ricerca r WHERE r.distanza = :distanza"),
    @NamedQuery(name = "Ricerca.findByDistanzaTra", query = "SELECT r FROM Ricerca r WHERE r.distanzaTra = :distanzaTra"),
    @NamedQuery(name = "Ricerca.findByTipo", query = "SELECT r FROM Ricerca r WHERE r.tipo = :tipo"),
    @NamedQuery(name = "Ricerca.findByUtenteFk", query = "SELECT r FROM Ricerca r WHERE r.utenteFk = :utenteFk"),
    @NamedQuery(name = "Ricerca.findByDate", query = "SELECT r FROM Ricerca r WHERE r.date = :date")})
public class Ricerca implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lat_p", nullable = false)
    private double latP;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lat_a", nullable = false)
    private double latA;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lng_p", nullable = false)
    private double lngP;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lng_a", nullable = false)
    private double lngA;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int cambio;
    @Size(max = 256)
    @Column(name = "date_search", length = 256)
    private String dateSearch;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int distanza;
    @Basic(optional = false)
    @NotNull
    @Column(name = "distanza_tra", nullable = false)
    private int distanzaTra;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int tipo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_fk", nullable = false, length = 256)
    private String utenteFk;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String date;

    public Ricerca() {
    }

    public Ricerca(String id) {
        this.id = id;
    }

    public Ricerca(String id, double latP, double latA, double lngP, double lngA, int cambio, int distanza, int distanzaTra, int tipo, String utenteFk, String date) {
        this.id = id;
        this.latP = latP;
        this.latA = latA;
        this.lngP = lngP;
        this.lngA = lngA;
        this.cambio = cambio;
        this.distanza = distanza;
        this.distanzaTra = distanzaTra;
        this.tipo = tipo;
        this.utenteFk = utenteFk;
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getLatP() {
        return latP;
    }

    public void setLatP(double latP) {
        this.latP = latP;
    }

    public double getLatA() {
        return latA;
    }

    public void setLatA(double latA) {
        this.latA = latA;
    }

    public double getLngP() {
        return lngP;
    }

    public void setLngP(double lngP) {
        this.lngP = lngP;
    }

    public double getLngA() {
        return lngA;
    }

    public void setLngA(double lngA) {
        this.lngA = lngA;
    }

    public int getCambio() {
        return cambio;
    }

    public void setCambio(int cambio) {
        this.cambio = cambio;
    }

    public String getDateSearch() {
        return dateSearch;
    }

    public void setDateSearch(String dateSearch) {
        this.dateSearch = dateSearch;
    }

    public int getDistanza() {
        return distanza;
    }

    public void setDistanza(int distanza) {
        this.distanza = distanza;
    }

    public int getDistanzaTra() {
        return distanzaTra;
    }

    public void setDistanzaTra(int distanzaTra) {
        this.distanzaTra = distanzaTra;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getUtenteFk() {
        return utenteFk;
    }

    public void setUtenteFk(String utenteFk) {
        this.utenteFk = utenteFk;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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
        if (!(object instanceof Ricerca)) {
            return false;
        }
        Ricerca other = (Ricerca) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Ricerca[ id=" + id + " ]";
    }
    
}
