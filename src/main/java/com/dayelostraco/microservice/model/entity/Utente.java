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
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author leo
 */
@Entity
@Table(catalog = "easymove", schema = "", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"email"})})
//@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Utente.findAll", query = "SELECT u FROM Utente u"),
//    @NamedQuery(name = "Utente.findById", query = "SELECT u FROM Utente u WHERE u.id = :id"),
//    @NamedQuery(name = "Utente.findByEmail", query = "SELECT u FROM Utente u WHERE u.email = :email"),
//    @NamedQuery(name = "Utente.findByNome", query = "SELECT u FROM Utente u WHERE u.nome = :nome"),
//    @NamedQuery(name = "Utente.findByCognome", query = "SELECT u FROM Utente u WHERE u.cognome = :cognome"),
//    @NamedQuery(name = "Utente.findByPsw", query = "SELECT u FROM Utente u WHERE u.psw = :psw"),
//    @NamedQuery(name = "Utente.findByProfessione", query = "SELECT u FROM Utente u WHERE u.professione = :professione"),
//    @NamedQuery(name = "Utente.findByAnnoNascita", query = "SELECT u FROM Utente u WHERE u.annoNascita = :annoNascita"),
//    @NamedQuery(name = "Utente.findByTelefono1", query = "SELECT u FROM Utente u WHERE u.telefono1 = :telefono1"),
//    @NamedQuery(name = "Utente.findByTelefono2", query = "SELECT u FROM Utente u WHERE u.telefono2 = :telefono2"),
//    @NamedQuery(name = "Utente.findByBiografia", query = "SELECT u FROM Utente u WHERE u.biografia = :biografia"),
//    @NamedQuery(name = "Utente.findByFotoUtente", query = "SELECT u FROM Utente u WHERE u.fotoUtente = :fotoUtente"),
//    @NamedQuery(name = "Utente.findByImagePath", query = "SELECT u FROM Utente u WHERE u.imagePath = :imagePath"),
//    @NamedQuery(name = "Utente.findBySesso", query = "SELECT u FROM Utente u WHERE u.sesso = :sesso"),
//    @NamedQuery(name = "Utente.findByFumare", query = "SELECT u FROM Utente u WHERE u.fumare = :fumare"),
//    @NamedQuery(name = "Utente.findByAnimali", query = "SELECT u FROM Utente u WHERE u.animali = :animali"),
//    @NamedQuery(name = "Utente.findByTipo", query = "SELECT u FROM Utente u WHERE u.tipo = :tipo"),
//    @NamedQuery(name = "Utente.findByMediaFeedback", query = "SELECT u FROM Utente u WHERE u.mediaFeedback = :mediaFeedback"),
//    @NamedQuery(name = "Utente.findByData", query = "SELECT u FROM Utente u WHERE u.data = :data")})
public class Utente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String id;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, unique = true, length = 256)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String nome;
    @Size(max = 256)
    @Column(length = 256)
    private String cognome;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String psw;
    @Size(max = 256)
    @Column(length = 256)
    private String professione;
    @Size(max = 256)
    @Column(name = "anno_nascita", length = 256)
    private String annoNascita;
    @Size(max = 20)
    @Column(length = 20)
    private String telefono1;
    @Size(max = 20)
    @Column(length = 20)
    private String telefono2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String biografia;
    @Size(max = 256)
    @Column(name = "foto_utente", length = 256)
    private String fotoUtente;
    @Size(max = 256)
    @Column(name = "image_path", length = 256)
    private String imagePath;
    @Size(max = 7)
    @Column(length = 7)
    private String sesso;
    private Integer fumare;
    private Integer animali;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int tipo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "media_feedback", precision = 22)
    private Double mediaFeedback;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 256)
    @Column(nullable = false, length = 256)
    private String data;

    public Utente() {
    }

    public Utente(String id) {
        this.id = id;
    }

    public Utente(String email, String psw) {
        this.email = email;
        this.psw = psw;
    }

    public Utente(String id, String email, String nome, String cognome, String psw, String professione, String telefono1, String biografia, String fotoUtente, String imagePath, String sesso, int tipo, String data, String annoNascita) {
        this.id = id;
        this.email = email;
        this.nome = nome;
        this.cognome = cognome;
        this.psw = psw;
        this.professione = professione;
        this.telefono1 = telefono1;
        this.biografia = biografia;
        this.fotoUtente = fotoUtente;
        this.imagePath = imagePath;
        this.sesso = sesso;
        this.tipo = tipo;
        this.data = data;
        this.annoNascita = annoNascita;
    }

    public Utente(String id, String email, String nome, String cognome, String psw, String biografia, int tipo, String data, String annoNascita) {
        this.id = id;
        this.email = email;
        this.nome = nome;
        this.cognome = cognome;
        this.psw = psw;
        this.biografia = biografia;
        this.tipo = tipo;
        this.data = data;
        this.annoNascita = annoNascita;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getProfessione() {
        return professione;
    }

    public void setProfessione(String professione) {
        this.professione = professione;
    }

    public String getAnnoNascita() {
        return annoNascita;
    }

    public void setAnnoNascita(String annoNascita) {
        this.annoNascita = annoNascita;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getFotoUtente() {
        return fotoUtente;
    }

    public void setFotoUtente(String fotoUtente) {
        this.fotoUtente = fotoUtente;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getSesso() {
        return sesso;
    }

    public void setSesso(String sesso) {
        this.sesso = sesso;
    }

    public Integer getFumare() {
        return fumare;
    }

    public void setFumare(Integer fumare) {
        this.fumare = fumare;
    }

    public Integer getAnimali() {
        return animali;
    }

    public void setAnimali(Integer animali) {
        this.animali = animali;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Double getMediaFeedback() {
        return mediaFeedback;
    }

    public void setMediaFeedback(Double mediaFeedback) {
        this.mediaFeedback = mediaFeedback;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
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
        if (!(object instanceof Utente)) {
            return false;
        }
        Utente other = (Utente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dayelostraco.microservice.model.entity.Utente[ id=" + id + " ]";
    }
//    @PrePersist
//    protected void onCreate() {
//        created = modified = Calendar.getInstance();
//    }
//
//    @PreUpdate
//    protected void onUpdate() {
//        modified = Calendar.getInstance();
//    }
}
