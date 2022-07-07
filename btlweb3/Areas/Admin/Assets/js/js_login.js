let signin_form = document.querySelector('#signin-form')

let signin_btn = document.querySelector('#signin-btn')

validateEmail = (email) => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    return re.test(String(email).toLowerCase())
}

checkSigninInput = (input) => {
    let err_span = signin_form.querySelector(`span[data-err-for="${input.id}"]`)
    let val = input.value.trim()
    let form_group = input.parentElement

    switch(input.getAttribute('type')) {
        case 'password':
            if (val.length < 6) {
                form_group.classList.add('err')
                form_group.classList.remove('success')
                err_span.innerHTML = 'Password must be at least 6 characters'
            } else {
                form_group.classList.add('success')
                form_group.classList.remove('err')
                err_span.innerHTML = ''
            }
            break;
        case 'email':
            if (val.length === 0 || !validateEmail(val)) {
                form_group.classList.add('err')
                form_group.classList.remove('success')
                err_span.innerHTML = 'Email is invalid'
            } else {
                form_group.classList.add('success')
                form_group.classList.remove('err')
                err_span.innerHTML = ''
            }
    }
}

checkSigninForm = () => {
    let inputs = signin_form.querySelectorAll('.form-input')
    inputs.forEach(input => checkSigninInput(input))
}

signin_btn.onclick = () => {
    checkSigninForm()
}

let inputs = signin_form.querySelectorAll('.form-input')
inputs.forEach(input => {
    input.addEventListener('focusout', () => {
        checkSigninInput(input)
    })
})




signin_btn.onclick = () => {
    checksignin()
}
function alertlogin() {
    alert("Đăng nhập thành công !");
    }
function alertloginfail() {
    alert("Sai tên người dùng hoặc mật khẩu !");
    }
function trangquantri(){
    window.location="/Admin/Home/Index";
}



function getValue(id){
    return document.getElementById(id).value.trim();
}

function checksignin()
{
    var flag = "none";
     
    var username = getValue('signin-email');
    var password = getValue('signin-password');

    if (username == 'trantu143444@gmail.com' && password == '123456') {
        flag="admin";
    }
    if(flag=="admin"){
         alertlogin(); 
         setTimeout(trangquantri(),3000);
    }
    if(flag=="none"){
        alertloginfail();
    }
}