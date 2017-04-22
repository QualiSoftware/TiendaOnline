function respuestaEliminacion(respuesta){
    if(respuesta){
        document.getElementById('accionocul').value = 'e';
        document.getElementById('frm').submit();        
    }else{
        document.getElementById('botonera').style.display = '';
        document.getElementById('confirmacionEliminacion').style.display = 'none';
    }
}