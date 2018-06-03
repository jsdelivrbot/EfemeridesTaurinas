<%-- 
    Document   : commonscripts
    Created on : 29-may-2018, 15:54:24
    Author     : agustin
--%>

<script>
    /*open an confirg dialog with a message that submit the form, and as every
     * form have the same name we have to concat the id of the character
     */
    function confirmdelete(id) {
        var formName = "formDelete-" + id;

        if (confirm("Si elimina un personaje si eliminarán todos las efemérides asocidas a el ¿Seguro que quiere continuar?")) {
            console.log("ACEPTADO");
            $('form[name="' + formName + '"]').submit();
        } else {
            console.log("CANCELADO");
        }
    }
</script>
