// alert('a');

const btn = document.getElementById('btnPassView');
// console.log(btn.className);
btn.addEventListener ('click', ()=>{
    const inp = document.getElementById('reg_pass');
    let classes = Object.values(btn.classList);
    inp.type = classes
    .includes('active') ? 
    'text' :
    'password';
    inp.autofocus = "";
});