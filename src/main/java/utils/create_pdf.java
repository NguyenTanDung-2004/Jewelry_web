package utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import Database.interact_with_orders;

public class create_pdf {
	public static void create_project(String name, String phone, String address, ArrayList<ArrayList<Object>> list, String toal_money) {
		Document document = new Document();
    	try {
			PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\user\\Downloads\\abc.pdf"));
		} catch (FileNotFoundException | DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	document.open();
    	Font font = FontFactory.getFont(FontFactory.COURIER, 20, BaseColor.GREEN);
    	Font font1 = FontFactory.getFont(FontFactory.COURIER, 15, BaseColor.BLACK);
    	
    	try {
    		// Add a paragraph with the specified font
            document.add(new Paragraph("Thank you for your order!", font));
    		for (int i = 0; i < list.size(); i++) {
            	document.add(new Paragraph(list.get(i).get(1) + ": " + list.get(i).get(2) + " VND x " + list.get(i).get(6), font1));
            }
    		document.add(new Paragraph("Total money: " + toal_money + " VND", font1));
    		document.add(new Paragraph("Address: " + address, font1));
    		document.add(new Paragraph("Phone: " + phone, font1));
    		document.add(new Paragraph("Your Mail: " + name, font1));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	System.out.println("adfasdf");
    	document.close();
	}
	public static void main(String args[]) {
		create_pdf.create_project(null, "0977482071", "asdfasdf,asfasdfsdfasdf,asdfasdfasdf,asdfasdfasdf", interact_with_orders.get_products_by_order_id(1), "10.000.000");
	}
}
