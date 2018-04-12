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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author leo
 */
@Entity
@Table(name = "tratta_autobus", catalog = "easymove", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TrattaAutobus.findAll", query = "SELECT t FROM TrattaAutobus t"),
    @NamedQuery(name = "TrattaAutobus.findById", query = "SELECT t FROM TrattaAutobus t WHERE t.id = :id"),
    @NamedQuery(name = "TrattaAutobus.findByFermataPrecedente", query = "SELECT t FROM TrattaAutobus t WHERE t.fermataPrecedente = :fermataPrecedente"),
    @NamedQuery(name = "TrattaAutobus.findByFermataSuccessiva", query = "SELECT t FROM TrattaAutobus t WHERE t.fermataSuccessiva = :fermataSuccessiva"),
    @NamedQuery(name = "TrattaAutobus.findByAutobusFk", query = "SELECT t FROM TrattaAutobus t WHERE t.autobusFk = :autobusFk"),
    @NamedQuery(name = "TrattaAutobus.findByProssimaTratta", query = "SELECT t FROM TrattaAutobus t WHERE t.prossimaTratta = :prossimaTratta"),
    @NamedQuery(name = "TrattaAutobus.findByEnumerazione", query = "SELECT t FROM TrattaAutobus t WHERE t.enumerazione = :enumerazione")})
public class TrattaAutobus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fermata_precedente", nullable = false)
    private int fermataPrecedente;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fermata_successiva", nullable = false)
    private int fermataSuccessiva;
    @Basic(optional = false)
    @NotNull
    @Column(name = "autobus_fk", nullable = false)
    private int autobusFk;
    @Column(name = "prossima_tratta")
    private Integer prossimaTratta;
    private Integer enumerazione;

    public TrattaAutobus() {
    }

    public TrattaAutobus(Integer id) {
        this.id = id;
    }

    public TrattaAutobus(Integer id, int fermataPrecedente, int fermataSuccessiva, int autobusFk) {
        this.id = id;
        this.fermataPrecedente = fermataPrecedente;
        this.fermataSuccessiva = fermataSuccessiva;
        this.autobusFk = autobusFk;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getFermataPrecedente() {
        return fermataPrecedente;
    }

    public void setFermataPrecedente(int fermataPrecedente) {
        this.fermataPrecedente = fermataPrecedente;
    }

    public int getFermataSuccessiva() {
        return fermataSuccessiva;
    }

    public void setFermataSuccessiva(int fermataSuccessiva) {
        this.fermataSuccessiva = fermataSuccessiva;
    }

    public int getAutobusFk() {
        return autobusFk;
    }

    public void setAutobusFk(int autobusFk) {
        this.autobusFk = autobusFk;
    }

    public Integer getProssimaTratta() {
        return prossimaTratta;
    }

    public void setProssimaTratta(Integer prossimaTratta) {
        this.prossimaTratta = prossimaTratta;
    }

    public Integer getEnumerazione() {
        return enumerazione;
    }

    public void setEnumerazione(Integer enumerazione) {
        this.enumerazione = enumerazione;
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
        if (!(object instanceof TrattaAutobus)) {
            return false;
        }
        TrattaAutobus other = (TrattaAutobus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.TrattaAutobus[ id=" + id + " ]";
    }
    
}
