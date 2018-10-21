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
public class FotosPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "idimagen")
    private int idimagen;
    @Basic(optional = false)
    @Column(name = "idpersonaje")
    private int idpersonaje;

    public FotosPK() {
    }

    public FotosPK(int idimagen, int idpersonaje) {
        this.idimagen = idimagen;
        this.idpersonaje = idpersonaje;
    }

    public int getIdimagen() {
        return idimagen;
    }

    public void setIdimagen(int idimagen) {
        this.idimagen = idimagen;
    }

    public int getIdpersonaje() {
        return idpersonaje;
    }

    public void setIdpersonaje(int idpersonaje) {
        this.idpersonaje = idpersonaje;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idimagen;
        hash += (int) idpersonaje;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FotosPK)) {
            return false;
        }
        FotosPK other = (FotosPK) object;
        if (this.idimagen != other.idimagen) {
            return false;
        }
        if (this.idpersonaje != other.idpersonaje) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.FotosPK[ idimagen=" + idimagen + ", idpersonaje=" + idpersonaje + " ]";
    }
    
}
