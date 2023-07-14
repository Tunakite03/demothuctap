var thisPage = {};

$(document).ready(function () {

    //them vao gio hang
    $(document).on('click', '#cancle-order', function () {
        // Show the SweetAlert confirmation dialog
        Swal.fire({
            title: 'Bạn có chắc chắn muốn xóa sản phẩm này?',
            text: "Hành động này không thể hoàn tác!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ'

        }).then((result) => {
            if (result.isConfirmed) {
                // var itemID = $(this).closest('.product-item').data('item-id');
                var order_id = $(this).data('order-id');
                var product_id = $(this).data('product-id');

                var data = new FormData();
                data.append('order_id', order_id)
                data.append('product_id', product_id)

                _doAjaxNodCustom('POST', data, 'order_detail', 'index', 'cancle-order', true, (res) => {

                    if (res.status === 200) {
                        Toastify({
                            text: res.message,
                            duration: 2000, // Set the duration for how long the toast should be displayed
                            gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                            close: true, // Enable the close button on the toast
                            backgroundColor: "#3cb815",
                        }).showToast();

                        $('#wrap_button').html(``);
                        $('#status-order').html(`<strong>Tình trạng: </strong> Đã hủy `)
                    } else {
                        Toastify({
                            text: res.message,
                            duration: 2000, // Set the duration for how long the toast should be displayed
                            gravity: "top-right", // Set the position of the toast (e.g., "top", "bottom", "center")
                            close: true, // Enable the close button on the toast
                            backgroundColor: "#FF0000",
                        }).showToast();
                        return false;
                    }
                })
            }
        });
    })

})