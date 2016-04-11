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
public class Publisher {

    private int idpublisher;
    private String name;

    public Publisher(String name) {
        this.name = name;
    }
    
    public int getIdpublisher() {
        return idpublisher;
    }

    public void setIdpublisher(int idpublisher) {
        this.idpublisher = idpublisher;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
