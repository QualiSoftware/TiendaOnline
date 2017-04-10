function CampoRelleno(campo,mensaje){
    var relleno = true;
    if(campo.value == ""){
        mensaje.innerHTML = "Por favor rellene los campos obligatorios";
        campo.style.borderColor="red";
        relleno = false;
    }else{
        campo.style.borderColor="white";
    }
    return relleno;
}

function FechasCorrectas(inicio,fin,mensaje){
    var diaI = parseInt(inicio.substring(2,0));
    var mesI = parseInt(inicio.substring(5,3))
    var anioI = parseInt(inicio.substring(inicio.length,6));
    var diaF = parseInt(fin.substring(2,0));
    var mesF = parseInt(fin.substring(5,3))
    var anioF = parseInt(fin.substring(fin.length,6));
    var fechaOK = true;
    if(anioF < anioI){
        fechaOK = false;
    }else if((anioF == anioI) && (mesF < mesI)){
        fechaOK = false;
    }else if((anioF == anioI) && (mesF === mesI) && (diaF < diaI)){
        fechaOK = false;
    }
    if(!fechaOK){
        mensaje.innerHTML = "La fecha de fin de campaña debe ser <br>mayor o igual a la fecha de inicio";
    }
    return fechaOK;
}

function NumeroPositivoCorrecto(campo,mensaje){
    var todoOK = true;
    var preAux = campo.value.replace(",",".");
    if(isNaN(preAux)){
        todoOK = false;
    }else if(preAux < 0){
        todoOK = false;
    }
    if(todoOK){
        campo.style.borderColor="white";
    }else{
        mensaje.innerHTML = "<br>Campo numérico incorrecto";
        campo.style.borderColor="red";
    }
    return todoOK;
}
