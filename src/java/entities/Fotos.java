/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author agustin
 */
@Entity
@Table(name = "fotos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fotos.findAll", query = "SELECT f FROM Fotos f")
    , @NamedQuery(name = "Fotos.findByIdimagen", query = "SELECT f FROM Fotos f WHERE f.fotosPK.idimagen = :idimagen")
    , @NamedQuery(name = "Fotos.findByIdpersonaje", query = "SELECT f FROM Fotos f WHERE f.fotosPK.idpersonaje = :idpersonaje")})
public class Fotos implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FotosPK fotosPK;
    @Basic(optional = false)
    @Lob
    @Column(name = "imagen")
    private byte[] imagen;
    @JoinColumn(name = "idpersonaje", referencedColumnName = "idpersonaje", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Personaje personaje;

    public Fotos() {
    }

    public Fotos(FotosPK fotosPK) {
        this.fotosPK = fotosPK;
    }

    public Fotos(FotosPK fotosPK, byte[] imagen) {
        this.fotosPK = fotosPK;
        this.imagen = imagen;
    }

    public Fotos(int idimagen, int idpersonaje) {
        this.fotosPK = new FotosPK(idimagen, idpersonaje);
    }

    public FotosPK getFotosPK() {
        return fotosPK;
    }

    public void setFotosPK(FotosPK fotosPK) {
        this.fotosPK = fotosPK;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public Personaje getPersonaje() {
        return personaje;
    }

    public void setPersonaje(Personaje personaje) {
        this.personaje = personaje;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (fotosPK != null ? fotosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fotos)) {
            return false;
        }
        Fotos other = (Fotos) object;
        if ((this.fotosPK == null && other.fotosPK != null) || (this.fotosPK != null && !this.fotosPK.equals(other.fotosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Fotos[ fotosPK=" + fotosPK + " ]";
    }
    
}
