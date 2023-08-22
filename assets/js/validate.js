etiquetas.form.addEventListener('submit',(e)=>{

    e.preventDefault();

    let inps = new FormData(form);
     
    for(let [name, value] of inps) {
        console.log(`${name} = ${value}`); // key1 = value1, luego key2 = value2
        let inp = document.querySelector(`[name="${name}"]`);
        // console.log(inp);
        if (funciones.hollow(inp)) funciones.err({inp:inp,err:errores.hollow});
    }
    // ,form = document.querySelector('form');

    // for (let i = 0; i < inps.length; i++) {
    //     let inp = inps[i];
    //     if (funciones.hollow(inp)) funciones.err({inp:inp,err:errores.hollow});    
    // }

    // let data = new FormData(form);
    // console.log(inps);

    // if(!validate.includes(false)){
        
    //     let data = new FormData(form);
    //     fetch('../../controller/get.php',
    //     {method:'POST',
    //     body:data})
    //     .then(datos=>datos.json())
    //     .then(datosFormulario=>
    //     console.log(datosFormulario))
    // }
    

});

// function val(e,id) {
//     e.preventDefault();
//     let data = new FormData(etiquetas.form)
//     console.log(data);
// };