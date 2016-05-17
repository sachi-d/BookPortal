/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.DBDatalist;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Sachi
 */
public class Book {

    private int idbook;
    private String title;
    private String ISBN;
    private Date pub_date;
    private int edition;
    private Date pur_date;
    private double price;
    private String description;
    private String image;
    private int featured;
    private int reserved;
    private Publisher publisher;
    private String language;
    private Subject subject;
    private int status;
    private ArrayList<String> authors;

    public Book() {
    }

    public Book(int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, Publisher publisher, String language, Subject subject, int status) {
        this.idbook = idbook;
        this.title = title;
        this.ISBN = ISBN;
        this.pub_date = pub_date;
        this.edition = edition;
        this.pur_date = pur_date;
        this.price = price;
        this.description = description;
        this.image = image;
        this.featured = featured;
        this.reserved = reserved;
        this.publisher = publisher;
        this.language = language;
        this.subject = subject;
        this.status = status;

    }

    public Book(int idbook, String title, Subject subject, String type) {    //for featured book
        this.idbook = idbook;
        this.title = title;
        this.subject = subject;
    }

    public Book(int idbook, String title, String ISBN, Publisher publisher, String language, Subject subject, String type) {
        this.idbook = idbook;
        this.title = title;
        this.ISBN = ISBN;
        this.publisher = publisher;
        this.language = language;
        this.subject = subject;
    }

    public Book(int idbook, String title, String ISBN, Date pub_date, int edition, Date pur_date, double price, String description, String image, int featured, int reserved, Publisher publisher, String language, Subject subject, ArrayList<String> auth) {
        this.idbook = idbook;
        this.title = title;
        this.ISBN = ISBN;
        this.pub_date = pub_date;
        this.edition = edition;
        this.pur_date = pur_date;
        this.price = price;
        this.description = description;
        this.image = image;
        this.featured = featured;
        this.reserved = reserved;
        this.publisher = publisher;
        this.language = language;
        this.subject = subject;
        this.authors = auth;
    }

    public ArrayList getAuthors() {
        return authors;
    }

    public void setAuthors(ArrayList authors) {
        this.authors = authors;
    }

    public int getIdbook() {
        return idbook;
    }

    public void setIdbook(int idbook) {
        this.idbook = idbook;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public Date getPub_date() {
        return pub_date;
    }

    public void setPub_date(Date pub_date) {
        this.pub_date = pub_date;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public Date getPur_date() {
        return pur_date;
    }

    public void setPur_date(Date pur_date) {
        this.pur_date = pur_date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getFeatured() {
        return featured;
    }

    public void setFeatured(int featured) {
        this.featured = featured;
    }

    public int getReserved() {
        return reserved;
    }

    public void setReserved(int reserved) {
        this.reserved = reserved;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getShortDescription() {
        String m = this.description.trim();
        if (m.length() < 123) {
            this.description = m + m;
            return getShortDescription();
        } else {
            String s = m.substring(0, 124) + "...";
            return s;
        }
    }

    public static String bookListtoJSArray() {

        //format
//        var projects = [
//            {
//               value: "java",
//               label: "Java",
//               desc: "write once run anywhere",
//            },
//            {
//               value: "jquery-ui",
//               label: "jQuery UI",
//               desc: "the official user interface library for jQuery",
//            },
//            {
//               value: "Bootstrap",
//               label: "Twitter Bootstrap",
//               desc: "popular front end frameworks ",
//            }
//         ];
        ArrayList<Book> arr = DBDatalist.getBookList();

        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String title = "label:" + "\"" + arr.get(i).getTitle() + "\"";
            String id = "value:" + "\"" + String.valueOf(arr.get(i).getIdbook()) + "\"";
            String price = "desc:" + "\"" + String.valueOf(arr.get(i).getPrice()) + "\"";
            String val = "{" + title + "," + id + "," + price + ",}";
            sb.append(val);
            if (i + 1 < arr.size()) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();////
    }

}
