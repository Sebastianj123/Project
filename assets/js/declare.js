const 
etiquetas = Object.freeze({
    btn: document.getElementById('enviar'),
    form: document.getElementById('form'),
    checks: document.querySelectorAll('input[type="checkbox"]'),

}),
names = Object.freeze({
    usrNam: undefined,
    pass: undefined
}),
errores = Object.freeze({
    hollow: 'está vacio',
    espace: 'contiene un (os) espacios',
    inValid: 'contiene un (os) caracter (es) no valido (s)',
    long: 'está fuera de la longuitud (entre 4 - 30 letras)'
}),
exp = Object.freeze({
    espace: /\s/g,
    num: /[\d]/g,
    alpha: /([A-Z])\w+/gi,
    ema: /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/g
}),
funciones = {
    hollow(inp) {
        // debugger;
        let a = inp.type == 'checkbox'
            ? inp.checked
            : inp.value;
        if (a == '' || a == 'defauld') return true
    },

    // Si contiene espacios
    espace(inp) {
        return exp.espace.test(inp.value);
    },
    
    // Si contiene un Numero
    num(inp) {
        return exp.num.test(inp.value);
    },
    
    // Si contiene un Caracter alfabetico
    alpha(inp) {
        return exp.alpha.test(inp.value);
    },
    
    // Regresa la longuitud de la cadena
    long(inp) {
        return inp.value.length;
    },

    // Revisa si es un correo
    ema(inp) {
        return exp.ema.test(inp.value);
    },

    // Ejecuta si hay un error
    err({ inp, err }) {
        let span = inp.parentNode.querySelector('span');
        alert(`El campo ${span.textContent} ${err}`);
        outErrores[span.textContent] = err;
        validate.push(false);
    },

    mssError(mssError) {
        const mssP = 'Los errores se rectificarán luego de reenvíar el formulário';
        
    }
},
outErrores = new Object;

var validate = new Array();

