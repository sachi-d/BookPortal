/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Model.Book;
import Model.Author;
import Model.Branch;
import Model.User;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Sachi
 */
public class DBDatalist {

    public static User getBranchadminfromBranch(String branch) {
        try {
            User b = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user a, branch b where a.user_level=\"Branch admin\" and a.branch_idbranch=b.idbranch and b.name=? and a.status=? and b.status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, branch);
            ps.setInt(2, 1);
            ps.setInt(3, 1);
            ResultSet rsetSub = ps.executeQuery();
            while (rsetSub.next()) {
                b = new User(
                        rsetSub.getInt(1),
                        rsetSub.getString(2),
                        rsetSub.getString(3),
                        rsetSub.getString(4),
                        rsetSub.getString(5),
                        rsetSub.getString(6),
                        rsetSub.getString(7),
                        rsetSub.getInt(8));
            }
            return b;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Branch> getBranchList() {
        try {
            ArrayList<Branch> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM branch where status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ResultSet rsetBranch = ps.executeQuery();

            while (rsetBranch.next()) {
                User ba = getBranchadminfromBranch(rsetBranch.getString(2));
                Branch branch = new Branch(
                        rsetBranch.getInt(1),
                        rsetBranch.getString(2),
                        rsetBranch.getString(3),
                        rsetBranch.getString(4),
                        ba);
                arr.add(branch);
            }
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<String> getSubjectList() {
        try {
            ArrayList<String> arr = new ArrayList<String>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT name FROM subject";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                String sub = rsetSub.getString(1);
                arr.add(sub);
            }
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<String> getTypeList() {
        try {
            ArrayList<String> arr = new ArrayList<String>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT name FROM type";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                String sub = rsetSub.getString(1);
                arr.add(sub);
            }
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<String> getLanguageList() {
        try {
            ArrayList<String> arr = new ArrayList<String>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT name FROM language";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                String sub = rsetSub.getString(1);
                arr.add(sub);
            }
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<String> getPublisherList() {
        try {
            ArrayList<String> arr = new ArrayList<String>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT name FROM publisher";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                String sub = rsetSub.getString(1);
                arr.add(sub);
            }
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static String getTypefromSubject(String sub) {
        try {
            String type = "f";

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT b.name FROM subject a, type b where a.type_idtype=b.idtype AND a.name=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, sub);
            ResultSet rsetSub = ps.executeQuery();
            while (rsetSub.next()) {
                type = rsetSub.getString(1);
            }
            return type;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList getFeaturedBookList() {
        try {
            ArrayList<Book> arr = getBookList();
            ArrayList<Book> fbl = new ArrayList<>();
            for (Book i : arr) {
                if (i.getFeatured() == 1) {
                    fbl.add(i);
                }
            }
            return fbl;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList getRecentBookList() {
        try {
            ArrayList<Book> arr = getBookList();
            ArrayList<Book> rbl = new ArrayList<>();
            for (Book i : arr) {
                Date pur = i.getPur_date();
                Date today = new Date();
                long diff = today.getTime() - pur.getTime();
                long days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
                if (days <= 31) {
                    rbl.add(i);
                }
            }
            return rbl;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<String> getAuthorfromBook(int idBook) {
        try {
            ArrayList<String> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM author a, book_has_author b Where b.book_idbook=? AND a.idauthor=b.author_idauthor ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idBook);
            ResultSet rsetAuth = ps.executeQuery();

            while (rsetAuth.next()) {
                int idauthor = rsetAuth.getInt(1);
                String name = rsetAuth.getString(2);
//                String author = new Author(idauthor, name);
                arr.add(name);
            }

            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getBookList() {
        try {
            ArrayList<Book> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM book where status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                String subject = getSubjectList().get(rsetBook.getInt(14) - 1);
                String type = getTypefromSubject(subject);
                String publisher = getPublisherList().get(rsetBook.getInt(12) - 1);
                String language = getLanguageList().get(rsetBook.getInt(13) - 1);
                ArrayList authors = getAuthorfromBook(rsetBook.getInt(1));
                Book b = new Book(
                        rsetBook.getInt(1),
                        rsetBook.getString(2),
                        rsetBook.getString(3),
                        rsetBook.getDate(4),//pub_date
                        rsetBook.getInt(5),
                        rsetBook.getDate(6),//pur_date
                        rsetBook.getDouble(7),
                        rsetBook.getString(8),
                        rsetBook.getString(9),
                        rsetBook.getInt(10),
                        rsetBook.getInt(11),
                        publisher,//publisher
                        language,//language
                        subject,
                        type,
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                arr.add(b);
            }

            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
