/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Sachi
 */
public class Language {
    private int idlan;
    private String name;

    public Language(int idlan, String name) {
        this.idlan = idlan;
        this.name = name;
    }

    public int getIdlan() {
        return idlan;
    }

    public void setIdlan(int idlan) {
        this.idlan = idlan;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
