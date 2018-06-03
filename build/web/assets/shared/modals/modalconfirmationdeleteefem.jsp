<div id="modalefem" class="modal" style="height: auto!important">
    <div class="container">
        <div class="modal-content">
            <div class="row">
                <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=deleteefemeride" method="POST" name="addelementstable">
                    <h5 class="titles_red_h5">¿Desea eliminar la efeméride? <i id="informationimage " onclick="myFunction()" class="material-icons information_orange_buttons">info</i></h5> 

                    <div class="chip background_color_red white-text" id="dialogInformation" style="height: auto!important; display: none">
                        <i class="material-icons close">close</i>
                        ¡Si lo elimina no hay vuelta atras!
                    </div>

                    <script>
                        function myFunction() {
                            var x = document.getElementById("dialogInformation");
                            if (x.style.display === "none") {
                                x.style.display = "block";
                            } else {
                                x.style.display = "none";
                            }
                        }
                    </script>

                    <br/><br/>
                    <input class="" name="idefemeride" value="<%= request.getAttribute("idefemeridemodal")%>">
                    <div class="row center">
                        <button class="btn modal-action modal-close waves-effect btn-flat grey darken-4 white-text" type="submit"> Aceptar<i class="material-icons right">add</i></button>
                        <button class="btn modal-close waves-effect btn-flat grey darken-4 white-text" type="button"> Cancelar<i class="material-icons right">cancel</i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>     