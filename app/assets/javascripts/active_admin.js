//= require active_admin/base

$(function(){
    $(".js-bloqueo ").click(_bloqueo);
    $(".js-desbloqueo ").click(_desbloqueo);
});


var _bloqueo = function() {
    var usuarioId = this.id.split("-")[1];

    $.ajax({
        type: 'post',
        url: "/usuarios/" + usuarioId + "/bloqueo.json",
        dataType: 'json',
        success: function() {
            alert("El usuario ha sido bloqueado exitosamente") ;
            window.location = window.location;
        },
        error: function() {
            alert("El usuario no se pudo bloquear")
        }
    });
    return false;
};

var _desbloqueo = function() {
    var usuarioId = this.id.split("-")[1];

    $.ajax({
        type: 'post',
        url: "/usuarios/" + usuarioId + "/desbloqueo.json",
        dataType: 'json',
        success: function() {
            alert("El usuario ha sido desbloqueado exitosamente") ;
            window.location = window.location;
        },
        error: function() {
            alert("El usuario no se pude desbloquear");
        }
    });
    return false;
};
