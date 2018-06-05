<%-- 
    Document   : modalcat
    Created on : 18-may-2018, 16:01:34
    Author     : agustin
--%>

<div id="modalcat" class="modal">
    <div class="container">
        <div class="modal-content">

            <h5 class="titles_red_h5">Añadir Cartel <i id="informationimage " data-position="bottom" data-delay="50" data-tooltip="Debe rellenar todos los campos" onclick="myFunction()" class=" tooltipped material-icons information_orange_buttons">info</i></h5> 

            <div class="row">
                <form class="filter-form" action="controllers/controller.jsp?op=addelementstable" method="POST" name="addelementstable">
                    <div class="row">
                        <div class="input-field col s12">
                            <input  required="required" name="nombretoro" id="newcategoria" type="text" class="validate">
                            <label for="categoria">Toro</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input required="required" name="nombreganaderia" id="newcategoria" type="text" class="validate">
                            <label for="categoria">Ganadería</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input required="required" name="nombreinterviniente" id="newcategoria" type="text" class="validate">
                            <label for="categoria">Interviniente</label>
                        </div>
                    </div>
                    <div class="row center">
                        <button class="btn modal-action modal-close waves-effect btn-flat grey darken-4 white-text" id="btnaddelementtable" type="submit"> Aceptar<i class="material-icons right">add</i></button>
                        <button class="btn modal-close waves-effect btn-flat grey darken-4 white-text" type="button"> Cancelar<i class="material-icons right">cancel</i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>      