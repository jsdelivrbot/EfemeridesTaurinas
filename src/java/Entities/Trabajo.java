/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author agustin
 */
@Entity
@Table(name = "trabajo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Trabajo.findAll", query = "SELECT t FROM Trabajo t")
    , @NamedQuery(name = "Trabajo.findByIdpersonaje", query = "SELECT t FROM Trabajo t WHERE t.trabajoPK.idpersonaje = :idpersonaje")
    , @NamedQuery(name = "Trabajo.findByIdprofesion", query = "SELECT t FROM Trabajo t WHERE t.trabajoPK.idprofesion = :idprofesion")})
public class Trabajo implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected TrabajoPK trabajoPK;

    public Trabajo() {
    }

    public Trabajo(TrabajoPK trabajoPK) {
        this.trabajoPK = trabajoPK;
    }

    public Trabajo(int idpersonaje, int idprofesion) {
        this.trabajoPK = new TrabajoPK(idpersonaje, idprofesion);
    }

    public TrabajoPK getTrabajoPK() {
        return trabajoPK;
    }

    public void setTrabajoPK(TrabajoPK trabajoPK) {
        this.trabajoPK = trabajoPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (trabajoPK != null ? trabajoPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Trabajo)) {
            return false;
        }
        Trabajo other = (Trabajo) object;
        if ((this.trabajoPK == null && other.trabajoPK != null) || (this.trabajoPK != null && !this.trabajoPK.equals(other.trabajoPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Trabajo[ trabajoPK=" + trabajoPK + " ]";
    }
    
}
