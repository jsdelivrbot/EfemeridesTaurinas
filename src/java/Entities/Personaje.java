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
import javax.persistence.Lob;
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
    , @NamedQuery(name = "Personaje.findByCossio", query = "SELECT p FROM Personaje p WHERE p.cossio = :cossio")
    , @NamedQuery(name = "Personaje.findByClm", query = "SELECT p FROM Personaje p WHERE p.clm = :clm")
    , @NamedQuery(name = "Personaje.findByCompleto", query = "SELECT p FROM Personaje p WHERE p.completo = :completo")
    , @NamedQuery(name = "Personaje.findByFechapresentacion", query = "SELECT p FROM Personaje p WHERE p.fechapresentacion = :fechapresentacion")
    , @NamedQuery(name = "Personaje.findByFechapicadores", query = "SELECT p FROM Personaje p WHERE p.fechapicadores = :fechapicadores")
    , @NamedQuery(name = "Personaje.findByFechaalternativa", query = "SELECT p FROM Personaje p WHERE p.fechaalternativa = :fechaalternativa")
    , @NamedQuery(name = "Personaje.findByFotografia", query = "SELECT p FROM Personaje p WHERE p.fotografia = :fotografia")
    , @NamedQuery(name = "Personaje.findByPersonadecontacto", query = "SELECT p FROM Personaje p WHERE p.personadecontacto = :personadecontacto")
    , @NamedQuery(name = "Personaje.findByDireccion", query = "SELECT p FROM Personaje p WHERE p.direccion = :direccion")
    , @NamedQuery(name = "Personaje.findByTelefono", query = "SELECT p FROM Personaje p WHERE p.telefono = :telefono")
    , @NamedQuery(name = "Personaje.findByCorreo", query = "SELECT p FROM Personaje p WHERE p.correo = :correo")
    , @NamedQuery(name = "Personaje.findByBiografia", query = "SELECT p FROM Personaje p WHERE p.biografia = :biografia")
    , @NamedQuery(name = "Personaje.findByProvincianacimiento", query = "SELECT p FROM Personaje p WHERE p.provincianacimiento = :provincianacimiento")
    , @NamedQuery(name = "Personaje.findByPueblonacimiento", query = "SELECT p FROM Personaje p WHERE p.pueblonacimiento = :pueblonacimiento")
    , @NamedQuery(name = "Personaje.findByProvinciaactual", query = "SELECT p FROM Personaje p WHERE p.provinciaactual = :provinciaactual")
    , @NamedQuery(name = "Personaje.findByPuebloactual", query = "SELECT p FROM Personaje p WHERE p.puebloactual = :puebloactual")})
public class Personaje implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpersonaje")
    private Integer idpersonaje;
    @Column(name = "nombrepersonaje")
    private String nombrepersonaje;
    @Column(name = "apellido1")
    private String apellido1;
    @Column(name = "apellido2")
    private String apellido2;
    @Column(name = "apodo1")
    private String apodo1;
    @Column(name = "apodo2")
    private String apodo2;
    @Column(name = "nombrecartel")
    private String nombrecartel;
    @Column(name = "fechanacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechanacimiento;
    @Column(name = "cossio")
    private Boolean cossio;
    @Column(name = "clm")
    private Boolean clm;
    @Column(name = "completo")
    private Boolean completo;
    @Column(name = "fechapresentacion")
    @Temporal(TemporalType.DATE)
    private Date fechapresentacion;
    @Column(name = "fechapicadores")
    @Temporal(TemporalType.DATE)
    private Date fechapicadores;
    @Column(name = "fechaalternativa")
    @Temporal(TemporalType.DATE)
    private Date fechaalternativa;
    @Lob
    @Column(name = "notas")
    private String notas;
    @Column(name = "fotografia")
    private String fotografia;
    @Column(name = "personadecontacto")
    private String personadecontacto;
    @Column(name = "direccion")
    private String direccion;
    @Column(name = "telefono")
    private String telefono;
    @Column(name = "correo")
    private String correo;
    @Column(name = "biografia")
    private String biografia;
    @Column(name = "provincianacimiento")
    private String provincianacimiento;
    @Column(name = "pueblonacimiento")
    private String pueblonacimiento;
    @Column(name = "provinciaactual")
    private String provinciaactual;
    @Column(name = "puebloactual")
    private String puebloactual;
    @ManyToMany(mappedBy = "personajeList")
    private List<Efemeride> efemerideList;
    @JoinTable(name = "trabajo", joinColumns = {
        @JoinColumn(name = "idpersonaje", referencedColumnName = "idpersonaje")}, inverseJoinColumns = {
        @JoinColumn(name = "idprofesion", referencedColumnName = "idprofesion")})
    @ManyToMany
    private List<Profesion> profesionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "personaje")
    private List<Fotos> fotosList;

    public Personaje() {
    }

    public Personaje(Integer idpersonaje) {
        this.idpersonaje = idpersonaje;
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

    public Boolean getCossio() {
        return cossio;
    }

    public void setCossio(Boolean cossio) {
        this.cossio = cossio;
    }

    public Boolean getClm() {
        return clm;
    }

    public void setClm(Boolean clm) {
        this.clm = clm;
    }

    public Boolean getCompleto() {
        return completo;
    }

    public void setCompleto(Boolean completo) {
        this.completo = completo;
    }

    public Date getFechapresentacion() {
        return fechapresentacion;
    }

    public void setFechapresentacion(Date fechapresentacion) {
        this.fechapresentacion = fechapresentacion;
    }

    public Date getFechapicadores() {
        return fechapicadores;
    }

    public void setFechapicadores(Date fechapicadores) {
        this.fechapicadores = fechapicadores;
    }

    public Date getFechaalternativa() {
        return fechaalternativa;
    }

    public void setFechaalternativa(Date fechaalternativa) {
        this.fechaalternativa = fechaalternativa;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getFotografia() {
        return fotografia;
    }

    public void setFotografia(String fotografia) {
        this.fotografia = fotografia;
    }

    public String getPersonadecontacto() {
        return personadecontacto;
    }

    public void setPersonadecontacto(String personadecontacto) {
        this.personadecontacto = personadecontacto;
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

    @XmlTransient
    public List<Efemeride> getEfemerideList() {
        return efemerideList;
    }

    public void setEfemerideList(List<Efemeride> efemerideList) {
        this.efemerideList = efemerideList;
    }

    @XmlTransient
    public List<Profesion> getProfesionList() {
        return profesionList;
    }

    public void setProfesionList(List<Profesion> profesionList) {
        this.profesionList = profesionList;
    }

    @XmlTransient
    public List<Fotos> getFotosList() {
        return fotosList;
    }

    public void setFotosList(List<Fotos> fotosList) {
        this.fotosList = fotosList;
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
