const names = Object.freeze({
    usrNam: undefined,
    pass: undefined
}),
errores= Object.freeze({
    hollow: 'está vacio',
    espace: 'contiene un (os) espacios',
    inValid: 'contiene un (os) caracter (es) no valido (s)',
    long: 'está fuera de la longuitud (entre 4 - 30 letras)'
}),
funciones = {
    hollow(inp) {
        let a = inp.type == 'select-one'
        ? inp.checked
        : inp.value;
        if (a == '') return true
    },
    // Si contiene espacios
     espace(inp) {
        return /\s/g.test(inp.value);
    },
    // Si contiene un Numero
     num(inp) {
        return /[\d]/g.test(inp.value);
    },
    // Si contiene un Caracter alfabetico
     alpha(inp) {
        return /([A-Z])\w+/gi.test(inp.value);
    },
    // Regresa la longuitud de la cadena
     long(inp) {
        return inp.value.length;
    },
    ema(inp) {
        return  /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/g.test(inp.value);
    },
    err({inp,err}) {
        alert(`El campo ${inp} ${err}`);
        validate.push(false);
    }
},
data = {},
outErrores = {},
DOMd = freeze({
    btn: document.getElementById('enviar'),
    form: document.getElementById('form')
});

var validate = new Array();

