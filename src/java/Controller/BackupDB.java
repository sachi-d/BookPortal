/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import java.io.IOException;
import java.sql.Connection;

/**
 *
 * @author Sachi
 */
public class BackupDB {

    public static boolean backupDB() {

        Connection con = DBConnectionHandler.createConnection();

//        try {
            String mysqldumpPath = "C:\\xampp\\mysql\\bin";
            String backupName = "C:\\Users\\Sachi\\Desktop\\BookPortalDB_Backup\\BookPortal" + System.currentTimeMillis() + ".sql";
            boolean flag = backup(mysqldumpPath, backupName);
            return flag;
    }

    public static boolean backup(String mysqldumpPath, String backupPath) {
        boolean status = false;
        String username = "root";
        String password = "1234";
        String database = "bpoms";

        String command = mysqldumpPath + "/mysqldump -u " + username + " -p" + password + " " + database + " -r " + backupPath;
        try {
            Process runtimeProcess = Runtime.getRuntime().exec(command);
            int processComplete = runtimeProcess.waitFor();
            if (processComplete == 0) {
                System.out.println("DatabaseManager.backup: Backup Successfull");
                status = true;
            } else {
                System.out.println("DatabaseManager.backup: Backup Failure!");
            }
        } catch (IOException ioe) {
            System.out.println("Exception IO");
            ioe.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }
        return status;
    }

    public static boolean restore(String mysqlPath, String filePath) {
        boolean status = false;
        String username = "root";
        String password = "123";
        String database = "test";

        String[] command = new String[]{mysqlPath + "/mysql", database, "-u" + username, "-p" + password, "-e", " source " + filePath};

        try {
            Process runtimeProcess = Runtime.getRuntime().exec(command);
            int processComplete = runtimeProcess.waitFor();
            System.out.println(processComplete);
            if (processComplete == 0) {
                System.out.println("DatabaseManager.restore: Restore Successfull");
                status = true;
            } else {
                System.out.println("DatabaseManager.restore: Restore Failure!");
            }
        } catch (IOException ioe) {
            System.out.println("Exception IO");
            ioe.printStackTrace();
        } catch (Exception e) {
            System.out.println("Exception");
            e.printStackTrace();
        }
        return status;
    }
}
