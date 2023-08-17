let btn = document.getElementById('btnPassView');
btn.addEventListener ('click', (e)=>{
    console.log(e);
    const inp = document.getElementById('reg_pass');
    let classes = Object.values(btn.classList);
    let sgv = document.querySelector('#btnPassView > .bi-eye-slash-fill');
    let sgv2 = document.querySelector('#btnPassView > .bi-eye');

    if(classes.includes('active') ) {
        inp.type = 'text';
        sgv.classList.toggle('d-none');
        sgv2.classList.toggle('d-none');
    } else {
        inp.type = 'password'; 
        sgv.classList.toggle('d-none');
        sgv2.classList.toggle('d-none');
    }
    
});


let btn1 = document.getElementById('btnPassView1');
// console.log(btn.className);
btn1.addEventListener ('click', ()=>{
    const inp = document.getElementById('reg_pass1');
    let classes = Object.values(btn.classList);
    inp.type = classes
    .includes('active') ? 
    'text' :
    'password';
});