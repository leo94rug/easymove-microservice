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
    @NamedQuery(name = "Notifica.findAll", query = "SELECT n FROM Notifica n"),
    @NamedQuery(name = "Notifica.findById", query = "SELECT n FROM Notifica n WHERE n.id = :id"),
    @NamedQuery(name = "Notifica.findByMittente", query = "SELECT n FROM Notifica n WHERE n.mittente = :mittente"),
    @NamedQuery(name = "Notifica.findByDestinatario", query = "SELECT n FROM Notifica n WHERE n.destinatario = :destinatario"),
    @NamedQuery(name = "Notifica.findByTipologia", query = "SELECT n FROM Notifica n WHERE n.tipologia = :tipologia"),
    @NamedQuery(name = "Notifica.findByData", query = "SELECT n FROM Notifica n WHERE n.data = :data"),
    @NamedQuery(name = "Notifica.findByFineValidita", query = "SELECT n FROM Notifica n WHERE n.fineValidita = :fineValidita"),
    @NamedQuery(name = "Notifica.findByInizioValidita", query = "SELECT n FROM Notifica n WHERE n.inizioValidita = :inizioValidita"),
    @NamedQuery(name = "Notifica.findByIdViaggio", query = "SELECT n FROM Notifica n WHERE n.idViaggio = :idViaggio"),
    @NamedQuery(name = "Notifica.findByNomeViaggio", query = "SELECT n FROM Notifica n WHERE n.nomeViaggio = :nomeViaggio"),
    @NamedQuery(name = "Notifica.findByNomeMittente", query = "SELECT n FROM Notifica n WHERE n.nomeMittente = :nomeMittente"),
    @NamedQuery(name = "Notifica.findByNomeDestinatario", query = "SELECT n FROM Notifica n WHERE n.nomeDestinatario = :nomeDestinatario"),
    @NamedQuery(name = "Notifica.findByStato", query = "SELECT n FROM Notifica n WHERE n.stato = :stato"),
    @NamedQuery(name = "Notifica.findByPosti", query = "SELECT n FROM Notifica n WHERE n.posti = :posti"),
    @NamedQuery(name = "Notifica.findByPostiDaPrenotare", query = "SELECT n FROM Notifica n WHERE n.postiDaPrenotare = :postiDaPrenotare"),
    @NamedQuery(name = "Notifica.findByIdPartenza", query = "SELECT n FROM Notifica n WHERE n.idPartenza = :idPartenza"),
    @NamedQuery(name = "Notifica.findByIdArrivo", query = "SELECT n FROM Notifica n WHERE n.idArrivo = :idArrivo")})
public class Notifica implements Serializable {

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
    private String mittente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String destinatario;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int tipologia;
    @Lob
    @Size(max = 65535)
    @Column(length = 65535)
    private String messaggio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String data;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "fine_validita", nullable = false, length = 256)
    private String fineValidita;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "inizio_validita", nullable = false, length = 256)
    private String inizioValidita;
    @Size(max = 256)
    @Column(name = "id_viaggio", length = 256)
    private String idViaggio;
    @Size(max = 256)
    @Column(name = "nome_viaggio", length = 256)
    private String nomeViaggio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(name = "nome_mittente", nullable = false, length = 256)
    private String nomeMittente;
    @Size(max = 256)
    @Column(name = "nome_destinatario", length = 256)
    private String nomeDestinatario;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int stato;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int posti;
    @Column(name = "posti_da_prenotare")
    private Integer postiDaPrenotare;
    @Size(max = 256)
    @Column(name = "id_partenza", length = 256)
    private String idPartenza;
    @Size(max = 256)
    @Column(name = "id_arrivo", length = 256)
    private String idArrivo;

    public Notifica() {
    }

    public Notifica(String id) {
        this.id = id;
    }

    public Notifica(String id, String mittente, String destinatario, int tipologia, String data, String fineValidita, String inizioValidita, String nomeMittente, int stato, int posti) {
        this.id = id;
        this.mittente = mittente;
        this.destinatario = destinatario;
        this.tipologia = tipologia;
        this.data = data;
        this.fineValidita = fineValidita;
        this.inizioValidita = inizioValidita;
        this.nomeMittente = nomeMittente;
        this.stato = stato;
        this.posti = posti;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMittente() {
        return mittente;
    }

    public void setMittente(String mittente) {
        this.mittente = mittente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public int getTipologia() {
        return tipologia;
    }

    public void setTipologia(int tipologia) {
        this.tipologia = tipologia;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getFineValidita() {
        return fineValidita;
    }

    public void setFineValidita(String fineValidita) {
        this.fineValidita = fineValidita;
    }

    public String getInizioValidita() {
        return inizioValidita;
    }

    public void setInizioValidita(String inizioValidita) {
        this.inizioValidita = inizioValidita;
    }

    public String getIdViaggio() {
        return idViaggio;
    }

    public void setIdViaggio(String idViaggio) {
        this.idViaggio = idViaggio;
    }

    public String getNomeViaggio() {
        return nomeViaggio;
    }

    public void setNomeViaggio(String nomeViaggio) {
        this.nomeViaggio = nomeViaggio;
    }

    public String getNomeMittente() {
        return nomeMittente;
    }

    public void setNomeMittente(String nomeMittente) {
        this.nomeMittente = nomeMittente;
    }

    public String getNomeDestinatario() {
        return nomeDestinatario;
    }

    public void setNomeDestinatario(String nomeDestinatario) {
        this.nomeDestinatario = nomeDestinatario;
    }

    public int getStato() {
        return stato;
    }

    public void setStato(int stato) {
        this.stato = stato;
    }

    public int getPosti() {
        return posti;
    }

    public void setPosti(int posti) {
        this.posti = posti;
    }

    public Integer getPostiDaPrenotare() {
        return postiDaPrenotare;
    }

    public void setPostiDaPrenotare(Integer postiDaPrenotare) {
        this.postiDaPrenotare = postiDaPrenotare;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notifica)) {
            return false;
        }
        Notifica other = (Notifica) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Notifica[ id=" + id + " ]";
    }
    
}
