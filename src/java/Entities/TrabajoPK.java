/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author agustin
 */
@Embeddable
public class TrabajoPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "idpersonaje")
    private int idpersonaje;
    @Basic(optional = false)
    @Column(name = "idprofesion")
    private int idprofesion;

    public TrabajoPK() {
    }

    public TrabajoPK(int idpersonaje, int idprofesion) {
        this.idpersonaje = idpersonaje;
        this.idprofesion = idprofesion;
    }

    public int getIdpersonaje() {
        return idpersonaje;
    }

    public void setIdpersonaje(int idpersonaje) {
        this.idpersonaje = idpersonaje;
    }

    public int getIdprofesion() {
        return idprofesion;
    }

    public void setIdprofesion(int idprofesion) {
        this.idprofesion = idprofesion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idpersonaje;
        hash += (int) idprofesion;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TrabajoPK)) {
            return false;
        }
        TrabajoPK other = (TrabajoPK) object;
        if (this.idpersonaje != other.idpersonaje) {
            return false;
        }
        if (this.idprofesion != other.idprofesion) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.TrabajoPK[ idpersonaje=" + idpersonaje + ", idprofesion=" + idprofesion + " ]";
    }
    
}
