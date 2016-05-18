/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

/**
 *
 * @author Sachi
 */
public class GeneratePDF {
    public static void main(String[] args) {
        try {
            OutputStream file = new FileOutputStream(new File("C:\\Users\\Sachi\\Documents\\my work\\Test.pdf"));
 
            Document document = new Document(PageSize.A4);
            PdfWriter.getInstance(document, file);
 
            document.open();
            document.add(new Paragraph("Hello World, iText"));
            document.add(new Paragraph(new Date().toString()));
            document.addTitle("ssss");
            
//            document.add();
 
            document.close();
            file.close();
 
        } catch (Exception e) {
 
            e.printStackTrace();
        }
    }
    
}
