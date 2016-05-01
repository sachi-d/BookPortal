/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Author;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Model.Book;
import Model.Bill;
import Model.Branch;
import Model.Language;
import Model.Log;
import Model.Notification;
import Model.Publisher;
import Model.Purchaserequest;
import Model.Report;
import Model.Stock;
import Model.Subject;
import Model.Type;
import Model.User;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Sachi
 */
public class DBDatalist {

    public static ArrayList<Purchaserequest> getNewPurreqList() {
        try {
            ArrayList<Purchaserequest> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM purchase_req where status=? OR status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "New");
            ps.setString(2, "Accepted");
            ResultSet rsetPurreq = ps.executeQuery();

            while (rsetPurreq.next()) {
                Bill bill = getBill(rsetPurreq.getInt(5));

                Purchaserequest pur = new Purchaserequest(
                        rsetPurreq.getInt(1),
                        rsetPurreq.getString(2),
                        rsetPurreq.getString(3),
                        rsetPurreq.getString(4),
                        bill);

                arr.add(pur);

            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Purchaserequest> getPurreqList() {
        try {
            ArrayList<Purchaserequest> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM purchase_req ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetPurreq = ps.executeQuery();

            while (rsetPurreq.next()) {
                Bill bill = getBill(rsetPurreq.getInt(5));
                Purchaserequest pur = new Purchaserequest(
                        rsetPurreq.getInt(1),
                        rsetPurreq.getString(2),
                        rsetPurreq.getString(3),
                        rsetPurreq.getString(4),
                        bill);
                arr.add(pur);

            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Stock> getStockList() {
        try {
            ArrayList<Stock> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM branch_stock ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetStock = ps.executeQuery();

            while (rsetStock.next()) {
                int id = rsetStock.getInt(1);
                Branch branch = getBranch(rsetStock.getInt(2));
                Book book = getBook(rsetStock.getInt(3));
                Date d = rsetStock.getDate(5);
                int q = rsetStock.getInt(4);
                Stock stock = new Stock(id, book, branch, q, d);
                arr.add(stock);

            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Notification> getNotificationList() {
        try {
            ArrayList<Notification> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM notification ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetNotification = ps.executeQuery();

            while (rsetNotification.next()) {
                User targetuser = getUser(rsetNotification.getInt(2));
                String type = rsetNotification.getString(3);
                if (type.equals("UserReg")) {
                    User newuser = getUserfromAllUsers(rsetNotification.getInt(6));
                    Notification not = new Notification(
                            rsetNotification.getInt(1),
                            targetuser,
                            type,
                            rsetNotification.getString(4),
                            rsetNotification.getInt(5),
                            newuser,
                            null,
                            rsetNotification.getTimestamp(8));
                    arr.add(not);
                } else {
                    Report newreport = getReport(rsetNotification.getInt(7));
                    Notification not = new Notification(
                            rsetNotification.getInt(1),
                            targetuser,
                            type,
                            rsetNotification.getString(4),
                            rsetNotification.getInt(5),
                            null,
                            newreport,
                            rsetNotification.getTimestamp(8));
                    arr.add(not);
                }
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Notification> getAllNotificationsforUser(int iduser) {
        try {
            ArrayList<Notification> arr = new ArrayList<>();
            ArrayList<Notification> all = DBDatalist.getNotificationList();
            for (Notification i : all) {
                if (i.getTargetuser().getIduser() == iduser) {
                    arr.add(i);
                }
            }
            return arr;
        } catch (Exception e) {
            System.out.println("getallnotifications" + e);
            return null;
        }
    }

    public static ArrayList<Notification> getNewNotificationsforUser(int iduser) {
        try {
            ArrayList<Notification> arr = new ArrayList<>();
            ArrayList<Notification> all = DBDatalist.getNotificationList();
            for (Notification i : all) {
                if (i.getTargetuser().getIduser() == iduser) {
                    if (i.getStatus() == 1) {
                        arr.add(i);
                    }
                }
            }
            return arr;
        } catch (Exception e) {
            System.out.println("getnewnotifications" + e);
            return null;
        }
    }

    public static ArrayList<Bill> getBillList() {
        try {
            ArrayList<Bill> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM bill ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetBill = ps.executeQuery();

            while (rsetBill.next()) {
                HashMap<Book, Integer> items = getBillitemsfromBill(rsetBill.getInt(1));
                User user = getUser(rsetBill.getInt(5));
                Bill rep = new Bill(
                        rsetBill.getInt(1),
                        rsetBill.getDate(2),
                        rsetBill.getDouble(3),
                        rsetBill.getString(4),
                        user,
                        items);
                arr.add(rep);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static HashMap<Book, Integer> getBillitemsfromBill(int idbill) {
        try {
            HashMap<Book, Integer> items = new HashMap();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT book_idbook,quantity FROM book_has_bill where Bill_idBill=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idbill);
            ResultSet rsetBill = ps.executeQuery();

            while (rsetBill.next()) {
                Book b = getBook(rsetBill.getInt(1));
                items.put(b, rsetBill.getInt(2));
            }
            con.close();
            return items;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Report> getCustomReportList(String type) {  //type=MB, MG AB, AG 
        try {
            ArrayList<Report> arr2 = new ArrayList<>();
            for (Report i : DBDatalist.getReportList()) {
                if (i.getType().equals(type)) {
                    arr2.add(i);
                }
            }
            return arr2;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Report> getReportList() {
        try {
            ArrayList<Report> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM report ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetReport = ps.executeQuery();

            while (rsetReport.next()) {
                Report rep = new Report(
                        rsetReport.getInt(1),
                        rsetReport.getString(2),
                        rsetReport.getString(3),
                        rsetReport.getInt(4),
                        rsetReport.getString(5),
                        rsetReport.getString(6),
                        rsetReport.getString(7));
                arr.add(rep);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static User getUserfromAllUsers(int uid) {
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user where iduser=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, uid);
            ResultSet rsetUser = ps.executeQuery();

            User u = null;
            while (rsetUser.next()) {
                Branch b = DBDatalist.getBranch(rsetUser.getInt(8));
                u = new User(
                        rsetUser.getInt(1),
                        rsetUser.getString(2),
                        rsetUser.getString(3),
                        rsetUser.getString(4),
                        rsetUser.getString(5),
                        rsetUser.getString(6),
                        rsetUser.getString(7),
                        b);

            }
            con.close();
            return u;

        } catch (Exception e) {
            System.out.println("getuserlist error " + e);
            return null;
        }
    }

    public static ArrayList<User> getUserList() {
        try {
            ArrayList<User> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user where status=? or status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setInt(2, 2);
            ResultSet rsetUser = ps.executeQuery();

            while (rsetUser.next()) {
                Branch b = DBDatalist.getBranch(rsetUser.getInt(8));
                User u = new User(
                        rsetUser.getInt(1),
                        rsetUser.getString(2),
                        rsetUser.getString(3),
                        rsetUser.getString(4),
                        rsetUser.getString(5),
                        rsetUser.getString(6),
                        rsetUser.getString(7),
                        b);
                arr.add(u);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println("getuserlist error " + e);
            return null;
        }
    }

    public static ArrayList<Log> getLogList() {
        try {
            ArrayList<Log> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM log ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetBranch = ps.executeQuery();

            while (rsetBranch.next()) {
//                User user = null;
                User user = getUser(rsetBranch.getInt(4));
                Log log = new Log(
                        rsetBranch.getInt(1),
                        rsetBranch.getTimestamp(2),
                        rsetBranch.getString(3),
                        rsetBranch.getString(5),
                        user);
                arr.add(log);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static User getBranchadminfromBranch(Branch branch) {
        try {
            User b = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user a, branch b where a.user_level=1 and a.branch_idbranch=b.idbranch and b.name=? and a.status=? and b.status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, branch.getName());
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
                        branch);
            }
            con.close();
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
//                User ba = getBranchadminfromBranch(rsetBranch.getString(2));
                Branch branch = new Branch(
                        rsetBranch.getInt(1),
                        rsetBranch.getString(2),
                        rsetBranch.getString(3),
                        rsetBranch.getString(4));
                arr.add(branch);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Subject> getSubjectList() {
        try {
            ArrayList<Subject> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM subject";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                Type type = getType(rsetSub.getInt(3));
                Subject sub = new Subject(rsetSub.getInt(1), rsetSub.getString(2), type);
                arr.add(sub);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Type> getTypeList() {
        try {
            ArrayList<Type> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM type";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String sub = rsetSub.getString(2);
                Type t = new Type(id, sub);
                arr.add(t);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Language> getLanguageList() {
        try {
            ArrayList<Language> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM language";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String sub = rsetSub.getString(2);
                Language lan = new Language(id, sub);
                arr.add(lan);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Publisher> getPublisherList() {
        try {
            ArrayList<Publisher> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM publisher";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String sub = rsetSub.getString(2);
                Publisher pub = new Publisher(id, sub);
                arr.add(pub);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Author> getAuthorList() {
        try {
            ArrayList<Author> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM author";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String name = rsetSub.getString(2);
                Author a = new Author(id, name);
                arr.add(a);
            }
            con.close();
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
            con.close();
            return type;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Subject> getSubjectsfromType(Type t) {
        try {
            ArrayList<Subject> arr = new ArrayList<>();
            int idtype = t.getIdType();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM subject where type_idtype=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idtype);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                Subject sub = new Subject(rsetSub.getInt(1), rsetSub.getString(2), t);
                arr.add(sub);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getFeaturedBookList() {
        try {
            ArrayList<Book> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM book where status=? AND featured=? order by name";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setInt(2, 1);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
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
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                arr.add(b);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getRecentBookList() {
        try {
            ArrayList<Book> rbl = new ArrayList<>();
            for (Book i : DBDatalist.getBookList()) {
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

    public static ArrayList<Author> getAuthorfromBook(int idBook) {
        try {
            ArrayList<Author> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM author a, book_has_author b Where b.book_idbook=? AND a.idauthor=b.author_idauthor ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idBook);
            ResultSet rsetAuth = ps.executeQuery();

            while (rsetAuth.next()) {
                int idauthor = rsetAuth.getInt(1);
                String name = rsetAuth.getString(2);
                Author author = new Author(idauthor, name);
                arr.add(author);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getBookListfromSubject(int idsub) {
        try {
            ArrayList<Book> arr = new ArrayList<>();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM book where status=? and subject_idsubject=? order by name";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setInt(2, idsub);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
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
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                arr.add(b);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getBookListfromType(int idtype) {
        try {
            ArrayList<Book> arr = new ArrayList<>();
            Type t = getType(idtype);
            ArrayList<Subject> sublist = getSubjectsfromType(t);
            Connection con = DBConnectionHandler.createConnection();
            for (int i = 0; i < sublist.size(); i++) {
                int idsub = sublist.get(i).getIdsubject();

                String query = "SELECT * FROM book where status=? and subject_idsubject=? order by name";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, 1);
                ps.setInt(2, idsub);
                ResultSet rsetBook = ps.executeQuery();

                while (rsetBook.next()) {

                    Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                    Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                    String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                    ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
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
                            authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                    arr.add(b);
                }

            }
            con.close();
            return arr;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static ArrayList<Book> getBookListfromName(String name) {
        try {
            String n = "%" + name + "%";
            ArrayList<Book> arr = new ArrayList<>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM book where status=? and name like ? order by name";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setString(2, n);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
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
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                arr.add(b);
            }

            con.close();
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
            String query = "SELECT * FROM book where status=? order by name";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
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
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
                arr.add(b);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static User getUser(int iduser) {
        try {
            User arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user where iduser=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, iduser);
            ResultSet rsetUser = ps.executeQuery();

            while (rsetUser.next()) {
                Branch b = DBDatalist.getBranch(rsetUser.getInt(8));
                arr = new User(
                        rsetUser.getInt(1),
                        rsetUser.getString(2),
                        rsetUser.getString(3),
                        rsetUser.getString(4),
                        rsetUser.getString(5),
                        rsetUser.getString(6),
                        rsetUser.getString(7),
                        b);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println("getuserlist error " + e);
            return null;
        }
    }

    public static Book getBook(int idbook) {
        try {
            Book arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM book where status=? AND idbook=? order by name";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setInt(2, idbook);
            ResultSet rsetBook = ps.executeQuery();

            while (rsetBook.next()) {

                Subject subject = DBDatalist.getSubject(rsetBook.getInt(14));
                Publisher publisher = DBDatalist.getPublisher(rsetBook.getInt(12));
                String language = DBDatalist.getLanguage(rsetBook.getInt(13));
                ArrayList authors = DBDatalist.getAuthorfromBook(rsetBook.getInt(1));
                arr = new Book(
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
                        authors);
//                (int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, String publisher, String language, String subject, String type) {
            }
            con.close();
            return arr;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Bill getBill(int idbill) {
        try {
            Bill arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM bill where idBill=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idbill);
            ResultSet rsetBill = ps.executeQuery();

            while (rsetBill.next()) {
                HashMap<Book, Integer> items = getBillitemsfromBill(rsetBill.getInt(1));
                User user = getUser(rsetBill.getInt(5));
                arr = new Bill(
                        rsetBill.getInt(1),
                        rsetBill.getDate(2),
                        rsetBill.getDouble(3),
                        rsetBill.getString(4),
                        user,
                        items);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Branch getBranch(int idbranch) {
        try {
            Branch bb = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM branch where status=? AND idbranch=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, 1);
            ps.setInt(2, idbranch);
            ResultSet rsetBranch = ps.executeQuery();

            while (rsetBranch.next()) {
//                User ba = getBranchadminfromBranch(rsetBranch.getString(2));
                bb = new Branch(
                        rsetBranch.getInt(1),
                        rsetBranch.getString(2),
                        rsetBranch.getString(3),
                        rsetBranch.getString(4));

            }
            con.close();
            return bb;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Publisher getPublisher(int idpublisher) {
        try {
            Publisher arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM publisher WHERE idpublisher=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idpublisher);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String sub = rsetSub.getString(2);
                arr = new Publisher(id, sub);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static String getLanguage(int idlanguage) {
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT name FROM language where idlanguage=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idlanguage);
            ResultSet rsetSub = ps.executeQuery();
            String lan = null;
            while (rsetSub.next()) {
                lan = rsetSub.getString(1);
            }
            con.close();
            return lan;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Subject getSubject(int idsubject) {
        try {
            Subject arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM subject where idsubject=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idsubject);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                Type type = getType(rsetSub.getInt(3));
                arr = new Subject(rsetSub.getInt(1), rsetSub.getString(2), type);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Type getType(int idtype) {
        try {
            Type arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM type where idtype=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idtype);
            ResultSet rsetSub = ps.executeQuery();

            while (rsetSub.next()) {
                int id = rsetSub.getInt(1);
                String sub = rsetSub.getString(2);
                arr = new Type(id, sub);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Report getReport(int idrep) {
        try {
            Report arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM report where idReport=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idrep);
            ResultSet rsetReport = ps.executeQuery();

            while (rsetReport.next()) {
                arr = new Report(
                        rsetReport.getInt(1),
                        rsetReport.getString(2),
                        rsetReport.getString(3),
                        rsetReport.getInt(4),
                        rsetReport.getString(5),
                        rsetReport.getString(6),
                        rsetReport.getString(7));
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static Purchaserequest getPurchaserequest(int idpurreq) {
        try {
            Purchaserequest arr = null;

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM purchase_req where idPurchase_req=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idpurreq);
            ResultSet rsetPurreq = ps.executeQuery();

            while (rsetPurreq.next()) {
                Bill bill = getBill(rsetPurreq.getInt(5));

                arr = new Purchaserequest(
                        rsetPurreq.getInt(1),
                        rsetPurreq.getString(2),
                        rsetPurreq.getString(3),
                        rsetPurreq.getString(4),
                        bill);
            }
            con.close();
            return arr;

        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
