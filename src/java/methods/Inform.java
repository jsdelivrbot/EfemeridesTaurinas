/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package methods;

import Entities.Cartel;
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
            table2.setWidths(new float[] { 30, 70 });
            
            
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
            table2.addCell(p.getContacto());

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

            table2.addCell("Averiguar");
            table2.addCell(p.getAveriguar());

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

            Paragraph paraName = new Paragraph(e.getIdpersonaje().getNombrepersonaje() + " " + e.getIdpersonaje().getApellido1() + " " + e.getIdpersonaje().getApellido2(), bold);
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
            table2.addCell("Fecha");
            table2.addCell(dateFormat.format(e.getFechaefemeride()));
            //fila 2
            table2.addCell("Evento");
            table2.addCell(e.getEvento());
            //fila3
            table2.addCell("Reportaje");
            table2.addCell(e.getReportaje());

            table2.addCell("Población");
            table2.addCell(e.getPoblacion());

            table2.addCell("Notas");
            table2.addCell(e.getNotas());
            table2.setSpacingBefore(50);

            documento.add(table2);

            /*
                Creacion de la tabla para los carteles
             */
            Paragraph cartel = new Paragraph("Cartel");
            cartel.setSpacingBefore(50);
            documento.add(cartel);

            PdfPTable tableCartel = new PdfPTable(3);

            List<Cartel> listacartel = new ArrayList<Cartel>();

            Cartel cartel1 = new Cartel(e.getToro1(), e.getGanaderia1(), e.getInterviniente1());
            Cartel cartel2 = new Cartel(e.getToro2(), e.getGanaderia2(), e.getInterviniente2());
            Cartel cartel3 = new Cartel(e.getToro3(), e.getGanaderia3(), e.getInterviniente3());
            Cartel cartel4 = new Cartel(e.getToro4(), e.getGanaderia4(), e.getInterviniente4());
            Cartel cartel5 = new Cartel(e.getToro5(), e.getGanaderia5(), e.getInterviniente5());
            Cartel cartel6 = new Cartel(e.getToro6(), e.getGanaderia6(), e.getInterviniente6());

            listacartel.add(cartel1);
            listacartel.add(cartel2);
            listacartel.add(cartel3);
            listacartel.add(cartel4);
            listacartel.add(cartel5);
            listacartel.add(cartel6);

            tableCartel.addCell("Toro");
            tableCartel.addCell("Ganadería");
            tableCartel.addCell("Interviniente");
            for (int i = 0; i < listacartel.size(); i++) {
                if (listacartel.get(i).getNombretoro() != null || listacartel.get(i).getNombreganaderia() != null || listacartel.get(i).getNombreinterviniente() != null) {
                    tableCartel.addCell(listacartel.get(i).getNombretoro());
                    tableCartel.addCell(listacartel.get(i).getNombreganaderia());
                    tableCartel.addCell(listacartel.get(i).getNombreinterviniente());
                }
            }

            tableCartel.setSpacingBefore(50);
            documento.add(tableCartel);
            System.out.println("Documento creado");

            // step 5
            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
        }

    }

    public void generateFullInformPDF(HttpServletRequest request, HttpServletResponse response, Personaje p) throws ServletException, IOException {

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
            table2.setWidths(new float[] { 30, 70 });
            //fila 1
            table2.addCell("Primer Apodo");
            table2.addCell(p.getApellido1());
            //fila 2
            table2.addCell("Segundo Apodo");
            table2.addCell(p.getApellido2());
            //fila3
            table2.addCell("Nombre cartel");
            table2.addCell(p.getNombrecartel());

            DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");
            table2.addCell("Fecha nacimiento");
            table2.addCell(dateFormat.format(p.getFechanacimiento()));

            table2.addCell("Provincia de nacimiento");
            table2.addCell(p.getProvincianacimiento());

            table2.addCell("Pueblo de nacimiento");
            table2.addCell(p.getPueblonacimiento());

            table2.addCell("Profesión");
            table2.addCell("Esta es la profesion");

            table2.addCell("Dirección");
            table2.addCell(p.getDireccion());

            table2.addCell("Contacto");
            table2.addCell(p.getContacto());

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

            table2.addCell("Averiguar");
            table2.addCell(p.getAveriguar());

            int contador = 1;
            for (int i = 0; i < p.getProfesionList().size(); i++) {

                table2.addCell(contador + "º Profesión");
                table2.addCell(p.getProfesionList().get(i).getDescripcion());
                contador++;
            }

            table2.setSpacingBefore(50);

            documento.add(table2);

            dateFormat = new SimpleDateFormat("dd MMM, yyyy");

            for (int i = 0; i < p.getEfemerideList().size(); i++) {

                documento.newPage();
                Paragraph paraEfemeride = new Paragraph("Efeméride", bold);
                paraName.setAlignment(Element.ALIGN_JUSTIFIED);
                table = new PdfPTable(1);
                cell1 = new PdfPCell(paraEfemeride);
                cell1.setColspan(5);
                cell1.setBorderColor(BaseColor.WHITE);
                cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(cell1);
                table.setSpacingAfter(25);
                table.setSpacingBefore(25);
                documento.add(table);

                PdfPTable tableEfemeride = new PdfPTable(2);

                //fila 1
                tableEfemeride.addCell("Fecha");
                tableEfemeride.addCell(dateFormat.format(p.getEfemerideList().get(i).getFechaefemeride()));
                //fila 2
                tableEfemeride.addCell("Evento");
                tableEfemeride.addCell(p.getEfemerideList().get(i).getEvento());
                //fila3
                tableEfemeride.addCell("Reportaje");
                tableEfemeride.addCell(p.getEfemerideList().get(i).getReportaje());

                tableEfemeride.addCell("Población");
                tableEfemeride.addCell(p.getEfemerideList().get(i).getPoblacion());

                tableEfemeride.addCell("Notas");
                tableEfemeride.addCell(p.getEfemerideList().get(i).getNotas());

                tableEfemeride.setSpacingBefore(50);
                documento.add(tableEfemeride);

                PdfPTable tableCartel = new PdfPTable(3);

                //carteles
                List<Cartel> listacartel = new ArrayList<Cartel>();

                Cartel cartel1 = new Cartel(p.getEfemerideList().get(i).getToro1(), p.getEfemerideList().get(i).getGanaderia1(), p.getEfemerideList().get(i).getInterviniente1());
                Cartel cartel2 = new Cartel(p.getEfemerideList().get(i).getToro2(), p.getEfemerideList().get(i).getGanaderia2(), p.getEfemerideList().get(i).getInterviniente2());
                Cartel cartel3 = new Cartel(p.getEfemerideList().get(i).getToro3(), p.getEfemerideList().get(i).getGanaderia3(), p.getEfemerideList().get(i).getInterviniente3());
                Cartel cartel4 = new Cartel(p.getEfemerideList().get(i).getToro4(), p.getEfemerideList().get(i).getGanaderia4(), p.getEfemerideList().get(i).getInterviniente4());
                Cartel cartel5 = new Cartel(p.getEfemerideList().get(i).getToro5(), p.getEfemerideList().get(i).getGanaderia5(), p.getEfemerideList().get(i).getInterviniente5());
                Cartel cartel6 = new Cartel(p.getEfemerideList().get(i).getToro6(), p.getEfemerideList().get(i).getGanaderia6(), p.getEfemerideList().get(i).getInterviniente6());

                listacartel.add(cartel1);
                listacartel.add(cartel2);
                listacartel.add(cartel3);
                listacartel.add(cartel4);
                listacartel.add(cartel5);
                listacartel.add(cartel6);

                if (listacartel.get(0).getNombretoro() != null || listacartel.get(0).getNombreganaderia() != null || listacartel.get(0).getNombreinterviniente() != null) {

                    Paragraph paraCartel = new Paragraph("Cartel", bold);
                    paraName.setAlignment(Element.ALIGN_JUSTIFIED);
                    table = new PdfPTable(1);
                    cell1 = new PdfPCell(paraCartel);
                    cell1.setColspan(5);
                    cell1.setBorderColor(BaseColor.WHITE);
                    cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell(cell1);
                    table.setSpacingAfter(25);
                    table.setSpacingBefore(25);
                    documento.add(table);

                    tableCartel.addCell("Toro");
                    tableCartel.addCell("Ganadería");
                    tableCartel.addCell("Interviniente");

                    for (int j = 0; j < listacartel.size(); j++) {
                        if (listacartel.get(j).getNombretoro() != null || listacartel.get(j).getNombreganaderia() != null || listacartel.get(j).getNombreinterviniente() != null) {
                            tableCartel.addCell(listacartel.get(j).getNombretoro());
                            tableCartel.addCell(listacartel.get(j).getNombreganaderia());
                            tableCartel.addCell(listacartel.get(j).getNombreinterviniente());
                        }
                    }
                }

                tableCartel.setSpacingBefore(30);
                documento.add(tableCartel);

            }

            System.out.println("Documento creado");

            // step 5
            documento.close();
        } catch (DocumentException de) {
            Logger.getLogger(Inform.class.getName()).log(Level.SEVERE, null, de);
        }
    }
}
