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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "personaje")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personaje.findAll", query = "SELECT p FROM Personaje p")
    , @NamedQuery(name = "Personaje.findByIdpersonaje", query = "SELECT p FROM Personaje p WHERE p.idpersonaje = :idpersonaje")
    , @NamedQuery(name = "Personaje.findByNombrepersonaje", query = "SELECT p FROM Personaje p WHERE p.nombrepersonaje = :nombrepersonaje")
    , @NamedQuery(name = "Personaje.findByApellido1", query = "SELECT p FROM Personaje p WHERE p.apellido1 = :apellido1")
    , @NamedQuery(name = "Personaje.findByApellido2", query = "SELECT p FROM Personaje p WHERE p.apellido2 = :apellido2")
    , @NamedQuery(name = "Personaje.findByApodo1", query = "SELECT p FROM Personaje p WHERE p.apodo1 = :apodo1")
    , @NamedQuery(name = "Personaje.findByApodo2", query = "SELECT p FROM Personaje p WHERE p.apodo2 = :apodo2")
    , @NamedQuery(name = "Personaje.findByNombrecartel", query = "SELECT p FROM Personaje p WHERE p.nombrecartel = :nombrecartel")
    , @NamedQuery(name = "Personaje.findByFechanacimiento", query = "SELECT p FROM Personaje p WHERE p.fechanacimiento = :fechanacimiento")
    , @NamedQuery(name = "Personaje.findByContacto", query = "SELECT p FROM Personaje p WHERE p.contacto = :contacto")
    , @NamedQuery(name = "Personaje.findByDireccion", query = "SELECT p FROM Personaje p WHERE p.direccion = :direccion")
    , @NamedQuery(name = "Personaje.findByTelefono", query = "SELECT p FROM Personaje p WHERE p.telefono = :telefono")
    , @NamedQuery(name = "Personaje.findByCorreo", query = "SELECT p FROM Personaje p WHERE p.correo = :correo")
    , @NamedQuery(name = "Personaje.findByBiografia", query = "SELECT p FROM Personaje p WHERE p.biografia = :biografia")
    , @NamedQuery(name = "Personaje.findByFoto", query = "SELECT p FROM Personaje p WHERE p.foto = :foto")
    , @NamedQuery(name = "Personaje.findByCossio", query = "SELECT p FROM Personaje p WHERE p.cossio = :cossio")
    , @NamedQuery(name = "Personaje.findByCompleto", query = "SELECT p FROM Personaje p WHERE p.completo = :completo")
    , @NamedQuery(name = "Personaje.findByAveriguar", query = "SELECT p FROM Personaje p WHERE p.averiguar = :averiguar")
    , @NamedQuery(name = "Personaje.findByNotas", query = "SELECT p FROM Personaje p WHERE p.notas = :notas")
    , @NamedQuery(name = "Personaje.findByProvincianacimiento", query = "SELECT p FROM Personaje p WHERE p.provincianacimiento = :provincianacimiento")
    , @NamedQuery(name = "Personaje.findByPueblonacimiento", query = "SELECT p FROM Personaje p WHERE p.pueblonacimiento = :pueblonacimiento")
    , @NamedQuery(name = "Personaje.findByProvinciaactual", query = "SELECT p FROM Personaje p WHERE p.provinciaactual = :provinciaactual")
    , @NamedQuery(name = "Personaje.findByPuebloactual", query = "SELECT p FROM Personaje p WHERE p.puebloactual = :puebloactual")
    , @NamedQuery(name = "Personaje.findByClm", query = "SELECT p FROM Personaje p WHERE p.clm = :clm")})
public class Personaje implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpersonaje")
    private Integer idpersonaje;
    @Basic(optional = false)
    @Column(name = "nombrepersonaje")
    private String nombrepersonaje;
    @Basic(optional = false)
    @Column(name = "apellido1")
    private String apellido1;
    @Basic(optional = false)
    @Column(name = "apellido2")
    private String apellido2;
    @Basic(optional = false)
    @Column(name = "apodo1")
    private String apodo1;
    @Basic(optional = false)
    @Column(name = "apodo2")
    private String apodo2;
    @Basic(optional = false)
    @Column(name = "nombrecartel")
    private String nombrecartel;
    @Basic(optional = false)
    @Column(name = "fechanacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechanacimiento;
    @Basic(optional = false)
    @Column(name = "contacto")
    private String contacto;
    @Basic(optional = false)
    @Column(name = "direccion")
    private String direccion;
    @Basic(optional = false)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @Column(name = "correo")
    private String correo;
    @Basic(optional = false)
    @Column(name = "biografia")
    private String biografia;
    @Basic(optional = false)
    @Column(name = "foto")
    private String foto;
    @Basic(optional = false)
    @Column(name = "cossio")
    private boolean cossio;
    @Basic(optional = false)
    @Column(name = "completo")
    private boolean completo;
    @Basic(optional = false)
    @Column(name = "averiguar")
    private String averiguar;
    @Basic(optional = false)
    @Column(name = "notas")
    private String notas;
    @Basic(optional = false)
    @Column(name = "provincianacimiento")
    private String provincianacimiento;
    @Basic(optional = false)
    @Column(name = "pueblonacimiento")
    private String pueblonacimiento;
    @Basic(optional = false)
    @Column(name = "provinciaactual")
    private String provinciaactual;
    @Basic(optional = false)
    @Column(name = "puebloactual")
    private String puebloactual;
    @Column(name = "clm")
    private Boolean clm;
    @JoinTable(name = "trabajo", joinColumns = {
        @JoinColumn(name = "idpersonaje", referencedColumnName = "idpersonaje")}, inverseJoinColumns = {
        @JoinColumn(name = "idprofesion", referencedColumnName = "idprofesion")})
    @ManyToMany
    private List<Profesion> profesionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersonaje")
    private List<Efemeride> efemerideList;

    public Personaje() {
    }

    public Personaje(Integer idpersonaje) {
        this.idpersonaje = idpersonaje;
    }

    public Personaje(Integer idpersonaje, String nombrepersonaje, String apellido1, String apellido2, String apodo1, String apodo2, String nombrecartel, Date fechanacimiento, String contacto, String direccion, String telefono, String correo, String biografia, String foto, boolean cossio, boolean completo, String averiguar, String notas, String provincianacimiento, String pueblonacimiento, String provinciaactual, String puebloactual) {
        this.idpersonaje = idpersonaje;
        this.nombrepersonaje = nombrepersonaje;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.apodo1 = apodo1;
        this.apodo2 = apodo2;
        this.nombrecartel = nombrecartel;
        this.fechanacimiento = fechanacimiento;
        this.contacto = contacto;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.biografia = biografia;
        this.foto = foto;
        this.cossio = cossio;
        this.completo = completo;
        this.averiguar = averiguar;
        this.notas = notas;
        this.provincianacimiento = provincianacimiento;
        this.pueblonacimiento = pueblonacimiento;
        this.provinciaactual = provinciaactual;
        this.puebloactual = puebloactual;
    }

    public Integer getIdpersonaje() {
        return idpersonaje;
    }

    public void setIdpersonaje(Integer idpersonaje) {
        this.idpersonaje = idpersonaje;
    }

    public String getNombrepersonaje() {
        return nombrepersonaje;
    }

    public void setNombrepersonaje(String nombrepersonaje) {
        this.nombrepersonaje = nombrepersonaje;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getApodo1() {
        return apodo1;
    }

    public void setApodo1(String apodo1) {
        this.apodo1 = apodo1;
    }

    public String getApodo2() {
        return apodo2;
    }

    public void setApodo2(String apodo2) {
        this.apodo2 = apodo2;
    }

    public String getNombrecartel() {
        return nombrecartel;
    }

    public void setNombrecartel(String nombrecartel) {
        this.nombrecartel = nombrecartel;
    }

    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public boolean getCossio() {
        return cossio;
    }

    public void setCossio(boolean cossio) {
        this.cossio = cossio;
    }

    public boolean getCompleto() {
        return completo;
    }

    public void setCompleto(boolean completo) {
        this.completo = completo;
    }

    public String getAveriguar() {
        return averiguar;
    }

    public void setAveriguar(String averiguar) {
        this.averiguar = averiguar;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getProvincianacimiento() {
        return provincianacimiento;
    }

    public void setProvincianacimiento(String provincianacimiento) {
        this.provincianacimiento = provincianacimiento;
    }

    public String getPueblonacimiento() {
        return pueblonacimiento;
    }

    public void setPueblonacimiento(String pueblonacimiento) {
        this.pueblonacimiento = pueblonacimiento;
    }

    public String getProvinciaactual() {
        return provinciaactual;
    }

    public void setProvinciaactual(String provinciaactual) {
        this.provinciaactual = provinciaactual;
    }

    public String getPuebloactual() {
        return puebloactual;
    }

    public void setPuebloactual(String puebloactual) {
        this.puebloactual = puebloactual;
    }

    public Boolean getClm() {
        return clm;
    }

    public void setClm(Boolean clm) {
        this.clm = clm;
    }

    @XmlTransient
    public List<Profesion> getProfesionList() {
        return profesionList;
    }

    public void setProfesionList(List<Profesion> profesionList) {
        this.profesionList = profesionList;
    }

    @XmlTransient
    public List<Efemeride> getEfemerideList() {
        return efemerideList;
    }

    public void setEfemerideList(List<Efemeride> efemerideList) {
        this.efemerideList = efemerideList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpersonaje != null ? idpersonaje.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personaje)) {
            return false;
        }
        Personaje other = (Personaje) object;
        if ((this.idpersonaje == null && other.idpersonaje != null) || (this.idpersonaje != null && !this.idpersonaje.equals(other.idpersonaje))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Personaje[ idpersonaje=" + idpersonaje + " ]";
    }
    
}
