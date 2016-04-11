/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Sachi
 */
public class DBConnectionHandler {

    private static Connection con = null;

    /**
     * method returns a connection to the database if exists
     *
     * @return database connection
     */
    public static Connection createConnection() {
        try {
            Class.forName(Constant.DRIVER_NAME);
            Connection conn = DriverManager.getConnection(Constant.DB_URL, Constant.DB_USERNAME, Constant.DB_PASSWORD);
            return conn;
        } catch (ClassNotFoundException ex) {
            System.out.println("CNFE " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("SQLE " + ex.getMessage());
        }
        return null;
    }

    /**
     * method gives the connection to the database if exists else get a
     * connection
     *
     * @return database connection
     */
    public static Connection getConnection() {
        if (con == null) {
            con = createConnection();
        }
        try {
            if (con.isValid(1)) {
                return con;
            }
        } catch (SQLException ex) {

        }
        closeConnection();
        con = createConnection();
        return con;
    }

    public static void closeConnection() {
        try {
            con.close();
        } catch (Exception ex) {

        }
        con = null;
    }
}
