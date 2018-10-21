/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package methods;

import Entities.Efemeride;
import Entities.Personaje;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author agustin
 */
public class Inform {

    public void generateInformPDF(HttpServletRequest request, HttpServletResponse response, Personaje p) throws ServletException, IOException {

        response.setContentType("application/pdf");

        Document documento = new Document(PageSize.A4.rotate());

        try {

            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();

            documento.addAuthor("Efemérides Taurinas");
            documento.addTitle("Efemérides Taurinas");
            documento.addCreationDate();

            Font bold = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            Paragraph paraName = new Paragraph(p.getNombrepersonaje() + " " + p.getApellido1() + " " + p.getApellido2(), bold);
            paraName.setAlignment(Element.ALIGN_JUSTIFIED);
            PdfPTable table = new PdfPTable(1);
            PdfPCell cell1 = new PdfPCell(paraName);
            cell1.setColspan(5);
            cell1.setBorderColor(BaseColor.WHITE);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell1);
            table.setSpacingAfter(25);
            documento.add(table);

            /*
            Image img = Image.getInstance(p.getFoto());
            img.setAlignment(Element.ALIGN_CENTER);
            img.scaleToFit(200f, 300f);
            documento.add(img);
             */
            PdfPTable table2 = new PdfPTable(2);
            table2.setWidths(new float[]{30, 70});

            //fila 1
            table2.addCell("Primer Apodo");
            table2.addCell(p.getApellido1());
            //fila 2
            table2.addCell("Segundo Apodo");
            table2.addCell(p.getApellido2());
            //fila3
            table2.addCell("Nombre cartel");
            table2.addCell(p.getNombrecartel());

            table2.addCell("Fecha nacimiento");
            table2.addCell(p.getFechanacimiento().toString());

            table2.addCell("Provincia de nacimiento");
            table2.addCell(p.getProvincianacimiento());

            table2.addCell("Pueblo de nacimiento");
            table2.addCell(p.getPueblonacimiento());

            table2.addCell("Profesión");
            table2.addCell("Esta es la profesion");

            table2.addCell("Dirección");
            table2.addCell(p.getDireccion());

            table2.addCell("Contacto");
            table2.addCell(p.getPersonadecontacto());

            table2.addCell("Teléfono");
            table2.addCell(p.getTelefono());

            table2.addCell("Correo");
            table2.addCell(p.getCorreo());

            table2.addCell("Pueblo actual");
            table2.addCell(p.getPuebloactual());

            table2.addCell("Provincia actual");
            table2.addCell(p.getProvinciaactual());

            table2.addCell("Biografía");
            table2.addCell(p.getBiografia());

            table2.addCell("Notas");
            table2.addCell(p.getNotas());

            int contador = 1;
            for (int i = 0; i < p.getProfesionList().size(); i++) {

                table2.addCell(contador + "º Profesión");
                table2.addCell(p.getProfesionList().get(i).getDescripcion());
                contador++;
            }

            table2.setSpacingBefore(50);

            documento.add(table2);

            System.out.println("Documento creado");

            // step 5
            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
        }

    }

    public void generateInformPDFEfemeride(HttpServletRequest request, HttpServletResponse response, Efemeride e) throws ServletException, IOException, ParseException {

        response.setContentType("application/pdf");

        Document documento = new Document(PageSize.A4.rotate());

        try {

            PdfWriter.getInstance(documento, response.getOutputStream());
            documento.open();

            documento.addAuthor("Efemérides Taurinas");
            documento.addTitle("Efemérides Taurinas");
            documento.addCreationDate();

            Font bold = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);

            Paragraph paraName = new Paragraph(e.getTipoevento());
            paraName.setAlignment(Element.ALIGN_JUSTIFIED);
            PdfPTable table = new PdfPTable(1);
            PdfPCell cell1 = new PdfPCell(paraName);
            cell1.setColspan(5);
            cell1.setBorderColor(BaseColor.WHITE);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell1);
            table.setSpacingAfter(25);
            documento.add(table);

            //dateFormat.parse(e.getFechaefemeride().toString());
            String OLD_FORMAT = "EEE MMM dd HH:mm:ss zzz yyyy";
            String NEW_FORMAT = "dd/MM/yyyy";

            DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");

            PdfPTable table2 = new PdfPTable(2);
            //fila 1
            table2.addCell("Fecha Efemeride");
            table2.addCell(dateFormat.format(e.getFechaefemeride()));

            table2.addCell("Fecha Real ");
            table2.addCell(dateFormat.format(e.getFechareal()));

            //fila 2
            table2.addCell("Evento");
            table2.addCell(e.getTipoevento());
            //fila3
            table2.addCell("Reportaje");
            table2.addCell(e.getReportaje());

            table2.addCell("Ganaderia");
            table2.addCell(e.getGanaderia());

            table2.addCell("Cartel");
            table2.addCell(e.getCartel());

            table2.addCell("Población");
            table2.addCell(e.getPueblo());

            table2.addCell("Provincia");
            table2.addCell(e.getProvincia());

            table2.addCell("Notas");
            table2.addCell(e.getNotas());

            for (Personaje p : e.getPersonajeList()) {
                table2.addCell("Personaje");
                table2.addCell(p.getNombrepersonaje() + " " + p.getApellido1() + " " + p.getApellido2());
            }

            table2.setSpacingBefore(50);

            documento.add(table2);

            System.out.println("Documento creado");

            // step 5
            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
        }

    }

}
