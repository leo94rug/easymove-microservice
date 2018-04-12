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
@Table(name = "viaggio_autobus", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ViaggioAutobus.findAll", query = "SELECT v FROM ViaggioAutobus v"),
    @NamedQuery(name = "ViaggioAutobus.findById", query = "SELECT v FROM ViaggioAutobus v WHERE v.id = :id"),
    @NamedQuery(name = "ViaggioAutobus.findByNome", query = "SELECT v FROM ViaggioAutobus v WHERE v.nome = :nome"),
    @NamedQuery(name = "ViaggioAutobus.findByInverso", query = "SELECT v FROM ViaggioAutobus v WHERE v.inverso = :inverso"),
    @NamedQuery(name = "ViaggioAutobus.findByData", query = "SELECT v FROM ViaggioAutobus v WHERE v.data = :data"),
    @NamedQuery(name = "ViaggioAutobus.findByStoricoFk", query = "SELECT v FROM ViaggioAutobus v WHERE v.storicoFk = :storicoFk")})
public class ViaggioAutobus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Size(max = 256)
    @Column(length = 256)
    private String nome;
    private Integer inverso;
    @Temporal(TemporalType.TIMESTAMP)
    private Date data;
    @Basic(optional = false)
    @NotNull
    @Column(name = "storico_fk", nullable = false)
    private int storicoFk;

    public ViaggioAutobus() {
    }

    public ViaggioAutobus(Integer id) {
        this.id = id;
    }

    public ViaggioAutobus(Integer id, int storicoFk) {
        this.id = id;
        this.storicoFk = storicoFk;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getInverso() {
        return inverso;
    }

    public void setInverso(Integer inverso) {
        this.inverso = inverso;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getStoricoFk() {
        return storicoFk;
    }

    public void setStoricoFk(int storicoFk) {
        this.storicoFk = storicoFk;
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
        if (!(object instanceof ViaggioAutobus)) {
            return false;
        }
        ViaggioAutobus other = (ViaggioAutobus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.ViaggioAutobus[ id=" + id + " ]";
    }
    
}
