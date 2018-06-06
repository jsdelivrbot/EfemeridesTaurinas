/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

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
    , @NamedQuery(name = "Efemeride.findByPoblacion", query = "SELECT e FROM Efemeride e WHERE e.poblacion = :poblacion")
    , @NamedQuery(name = "Efemeride.findByGanaderia1", query = "SELECT e FROM Efemeride e WHERE e.ganaderia1 = :ganaderia1")
    , @NamedQuery(name = "Efemeride.findByGanaderia2", query = "SELECT e FROM Efemeride e WHERE e.ganaderia2 = :ganaderia2")
    , @NamedQuery(name = "Efemeride.findByGanaderia3", query = "SELECT e FROM Efemeride e WHERE e.ganaderia3 = :ganaderia3")
    , @NamedQuery(name = "Efemeride.findByGanaderia4", query = "SELECT e FROM Efemeride e WHERE e.ganaderia4 = :ganaderia4")
    , @NamedQuery(name = "Efemeride.findByGanaderia5", query = "SELECT e FROM Efemeride e WHERE e.ganaderia5 = :ganaderia5")
    , @NamedQuery(name = "Efemeride.findByGanaderia6", query = "SELECT e FROM Efemeride e WHERE e.ganaderia6 = :ganaderia6")
    , @NamedQuery(name = "Efemeride.findByToro1", query = "SELECT e FROM Efemeride e WHERE e.toro1 = :toro1")
    , @NamedQuery(name = "Efemeride.findByToro2", query = "SELECT e FROM Efemeride e WHERE e.toro2 = :toro2")
    , @NamedQuery(name = "Efemeride.findByToro3", query = "SELECT e FROM Efemeride e WHERE e.toro3 = :toro3")
    , @NamedQuery(name = "Efemeride.findByToro4", query = "SELECT e FROM Efemeride e WHERE e.toro4 = :toro4")
    , @NamedQuery(name = "Efemeride.findByToro5", query = "SELECT e FROM Efemeride e WHERE e.toro5 = :toro5")
    , @NamedQuery(name = "Efemeride.findByToro6", query = "SELECT e FROM Efemeride e WHERE e.toro6 = :toro6")
    , @NamedQuery(name = "Efemeride.findByNotas", query = "SELECT e FROM Efemeride e WHERE e.notas = :notas")
    , @NamedQuery(name = "Efemeride.findByReportaje", query = "SELECT e FROM Efemeride e WHERE e.reportaje = :reportaje")
    , @NamedQuery(name = "Efemeride.findByEvento", query = "SELECT e FROM Efemeride e WHERE e.evento = :evento")
    , @NamedQuery(name = "Efemeride.findByFechaefemeride", query = "SELECT e FROM Efemeride e WHERE e.fechaefemeride = :fechaefemeride")
    , @NamedQuery(name = "Efemeride.findByInterviniente1", query = "SELECT e FROM Efemeride e WHERE e.interviniente1 = :interviniente1")
    , @NamedQuery(name = "Efemeride.findByInterviniente2", query = "SELECT e FROM Efemeride e WHERE e.interviniente2 = :interviniente2")
    , @NamedQuery(name = "Efemeride.findByInterviniente3", query = "SELECT e FROM Efemeride e WHERE e.interviniente3 = :interviniente3")
    , @NamedQuery(name = "Efemeride.findByInterviniente4", query = "SELECT e FROM Efemeride e WHERE e.interviniente4 = :interviniente4")
    , @NamedQuery(name = "Efemeride.findByInterviniente5", query = "SELECT e FROM Efemeride e WHERE e.interviniente5 = :interviniente5")
    , @NamedQuery(name = "Efemeride.findByInterviniente6", query = "SELECT e FROM Efemeride e WHERE e.interviniente6 = :interviniente6")})
public class Efemeride implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idefemeride")
    private Integer idefemeride;
    @Basic(optional = false)
    @Column(name = "poblacion")
    private String poblacion;
    @Column(name = "ganaderia1")
    private String ganaderia1;
    @Column(name = "ganaderia2")
    private String ganaderia2;
    @Column(name = "ganaderia3")
    private String ganaderia3;
    @Column(name = "ganaderia4")
    private String ganaderia4;
    @Column(name = "ganaderia5")
    private String ganaderia5;
    @Column(name = "ganaderia6")
    private String ganaderia6;
    @Column(name = "toro1")
    private String toro1;
    @Column(name = "toro2")
    private String toro2;
    @Column(name = "toro3")
    private String toro3;
    @Column(name = "toro4")
    private String toro4;
    @Column(name = "toro5")
    private String toro5;
    @Column(name = "toro6")
    private String toro6;
    @Column(name = "notas")
    private String notas;
    @Basic(optional = false)
    @Column(name = "reportaje")
    private String reportaje;
    @Basic(optional = false)
    @Column(name = "evento")
    private String evento;
    @Basic(optional = false)
    @Column(name = "fechaefemeride")
    @Temporal(TemporalType.DATE)
    private Date fechaefemeride;
    @Column(name = "interviniente1")
    private String interviniente1;
    @Column(name = "interviniente2")
    private String interviniente2;
    @Column(name = "interviniente3")
    private String interviniente3;
    @Column(name = "interviniente4")
    private String interviniente4;
    @Column(name = "interviniente5")
    private String interviniente5;
    @Column(name = "interviniente6")
    private String interviniente6;
    @JoinColumn(name = "idpersonaje", referencedColumnName = "idpersonaje")
    @ManyToOne(optional = false)
    private Personaje idpersonaje;

    public Efemeride() {
    }

    public Efemeride(Integer idefemeride) {
        this.idefemeride = idefemeride;
    }

    public Efemeride(Integer idefemeride, String poblacion, String reportaje, String evento, Date fechaefemeride) {
        this.idefemeride = idefemeride;
        this.poblacion = poblacion;
        this.reportaje = reportaje;
        this.evento = evento;
        this.fechaefemeride = fechaefemeride;
    }

    public Integer getIdefemeride() {
        return idefemeride;
    }

    public void setIdefemeride(Integer idefemeride) {
        this.idefemeride = idefemeride;
    }

    public String getPoblacion() {
        return poblacion;
    }

    public void setPoblacion(String poblacion) {
        this.poblacion = poblacion;
    }

    public String getGanaderia1() {
        return ganaderia1;
    }

    public void setGanaderia1(String ganaderia1) {
        this.ganaderia1 = ganaderia1;
    }

    public String getGanaderia2() {
        return ganaderia2;
    }

    public void setGanaderia2(String ganaderia2) {
        this.ganaderia2 = ganaderia2;
    }

    public String getGanaderia3() {
        return ganaderia3;
    }

    public void setGanaderia3(String ganaderia3) {
        this.ganaderia3 = ganaderia3;
    }

    public String getGanaderia4() {
        return ganaderia4;
    }

    public void setGanaderia4(String ganaderia4) {
        this.ganaderia4 = ganaderia4;
    }

    public String getGanaderia5() {
        return ganaderia5;
    }

    public void setGanaderia5(String ganaderia5) {
        this.ganaderia5 = ganaderia5;
    }

    public String getGanaderia6() {
        return ganaderia6;
    }

    public void setGanaderia6(String ganaderia6) {
        this.ganaderia6 = ganaderia6;
    }

    public String getToro1() {
        return toro1;
    }

    public void setToro1(String toro1) {
        this.toro1 = toro1;
    }

    public String getToro2() {
        return toro2;
    }

    public void setToro2(String toro2) {
        this.toro2 = toro2;
    }

    public String getToro3() {
        return toro3;
    }

    public void setToro3(String toro3) {
        this.toro3 = toro3;
    }

    public String getToro4() {
        return toro4;
    }

    public void setToro4(String toro4) {
        this.toro4 = toro4;
    }

    public String getToro5() {
        return toro5;
    }

    public void setToro5(String toro5) {
        this.toro5 = toro5;
    }

    public String getToro6() {
        return toro6;
    }

    public void setToro6(String toro6) {
        this.toro6 = toro6;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getReportaje() {
        return reportaje;
    }

    public void setReportaje(String reportaje) {
        this.reportaje = reportaje;
    }

    public String getEvento() {
        return evento;
    }

    public void setEvento(String evento) {
        this.evento = evento;
    }

    public Date getFechaefemeride() {
        return fechaefemeride;
    }

    public void setFechaefemeride(Date fechaefemeride) {
        this.fechaefemeride = fechaefemeride;
    }

    public String getInterviniente1() {
        return interviniente1;
    }

    public void setInterviniente1(String interviniente1) {
        this.interviniente1 = interviniente1;
    }

    public String getInterviniente2() {
        return interviniente2;
    }

    public void setInterviniente2(String interviniente2) {
        this.interviniente2 = interviniente2;
    }

    public String getInterviniente3() {
        return interviniente3;
    }

    public void setInterviniente3(String interviniente3) {
        this.interviniente3 = interviniente3;
    }

    public String getInterviniente4() {
        return interviniente4;
    }

    public void setInterviniente4(String interviniente4) {
        this.interviniente4 = interviniente4;
    }

    public String getInterviniente5() {
        return interviniente5;
    }

    public void setInterviniente5(String interviniente5) {
        this.interviniente5 = interviniente5;
    }

    public String getInterviniente6() {
        return interviniente6;
    }

    public void setInterviniente6(String interviniente6) {
        this.interviniente6 = interviniente6;
    }

    public Personaje getIdpersonaje() {
        return idpersonaje;
    }

    public void setIdpersonaje(Personaje idpersonaje) {
        this.idpersonaje = idpersonaje;
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
