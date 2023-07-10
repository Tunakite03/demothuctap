var thisPage = {};

$(document).ready(function () {

    $('#plus').on('click', function () {
        var currentValue = parseInt($('#quantity-pro').val());
        $('#quantity-pro').val(currentValue + 1);
    });

    $('#minus').on('click', function () {
        var currentValue = parseInt($('#quantity-pro').val());
        if (currentValue > 1) {
            $('#quantity-pro').val(currentValue - 1);
        }
    });

    $('#quantity-pro').on('input', function (event) {
        var value = $(this).val();
        if (value === '0' || value === '-' || value === '+') {
            $(this).val('');
        }
    });

    $('#quantity-pro').on('input', function (event) {
        var value = $(this).val();
        value = value.replace(/[+]/g, '');
        $(this).val(value);
    });

    //them vao gio hang
    $('body').on('click', '#add_to_cart', function () {

        var data = new FormData();
        data.append('product_id', $('#product_id').val())
        data.append('quantity', $("#quantity-pro").val());

        _doAjaxNod('POST', data, 'cart_index', 'index', 'addtocart', true, (res) => {

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
                return false;
            }
        })

    });

})