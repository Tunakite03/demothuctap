var thisPage = {};

//tạo tài khoản mới
$('body').on('keypress', '#inputRegisterUsername, #inputName, #inputEmail2, #inputPhonenumber, #inputPassword2, #repassword', function (event) {
    // Check if the Enter key is pressed
    if (event.which === 13) {
        event.preventDefault(); // Prevent the default behavior of the Enter key
        register(); // Call the register function
    }
});

$('body').on('click', '#btn_register', function (event) {
    event.preventDefault(); // Prevent the default click behavior of the register button
    register(); // Call the register function
});

function register() {

    $(".err-modify-tv").remove();
    $("#error_register").addClass('d-none');

    let status_error = false;

    if ($("#inputRegisterUsername").val() == '') {
        $("#inputRegisterUsername").after(`<span class="err-modify-tv color-red">* Vui lòng nhập tên tài khoản.</span>`);
        status_error = true;
    }
    if ($("#inputName").val() == '') {
        $("#inputName").after(`<span class="err-modify-tv color-red">* Vui lòng nhập Họ và Tên.</span>`);
        status_error = true;
    }
    if ($("#inputEmail2").val() == '') {
        $("#inputEmail2").after(`<span class="err-modify-tv color-red">* Vui lòng nhập email.</span>`);
        status_error = true;
    }
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (emailRegex.test(("#inputEmail2").val())) {
        $("#inputEmail2").after(`<span class="err-modify-tv color-red">* Vui lòng nhập đúng định dạng.</span>`);
        status_error = true;
    }

    if ($("#inputPhonenumber").val() == '' || $("#inputPhonenumber").val().length !== 10) {
        $("#inputPhonenumber").after(`<span class="err-modify-tv color-red">* Vui lòng nhập đúng số điện thoại.</span>`);
        status_error = true;
    }
    if ($("#inputPassword2").val() == '') {
        $("#inputPassword2").after(`<span class="err-modify-tv color-red">* Vui lòng nhập mật khẩu.</span>`);
        status_error = true;
    }
    if ($("#inputPassword2").val().length < 7) {
        $("#inputPassword2").after(`<span class="err-modify-tv color-red">* Vui lòng nhập mật khẩu.</span>`);
        status_error = true;
    }
    if ($("#repassword").val() == '') {
        $("#repassword").after(`<span class="err-modify-tv color-red">* Vui lòng nhập lại mật khẩu.</span>`);
        status_error = true;
    }
    if ($("#repassword").val() != $("#inputPassword2").val()) {
        $("#repassword").after(`<span class="err-modify-tv color-red">Mật khẩu không trùng khớp.</span>`);
        status_error = true;
    }

    if (status_error) return false;

    var data = new FormData();
    data.append('username', $("#inputRegisterUsername").val());
    data.append('fullname', $("#inputName").val());
    data.append('email', $("#inputEmail2").val());
    data.append('phonenumber', $("#inputPhonenumber").val());
    data.append('password', $("#inputPassword2").val());
    _doAjaxNodCustom('POST', data, 'account', 'index', 'register', true, (res) => {
        if (res.status == 200) {
            window.location = domain + '/';
        } else {
            $("#error_register").html(res.message);
            $("#error_register").removeClass('d-none');
            return false;
        }
    });
}


//đăng nhập
$('body').on('keypress', '#inputUsername, #inputPassword1', function (event) {
    // Check if the Enter key is pressed
    if (event.which === 13) {
        event.preventDefault(); // Prevent the default behavior of the Enter key
        login(); // Call the login function
    }
});

$('body').on('click', '#btn_login', function (event) {
    event.preventDefault(); // Prevent the default click behavior of the login button
    login(); // Call the login function
});

function login() {
    let status_error = false;
    $(".err-modify-tv").remove();

    if ($("#inputUsername").val() == '') {
        $("#inputUsername").after(`<span class="err-modify-tv color-red"> * Vui lòng nhập email hoặc số điện thoại.</span>`);
        status_error = true;
    }
    if ($("#inputPassword1").val() == '') {
        $("#inputPassword1").after(`<span class="err-modify-tv color-red"> * Vui lòng nhập mật khẩu.</span>`);
        status_error = true;
    }

    if (status_error) return false;

    var data = new FormData();

    data.append('username', $("#inputUsername").val());
    data.append('password', $("#inputPassword1").val());
    _doAjaxNodCustom('POST', data, 'account', 'index', 'login', true, (res) => {
        // console.log(res);
        if (res.status == 200) {
            window.location = domain + '/';
            localStorage.clear();
            if ($('#remember').is(':checked')) {
                localStorage.setItem('accountClient', $("#username").val());
            }
        } else {
            $("#error_login").html(res.message);
            $("#error_login").removeClass('d-none');
            return false;
        }
    });
}


