var thisPage = {};

$(document).ready(function () {

    //them vao gio hang
    $(document).on('click', '.add_to_cart', function () {

        // var itemID = $(this).closest('.product-item').data('item-id');
        var product_id = $(this).closest('.wrap_addtocart').find('input[type="number"]').data('product-id');

        var data = new FormData();
        data.append('product_id', product_id)
        data.append('quantity', 1);

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