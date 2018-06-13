<%-- 
    Document   : modalcat
    Created on : 18-may-2018, 16:01:34
    Author     : agustin
--%>

<div id="modalprof" class="modal" style="height:  auto!important; width: 80%!important">
    <div class="container">
        <div class="modal-content">

            <h5 class="titles_red_h5">Añadir Profesion</h5> 

            <div class="row">
                <form class="filter-form" action="controllers/controllerProfesion.jsp?op=addprofession" method="POST" name="addelementstable">
                    <div class="row">
                        <div class="input-field col s12">
                            <input required="required" name="newprofession" id="profession" type="text" class="validate">
                            <label for="profession">Nombre de la profesión</label>
                        </div>
                    </div>
                    <div class="row center">
                        <div class="col s6 m6 s6">
                            <button class="btn modal-action modal-close waves-effect btn-flat grey darken-4 white-text" id="btnaddelementtable" type="submit"> Aceptar<i class="material-icons right">add</i></button>
                        </div>
                        <div class="col s6 m6 s6">
                            <button class="btn modal-close waves-effect btn-flat grey darken-4 white-text" type="button"> Cancelar<i class="material-icons right">cancel</i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>      