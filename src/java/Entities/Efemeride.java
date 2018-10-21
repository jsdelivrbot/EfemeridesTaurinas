/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author agustin
 */
@Entity
@Table(name = "efemeride")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Efemeride.findAll", query = "SELECT e FROM Efemeride e")
    , @NamedQuery(name = "Efemeride.findByIdefemeride", query = "SELECT e FROM Efemeride e WHERE e.idefemeride = :idefemeride")
    , @NamedQuery(name = "Efemeride.findByProvincia", query = "SELECT e FROM Efemeride e WHERE e.provincia = :provincia")
    , @NamedQuery(name = "Efemeride.findByPueblo", query = "SELECT e FROM Efemeride e WHERE e.pueblo = :pueblo")
    , @NamedQuery(name = "Efemeride.findByTipoevento", query = "SELECT e FROM Efemeride e WHERE e.tipoevento = :tipoevento")
    , @NamedQuery(name = "Efemeride.findByFechaefemeride", query = "SELECT e FROM Efemeride e WHERE e.fechaefemeride = :fechaefemeride")
    , @NamedQuery(name = "Efemeride.findByGanaderia", query = "SELECT e FROM Efemeride e WHERE e.ganaderia = :ganaderia")
    , @NamedQuery(name = "Efemeride.findByFoto", query = "SELECT e FROM Efemeride e WHERE e.foto = :foto")
    , @NamedQuery(name = "Efemeride.findByCartel", query = "SELECT e FROM Efemeride e WHERE e.cartel = :cartel")
    , @NamedQuery(name = "Efemeride.findByFechareal", query = "SELECT e FROM Efemeride e WHERE e.fechareal = :fechareal")
    , @NamedQuery(name = "Efemeride.findByFuente", query = "SELECT e FROM Efemeride e WHERE e.fuente = :fuente")
    , @NamedQuery(name = "Efemeride.findByReportaje", query = "SELECT e FROM Efemeride e WHERE e.reportaje = :reportaje")})
public class Efemeride implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idefemeride")
    private Integer idefemeride;
    @Column(name = "provincia")
    private String provincia;
    @Column(name = "pueblo")
    private String pueblo;
    @Column(name = "tipoevento")
    private String tipoevento;
    @Column(name = "fechaefemeride")
    @Temporal(TemporalType.DATE)
    private Date fechaefemeride;
    @Column(name = "ganaderia")
    private String ganaderia;
    @Lob
    @Column(name = "notas")
    private String notas;
    @Column(name = "foto")
    private String foto;
    @Column(name = "cartel")
    private String cartel;
    @Column(name = "fechareal")
    @Temporal(TemporalType.DATE)
    private Date fechareal;
    @Column(name = "fuente")
    private String fuente;
    @Column(name = "reportaje")
    private String reportaje;
    @JoinTable(name = "persoefe", joinColumns = {
        @JoinColumn(name = "idefemeride", referencedColumnName = "idefemeride")}, inverseJoinColumns = {
        @JoinColumn(name = "idpersonaje", referencedColumnName = "idpersonaje")})
    @ManyToMany
    private List<Personaje> personajeList;

    public Efemeride() {
    }

    public Efemeride(Integer idefemeride) {
        this.idefemeride = idefemeride;
    }

    public Integer getIdefemeride() {
        return idefemeride;
    }

    public void setIdefemeride(Integer idefemeride) {
        this.idefemeride = idefemeride;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getPueblo() {
        return pueblo;
    }

    public void setPueblo(String pueblo) {
        this.pueblo = pueblo;
    }

    public String getTipoevento() {
        return tipoevento;
    }

    public void setTipoevento(String tipoevento) {
        this.tipoevento = tipoevento;
    }

    public Date getFechaefemeride() {
        return fechaefemeride;
    }

    public void setFechaefemeride(Date fechaefemeride) {
        this.fechaefemeride = fechaefemeride;
    }

    public String getGanaderia() {
        return ganaderia;
    }

    public void setGanaderia(String ganaderia) {
        this.ganaderia = ganaderia;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getCartel() {
        return cartel;
    }

    public void setCartel(String cartel) {
        this.cartel = cartel;
    }

    public Date getFechareal() {
        return fechareal;
    }

    public void setFechareal(Date fechareal) {
        this.fechareal = fechareal;
    }

    public String getFuente() {
        return fuente;
    }

    public void setFuente(String fuente) {
        this.fuente = fuente;
    }

    public String getReportaje() {
        return reportaje;
    }

    public void setReportaje(String reportaje) {
        this.reportaje = reportaje;
    }

    @XmlTransient
    public List<Personaje> getPersonajeList() {
        return personajeList;
    }

    public void setPersonajeList(List<Personaje> personajeList) {
        this.personajeList = personajeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idefemeride != null ? idefemeride.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Efemeride)) {
            return false;
        }
        Efemeride other = (Efemeride) object;
        if ((this.idefemeride == null && other.idefemeride != null) || (this.idefemeride != null && !this.idefemeride.equals(other.idefemeride))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Efemeride[ idefemeride=" + idefemeride + " ]";
    }
    
}
