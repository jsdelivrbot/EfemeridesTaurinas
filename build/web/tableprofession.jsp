<%-- 
    Document   : tableprofession
    Created on : 07-jun-2018, 9:47:53
    Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(document).ready(function () {
                    $('#example').DataTable({
                        "language": {
                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "Buscar:",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }
                        }
                    });
                    $("select").val('10');
                    $('select').addClass("browser-default");
                    $('select').material_select();
                });
            });
        </script>
    </head>
    <body style="font-family: Arial">
        <form id="form1">
            <div style="width: 500px; border: 1px solid black; padding: 5px">
                <table id="example">
                    <thead>
                        <tr>
                            <th>ID
                            </th>
                            <th>City
                            </th>
                            <th>Country
                            </th>
                            <th>Continent
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Montería</td>
                            <td>Colombia</td>
                            <td>South America</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Birmingham</td>
                            <td>United Kingdom</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Bangalore</td>
                            <td>India</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Tokyo</td>
                            <td>Japan</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Kuala Lumpur</td>
                            <td>Malaysia</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>Rio de Janeiro</td>
                            <td>Brazil</td>
                            <td>South America</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Ipoh</td>
                            <td>Malaysia</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>Tawau</td>
                            <td>Malaysia</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>Hiroshima</td>
                            <td>Japan</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>Cannes</td>
                            <td>France</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>London</td>
                            <td>United Kingdom</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td>Saku</td>
                            <td>Japan</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>13</td>
                            <td>Nice</td>
                            <td>France</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>14</td>
                            <td>Manchester</td>
                            <td>United Kingdom</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>Salvador</td>
                            <td>Brazil</td>
                            <td>South America</td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td>Cali</td>
                            <td>Colombia</td>
                            <td>South America</td>
                        </tr>
                        <tr>
                            <td>17</td>
                            <td>Chennai</td>
                            <td>India</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>18</td>
                            <td>Brasília</td>
                            <td>Brazil</td>
                            <td>South America</td>
                        </tr>
                        <tr>
                            <td>19</td>
                            <td>Mumbai</td>
                            <td>India</td>
                            <td>Asia</td>
                        </tr>
                        <tr>
                            <td>20</td>
                            <td>Paris</td>
                            <td>France</td>
                            <td>Europe</td>
                        </tr>
                        <tr>
                            <td>21</td>
                            <td>Bello</td>
                            <td>Colombia</td>
                            <td>South America</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </body>
</html>

