package Entities;

import Entities.Efemeride;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-05-29T15:18:36")
@StaticMetamodel(Personaje.class)
public class Personaje_ { 

    public static volatile SingularAttribute<Personaje, String> apellido2;
    public static volatile SingularAttribute<Personaje, String> apodo1;
    public static volatile SingularAttribute<Personaje, String> contacto;
    public static volatile SingularAttribute<Personaje, String> apodo2;
    public static volatile SingularAttribute<Personaje, Boolean> clm;
    public static volatile SingularAttribute<Personaje, Boolean> completo;
    public static volatile SingularAttribute<Personaje, String> apellido1;
    public static volatile SingularAttribute<Personaje, String> notas;
    public static volatile SingularAttribute<Personaje, String> direccion;
    public static volatile SingularAttribute<Personaje, String> biografia;
    public static volatile SingularAttribute<Personaje, String> averiguar;
    public static volatile SingularAttribute<Personaje, String> pueblonacimiento;
    public static volatile SingularAttribute<Personaje, String> provincianacimiento;
    public static volatile SingularAttribute<Personaje, Boolean> cossio;
    public static volatile SingularAttribute<Personaje, Integer> idpersonaje;
    public static volatile SingularAttribute<Personaje, Date> fechanacimiento;
    public static volatile SingularAttribute<Personaje, String> foto;
    public static volatile SingularAttribute<Personaje, String> provinciaactual;
    public static volatile SingularAttribute<Personaje, String> nombrepersonaje;
    public static volatile SingularAttribute<Personaje, String> correo;
    public static volatile ListAttribute<Personaje, Efemeride> efemerideList;
    public static volatile SingularAttribute<Personaje, String> telefono;
    public static volatile SingularAttribute<Personaje, String> nombrecartel;
    public static volatile SingularAttribute<Personaje, String> puebloactual;

}