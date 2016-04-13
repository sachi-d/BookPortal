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
public class User implements java.io.Serializable {

    private int iduser;
    private String username;
    private String password;
    private String user_level;
    private String fname;
    private String lname;
    private String nic;
    private int branch_idbranch;
    private int status;

    public User(int iduser, String username, String password, String user_level, String fname, String lname, String nic, int branch_idbranch) {
        this.iduser = iduser;
        this.username = username;
        this.password = password;
        this.user_level = user_level;
        this.fname = fname;
        this.lname = lname;
        this.nic = nic;
        this.branch_idbranch = branch_idbranch;
    }
    
    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser_level() {
        return user_level;
    }

    public void setUser_level(String user_level) {
        this.user_level = user_level;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getFullname(){
        return this.fname+" "+this.lname;
    }
    
    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public int getBranch_idbranch() {
        return branch_idbranch;
    }

    public void setBranch_idbranch(int branch_idbranch) {
        this.branch_idbranch = branch_idbranch;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
