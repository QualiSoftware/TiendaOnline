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
            
function fijarLogin(value){
    if(value == "block"){
        $('#login').css('display',value);
        $('#iniciar_Sesion').hover(
                function(){$('#login').css('display',value);},
                function(){$('#login').css('display','none');});
    }else{
        $('#iniciar_Sesion').hover(
                function(){$('#login').css('display','block');},
                function(){$('#login').css('display',value);});
    }
}