$('body').on('click', '#updateuser', function () {



    // let status_error = false;
    // $(".err-modify-tv").remove();

    // if ($("#fullName").val() == '') {
    //     $("#fullName");
    // }
    // if ($("#email").val() == '') {
    //     $("#email").after(`<span class="err-modify-tv color-red"> * Vui lòng nhập mật khẩu.</span>`);
    //     status_error = true;
    // }
    // if ($("#phonenumber").val() == '') {
    //     $("#phonenumber").after(`<span class="err-modify-tv color-red"> * Vui lòng nhập mật khẩu.</span>`);
    //     status_error = true;
    // }

    // if (status_error) return false;

    var data = new FormData();

    data.append('fullname', $("#fullName").val());
    data.append('email', $("#email").val());
    data.append('phonenumber', $("#phonenumber").val());


    _doAjaxNod('POST', data, 'account_profile', 'profile', 'updateprofile', true, (res) => {

        if (res.status == 200) {
            Toastify({
                text: res.message,
                duration: 3000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#3cb815",
            }).showToast();
        } else {
            Toastify({
                text: res.message,
                duration: 3000, // Set the duration for how long the toast should be displayed
                gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                close: true, // Enable the close button on the toast
                backgroundColor: "#FF0000",
            }).showToast();
        }
    })

});