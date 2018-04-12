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
    @NamedQuery(name = "Prenotazione.findAll", query = "SELECT p FROM Prenotazione p"),
    @NamedQuery(name = "Prenotazione.findById", query = "SELECT p FROM Prenotazione p WHERE p.id = :id"),
    @NamedQuery(name = "Prenotazione.findByPasseggero", query = "SELECT p FROM Prenotazione p WHERE p.passeggero = :passeggero"),
    @NamedQuery(name = "Prenotazione.findByAutista", query = "SELECT p FROM Prenotazione p WHERE p.autista = :autista"),
    @NamedQuery(name = "Prenotazione.findByIdPartenza", query = "SELECT p FROM Prenotazione p WHERE p.idPartenza = :idPartenza"),
    @NamedQuery(name = "Prenotazione.findByIdArrivo", query = "SELECT p FROM Prenotazione p WHERE p.idArrivo = :idArrivo"),
    @NamedQuery(name = "Prenotazione.findByPosti", query = "SELECT p FROM Prenotazione p WHERE p.posti = :posti"),
    @NamedQuery(name = "Prenotazione.findByPrezzo", query = "SELECT p FROM Prenotazione p WHERE p.prezzo = :prezzo")})
public class Prenotazione implements Serializable {

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
    private String passeggero;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String autista;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "id_partenza", nullable = false, length = 256)
    private String idPartenza;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "id_arrivo", nullable = false, length = 256)
    private String idArrivo;
    private Integer posti;
    private Integer prezzo;

    public Prenotazione() {
    }

    public Prenotazione(String id) {
        this.id = id;
    }

    public Prenotazione(String id, String passeggero, String autista, String idPartenza, String idArrivo) {
        this.id = id;
        this.passeggero = passeggero;
        this.autista = autista;
        this.idPartenza = idPartenza;
        this.idArrivo = idArrivo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPasseggero() {
        return passeggero;
    }

    public void setPasseggero(String passeggero) {
        this.passeggero = passeggero;
    }

    public String getAutista() {
        return autista;
    }

    public void setAutista(String autista) {
        this.autista = autista;
    }

    public String getIdPartenza() {
        return idPartenza;
    }

    public void setIdPartenza(String idPartenza) {
        this.idPartenza = idPartenza;
    }

    public String getIdArrivo() {
        return idArrivo;
    }

    public void setIdArrivo(String idArrivo) {
        this.idArrivo = idArrivo;
    }

    public Integer getPosti() {
        return posti;
    }

    public void setPosti(Integer posti) {
        this.posti = posti;
    }

    public Integer getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Integer prezzo) {
        this.prezzo = prezzo;
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
        if (!(object instanceof Prenotazione)) {
            return false;
        }
        Prenotazione other = (Prenotazione) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Prenotazione[ id=" + id + " ]";
    }
    
}
