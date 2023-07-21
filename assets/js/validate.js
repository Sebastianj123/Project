btn.addEventListener('onclick',(e)=>{

    e.preventDefault();

    let inps = document.querySelectorAll('form input'),
    form = document.querySelector('form');

    for (let i = 0; i < inps.length; i++) {
        let inp = inps[i];
        if (funciones.hollow(inp)) funciones.err({inp:inp,err:errores.hollow});    
    }

    let data = new FormData(form);
    console.log(data);

    // if(!validate.includes(false)){
        
    //     let data = new FormData(form);
    //     fetch('../../controller/get.php',
    //     {method:'POST',
    //     body:data})
    //     .then(datos=>datos.json())
    //     .then(datosFormulario=>
    //     console.log(datosFormulario))
    // }
    

})