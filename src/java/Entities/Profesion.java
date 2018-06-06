/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author agustin
 */
@Entity
@Table(name = "profesion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profesion.findAll", query = "SELECT p FROM Profesion p")
    , @NamedQuery(name = "Profesion.findByIdprofesion", query = "SELECT p FROM Profesion p WHERE p.idprofesion = :idprofesion")
    , @NamedQuery(name = "Profesion.findByDescripcion", query = "SELECT p FROM Profesion p WHERE p.descripcion = :descripcion")})
public class Profesion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idprofesion")
    private Integer idprofesion;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @ManyToMany(mappedBy = "profesionList")
    private List<Personaje> personajeList;

    public Profesion() {
    }

    public Profesion(Integer idprofesion) {
        this.idprofesion = idprofesion;
    }

    public Profesion(Integer idprofesion, String descripcion) {
        this.idprofesion = idprofesion;
        this.descripcion = descripcion;
    }

    public Integer getIdprofesion() {
        return idprofesion;
    }

    public void setIdprofesion(Integer idprofesion) {
        this.idprofesion = idprofesion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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
        hash += (idprofesion != null ? idprofesion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profesion)) {
            return false;
        }
        Profesion other = (Profesion) object;
        if ((this.idprofesion == null && other.idprofesion != null) || (this.idprofesion != null && !this.idprofesion.equals(other.idprofesion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Profesion[ idprofesion=" + idprofesion + " ]";
    }
    
}
