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
    @NamedQuery(name = "Auto.findAll", query = "SELECT a FROM Auto a"),
    @NamedQuery(name = "Auto.findById", query = "SELECT a FROM Auto a WHERE a.id = :id"),
    @NamedQuery(name = "Auto.findByModello", query = "SELECT a FROM Auto a WHERE a.modello = :modello"),
    @NamedQuery(name = "Auto.findByMarca", query = "SELECT a FROM Auto a WHERE a.marca = :marca"),
    @NamedQuery(name = "Auto.findByColore", query = "SELECT a FROM Auto a WHERE a.colore = :colore"),
    @NamedQuery(name = "Auto.findByUtenteFk", query = "SELECT a FROM Auto a WHERE a.utenteFk = :utenteFk")})
public class Auto implements Serializable {

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
    private String modello;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String marca;
    @Size(max = 256)
    @Column(length = 256)
    private String colore;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_fk", nullable = false, length = 256)
    private String utenteFk;

    public Auto() {
    }

    public Auto(String id) {
        this.id = id;
    }

    public Auto(String id, String modello, String marca, String utenteFk) {
        this.id = id;
        this.modello = modello;
        this.marca = marca;
        this.utenteFk = utenteFk;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getModello() {
        return modello;
    }

    public void setModello(String modello) {
        this.modello = modello;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getColore() {
        return colore;
    }

    public void setColore(String colore) {
        this.colore = colore;
    }

    public String getUtenteFk() {
        return utenteFk;
    }

    public void setUtenteFk(String utenteFk) {
        this.utenteFk = utenteFk;
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
        if (!(object instanceof Auto)) {
            return false;
        }
        Auto other = (Auto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Auto[ id=" + id + " ]";
    }
    
}
