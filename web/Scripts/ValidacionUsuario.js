function Verificar(action) {
    if(action === 'v'){
        document.getElementById('frm').action = "Tienda";
        document.getElementById('frm').submit();
    }else if(action === 'c'){
        document.getElementById('frm').action = "FormContrasenia";
        document.getElementById('frm').submit();
    }else{
        var verifica = true;
        var contraseniasIguales = true;
        var mayor18 = true;
        var emailCorrecto = true;
        if (action === 'e') {
            if (confirm("¿Seguro que desea eliminar su usuario?")) {
                document.getElementById('accionocul').value = action;
            }else{
                verifica = false;
            }
        } else if(document.getElementById('accionocul').value === 'a') {
            if(document.getElementById('usuPassword2').value != document.getElementById('passVerif').value){
                contraseniasIguales = false;
                verifica = false;
            }
            var aux1 = RellenaCampos();
            var aux2 = contraseniaRellena();
            if(aux1 && aux2){
                verifica = true;
            }else{
                verifica = false;
            }
            mayor18 = Mayor18Anios();
            /*MensajeError(verifica);*/
        } else {
            mayor18 = Mayor18Anios();
            verifica = RellenaCampos();
            /*MensajeError(verifica);*/
        }
        emailCorrecto = validarEmail(document.getElementById('usuEmail2').value);
        var mensaje = document.getElementById('camposVacios');
        mensaje.innerHTML = "";
        if(!verifica){
            mensaje.innerHTML = "Por favor rellene los campos obligatorios.<br>";
        }
        if(!contraseniasIguales){
            mensaje.innerHTML += "Las contraseñas deben ser iguales.<br>";
        }
        if(!mayor18){
            mensaje.innerHTML += "El usuario debe tener 18 años o más.<br>";
        }
        if(!emailCorrecto){
            mensaje.innerHTML += "El email ingresado es incorrecto.";
        }
        if(verifica && contraseniasIguales && mayor18 && emailCorrecto){
            document.getElementById('frm').submit();
        }
    }
}

function Mayor18Anios(){
    var nac = document.getElementById('usuFechaNac2').value;
    var mes;
    var dia = parseInt(nac.substring(2,0));
    var anio = parseInt(nac.substring(nac.length,6));
    var mayor = true;
    if(nac.substring(5,3) == 12){
        mes = 11;
    }else{
        mes = parseInt(nac.substring(5,3))-1;
    }
    var fNac = new Date(anio,mes,dia);
    var hoy = new Date();
    if((parseInt(hoy.getFullYear(), 10)-parseInt(fNac.getFullYear(), 10))<18){
        mayor = false;
    }else if(parseInt(hoy.getFullYear(), 10)-parseInt(fNac.getFullYear(), 10)==18){
        if(hoy.getMonth()<fNac.getMonth()){
            mayor = false;
        }else if(hoy.getMonth()==fNac.getMonth()){
            if(hoy.getDate()<fNac.getDate()){
                mayor = false;
            }
        }                    
    }
    return mayor;
}

function RellenaCampos(){                
    var user = document.getElementById('usuNombre2');
    var ap = document.getElementById('usuApellidos2');
    var email = document.getElementById('usuEmail2');
    var dir = document.getElementById('usuDireccion2');
    var cp = document.getElementById('usuCp2');
    var tel = document.getElementById('usuTelefono2');
    var loc = document.getElementById('usuLocalidad2');
    var envio = true;
    if(user.value == ""){
        user.style.borderColor="red";
        envio = false;
    }else{
        user.style.borderColor="white";
    }
    if(ap.value == ""){
        ap.style.borderColor="red";
        envio = false;
    }else{
        ap.style.borderColor="white";
    }
    if(email.value == ""){
        email.style.borderColor="red";
        envio = false;
    }else{
        email.style.borderColor="white";
    }
    if(dir.value == ""){
        dir.style.borderColor="red";
        envio = false;
    }else{
        dir.style.borderColor="white";
    }
    if(cp.value == ""){
        cp.style.borderColor="red";
        envio = false;
    }else{
        cp.style.borderColor="white";
    }
    if(tel.value == ""){
        tel.style.borderColor="red";
        envio = false;
    }else{
        tel.style.borderColor="white";
    }
    if(loc.value == ""){
        loc.style.borderColor="red";
        envio = false;
    }else{
        loc.style.borderColor="white";
    }
    return envio;
}

function contraseniaRellena(){
    var pass = document.getElementById('usuPassword2');
    var verif = document.getElementById('passVerif');
    var envio = true;
    if(pass.value == ""){
        pass.style.borderColor="red";
        envio = false;
    }else{
        pass.style.borderColor="white";
    }
    if(verif.value == ""){
        verif.style.borderColor="red";
        envio = false;
    }else{
        verif.style.borderColor="white";
    }
    return envio;
}

function validarEmail(email) {
    var emailOK = true;
    expr = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            /*/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;*/
    if (!expr.test(email)){
        emailOK = false;
    }
    return emailOK;
}

function usuarioLogin() {
    var rellena = contraseniaRellena();
    if(rellena){
        document.getElementById("frmLogin").submit();
    }else{
        fijarLogin('block');
    }
}