$('body').on('click', '#updateuser', function () {

    var data = new FormData();

    data.append('fullname', $("#fullName").val());
    data.append('email', $("#email").val());
    data.append('phonenumber', $("#phonenumber").val());


    _doAjaxNodCustom('POST', data, 'account_profile', 'profile', 'updateprofile', true, (res) => {

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
    }
    )

});
$('body').on('click', '#updateaddress', function () {


    var data = new FormData();

    data.append('province', $("#province").val());
    data.append('ward', $("#ward").val());
    data.append('district', $("#district").val());
    data.append('address', $("#address").val());


    _doAjaxNodCustom('POST', data, 'account_profile', 'profile', 'updateaddress', true, (res) => {

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
    }
    )

});