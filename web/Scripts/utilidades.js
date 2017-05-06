function respuestaEliminacion(respuesta){
    if(respuesta){
        document.getElementById('accionocul').value = 'e';
        document.getElementById('frm').submit();        
    }else{
        document.getElementById('botonera').style.display = '';
        document.getElementById('confirmacionEliminacion').style.display = 'none';
    }
}
function marcarDesmarcarCheckbox(source){
    checkboxes=document.getElementsByTagName('input'); //obtenemos todos los controles del tipo Input
    for(i=0;i<checkboxes.length;i++){ //recoremos todos los controles
        if(checkboxes[i].type == "checkbox"){ //solo si es un checkbox entramos
            checkboxes[i].checked=source.checked; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
        }
    }
}