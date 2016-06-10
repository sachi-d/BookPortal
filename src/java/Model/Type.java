/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.DBDatalist;
import java.util.ArrayList;

/**
 *
 * @author Sachi
 */
public class Type {
    private int idType;
    private String name;

    public Type(int idType, String name) {
        this.idType = idType;
        this.name = name;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public static String subjectListtoJSArray(int idtype){
        Type t=DBDatalist.getType(idtype);
        //format = ["1","sub1","2","sub2"]
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        ArrayList<Subject> subs=DBDatalist.getSubjectsfromType(t);
        for(int i=0;i<subs.size();i++){
            String id="\""+subs.get(i).getIdsubject()+"\"";
            String name="\""+subs.get(i).getName()+"\"";
            sb.append(id);
            sb.append(",");
            sb.append(name);
            if (i + 1 < subs.size()) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
