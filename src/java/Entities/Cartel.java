/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

/**
 *
 * @author agustin
 */
public class Cartel {
    
    private String  nombretoro;
    private String nombreganaderia;
    private String nombreinterviniente;

    public Cartel(String nombretoro, String nombreganaderia, String nombreinterviniente) {
        this.nombretoro = nombretoro;
        this.nombreganaderia = nombreganaderia;
        this.nombreinterviniente = nombreinterviniente;
    }

    public String getNombretoro() {
        return nombretoro;
    }

    public void setNombretoro(String nombretoro) {
        this.nombretoro = nombretoro;
    }

    public String getNombreganaderia() {
        return nombreganaderia;
    }

    public void setNombreganaderia(String nombreganaderia) {
        this.nombreganaderia = nombreganaderia;
    }

    public String getNombreinterviniente() {
        return nombreinterviniente;
    }

    public void setNombreinterviniente(String nombreinterviniente) {
        this.nombreinterviniente = nombreinterviniente;
    }

    @Override
    public String toString() {
        return "Cartel{" + "nombretoro=" + nombretoro + ", nombreganaderia=" + nombreganaderia + ", nombreinterviniente=" + nombreinterviniente + '}';
    }
    
    
   
    
    
    
    
}