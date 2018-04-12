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
    @NamedQuery(name = "Posizione.findAll", query = "SELECT p FROM Posizione p"),
    @NamedQuery(name = "Posizione.findById", query = "SELECT p FROM Posizione p WHERE p.id = :id"),
    @NamedQuery(name = "Posizione.findByNome", query = "SELECT p FROM Posizione p WHERE p.nome = :nome"),
    @NamedQuery(name = "Posizione.findByLat", query = "SELECT p FROM Posizione p WHERE p.lat = :lat"),
    @NamedQuery(name = "Posizione.findByLng", query = "SELECT p FROM Posizione p WHERE p.lng = :lng")})
public class Posizione implements Serializable {

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
    @Column(nullable = false, length = 256)
    private String nome;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private double lat;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private double lng;
    @Lob
    @Size(max = 65535)
    @Column(name = "address_components", length = 65535)
    private String addressComponents;

    public Posizione() {
    }

    public Posizione(String id) {
        this.id = id;
    }

    public Posizione(String id, String nome, double lat, double lng) {
        this.id = id;
        this.nome = nome;
        this.lat = lat;
        this.lng = lng;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public String getAddressComponents() {
        return addressComponents;
    }

    public void setAddressComponents(String addressComponents) {
        this.addressComponents = addressComponents;
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
        if (!(object instanceof Posizione)) {
            return false;
        }
        Posizione other = (Posizione) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Posizione[ id=" + id + " ]";
    }
    
}
