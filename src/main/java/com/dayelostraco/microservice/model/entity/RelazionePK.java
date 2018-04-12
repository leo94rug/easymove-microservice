/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.model.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author leo
 */
@Embeddable
public class RelazionePK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_1", nullable = false, length = 256)
    private String utente1;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "utente_2", nullable = false, length = 256)
    private String utente2;

    public RelazionePK() {
    }

    public RelazionePK(String utente1, String utente2) {
        this.utente1 = utente1;
        this.utente2 = utente2;
    }

    public String getUtente1() {
        return utente1;
    }

    public void setUtente1(String utente1) {
        this.utente1 = utente1;
    }

    public String getUtente2() {
        return utente2;
    }

    public void setUtente2(String utente2) {
        this.utente2 = utente2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (utente1 != null ? utente1.hashCode() : 0);
        hash += (utente2 != null ? utente2.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RelazionePK)) {
            return false;
        }
        RelazionePK other = (RelazionePK) object;
        if ((this.utente1 == null && other.utente1 != null) || (this.utente1 != null && !this.utente1.equals(other.utente1))) {
            return false;
        }
        if ((this.utente2 == null && other.utente2 != null) || (this.utente2 != null && !this.utente2.equals(other.utente2))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.RelazionePK[ utente1=" + utente1 + ", utente2=" + utente2 + " ]";
    }
    
}
