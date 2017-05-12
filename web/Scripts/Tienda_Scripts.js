//Añadir, mostrar y ocultar Cesta

function cesta_Aniadir() {
    document.getElementById("añadircesta_Btn").onclick = muestra_Cantidad;
    
}
function muestra_Cantidad() {
    var cant = document.getElementById("cantidad_Cesta");
    if(cant != null){
        cant.style.display = "block";
    }
    document.getElementById("cesta").onmouseover = muestra_Cesta;
    document.getElementById("cesta").onmouseout = oculta_Cesta;
}
function muestra_Cesta(){
    document.getElementById("imgcesta").style = "cursor: pointer;";
    document.getElementById("cesta_Hover").style = "display:block; cursor:pointer; '-webkit-transition: 2.2s;'";        
}
function agranda_Cantidad(){
    document.getElementById("cantidad_Cesta").style = "font-size:111px;";   
}
function oculta_Cesta(){
    document.getElementById("cesta_Hover").style = "display:none;";
}

//FIN de Añadir, mostrar y ocultar Cesta

//Fixe con Limite
$(function () {
    if($('#pagar').val() != undefined){
        var top = $('#pagar').offset().top - parseFloat($('#pagar').css('marginTop').replace(/auto/, 0));
    }                
    var footTop = $('#footer').offset().top - parseFloat($('#footer').css('marginTop').replace(/auto/, 0));

    var maxY = footTop - $('#pagar').outerHeight();

    $(window).scroll(function (evt) {
        var y = $(this).scrollTop();
        if (y > top) {
            if (y < maxY) {
                $('#pagar').addClass('fixed').removeAttr('style');
            } else {
                $('#pagar').removeClass('fixed').css({
                    position: 'absolute',
                    top: (maxY - top) + 'px'
                });
            }
        } else {
            $('#pagar').removeClass('fixed');
        }
    });
});
        
// FIN de Fixe con Limite
           
var verif=true;
function fijarLogin(valor){
    if(valor == 'block'){
        verif = true;
    }else{
        varif = false;
    }
    if(verif){
        $('#login').css('display','block');
        verif=false;
    }else{
        $('#login').css('display','none');
        verif=true;
    }                    
}
function aceptar_cookies(){
    var d = new Date();
    d.setTime(d.getTime() + (365*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = "cookieSL=cookieAccepted; expires="+ expires;
    document.getElementById('cookies').style.display = 'none';
}
function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
function formarUsuario(d){
    var salida = d.getFullYear()+'';
    salida += agregaCero(d.getMonth()+1);
    salida += agregaCero(d.getDate());
    salida += agregaCero(d.getHours());
    salida += agregaCero(d.getMinutes());
    salida += agregaCero(d.getSeconds());
    salida += agregaCero(d.getMilliseconds());
    return salida;
}
function agregaCero(numero){
    var resp = '';
    if(numero<10){
        resp += '0'+numero;
    }else{
        resp += numero;
    }
    return resp;
}
function crearUsuario(){
    var d = new Date();
    var user = formarUsuario(d);
    d.setTime(d.getTime() + (30*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = "userCookieSL="+user+"; expires="+ expires;    
}